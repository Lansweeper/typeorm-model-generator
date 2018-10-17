import { AbstractDriver } from "./drivers/AbstractDriver";
import { DatabaseModel } from "./models/DatabaseModel";
import { ColumnInfo } from "./models/ColumnInfo";
import { EntityInfo } from "./models/EntityInfo";
import * as Handlebars from "handlebars";
import fs = require("fs");
import path = require("path");
import * as TomgUtils from "./Utils";
import changeCase = require("change-case");
import { AbstractNamingStrategy } from "./AbstractNamingStrategy";
import * as _ from "lodash";
import { updateModel } from "./updateModel";

export class Engine {
    constructor(
        private driver: AbstractDriver,
        public Options: EngineOptions
    ) {}

    public async createModelFromDatabase(): Promise<boolean> {
        let dbModel;
        if (this.Options.model) {
            const modelFile = fs.readFileSync(this.Options.model, "utf8");
            const updatedModel = updateModel(JSON.parse(modelFile));

            dbModel = new DatabaseModel().deserialize(updatedModel);
        } else {
            dbModel = await this.getEntitiesInfo(
                this.Options.databaseName,
                this.Options.host,
                this.Options.port,
                this.Options.user,
                this.Options.password,
                this.Options.schemaName,
                this.Options.ssl,
                this.Options.namingStrategy,
                this.Options.relationIds
            );
        }
        if (dbModel.entities.length > 0) {
            this.createModelFromMetadata(dbModel);
        } else {
            TomgUtils.LogError(
                "Tables not found in selected database. Skipping creation of typeorm model.",
                false
            );
        }
        return true;
    }
    private async getEntitiesInfo(
        database: string,
        server: string,
        port: number,
        user: string,
        password: string,
        schemaName: string,
        ssl: boolean,
        namingStrategy: AbstractNamingStrategy,
        relationIds: boolean
    ): Promise<DatabaseModel> {
        return await this.driver.GetDataFromServer(
            database,
            server,
            port,
            user,
            password,
            schemaName,
            ssl,
            namingStrategy,
            relationIds
        );
    }
    private createModelFromMetadata(databaseModel: DatabaseModel) {
        this.createHandlebarsHelpers();
        let templatePath = path.resolve(__dirname, "../../src/entity.mst");
        let template = fs.readFileSync(templatePath, "UTF-8");
        let resultPath = this.Options.resultsPath;
        if (!fs.existsSync(resultPath)) fs.mkdirSync(resultPath);
        let entitesPath = resultPath;

        this.createModelFile(resultPath, databaseModel);
        console.log("Config", this.Options);

        if (!this.Options.noConfigs) {
            this.createTsConfigFile(resultPath);
            this.createTypeOrmConfig(resultPath);
            entitesPath = path.resolve(resultPath, "./entities");
            if (!fs.existsSync(entitesPath)) fs.mkdirSync(entitesPath);
        }
        let compliedTemplate = Handlebars.compile(template, { noEscape: true });
        databaseModel.entities.forEach(element => {
            element.imports = [];
            element.columns.forEach(column => {
                column.relations.forEach(relation => {
                    if (element.entityName !== relation.relatedTable) {
                        element.imports.push(relation.relatedTable);
                    }
                });
            });
            element.generateConstructor = this.Options.constructor;
            element.imports = element.imports.filter(function(
                elem,
                index,
                self
            ) {
                return index === self.indexOf(elem);
            });
            let casedFileName = "";
            switch (this.Options.convertCaseFile) {
                case "camel":
                    casedFileName = changeCase.camelCase(element.entityName);
                    break;
                case "param":
                    casedFileName = changeCase.paramCase(element.entityName);
                    break;
                case "pascal":
                    casedFileName = changeCase.pascalCase(element.entityName);
                    break;
                case "none":
                    casedFileName = element.entityName;
                    break;
            }
            let resultFilePath = path.resolve(
                entitesPath,
                casedFileName + ".ts"
            );
            let rendered = compliedTemplate(element);
            fs.writeFileSync(resultFilePath, rendered, {
                encoding: "UTF-8",
                flag: "w"
            });
        });
    }
    private createHandlebarsHelpers() {
        Handlebars.registerHelper("curly", open => {
            return open ? "{" : "}";
        });
        Handlebars.registerHelper("toEntityName", str => {
            let retStr = "";
            switch (this.Options.convertCaseEntity) {
                case "camel":
                    retStr = changeCase.camelCase(str);
                    break;
                case "pascal":
                    retStr = changeCase.pascalCase(str);
                    break;
                case "none":
                    retStr = str;
                    break;
            }
            return retStr;
        });
        Handlebars.registerHelper("concat", (stra, strb) => {
            return stra + strb;
        });
        Handlebars.registerHelper("toFileName", str => {
            let retStr = "";
            switch (this.Options.convertCaseFile) {
                case "camel":
                    retStr = changeCase.camelCase(str);
                    break;
                case "param":
                    retStr = changeCase.paramCase(str);
                    break;
                case "pascal":
                    retStr = changeCase.pascalCase(str);
                    break;
                case "none":
                    retStr = str;
                    break;
            }
            return retStr;
        });
        Handlebars.registerHelper("toPropertyName", str => {
            let retStr = "";
            switch (this.Options.convertCaseProperty) {
                case "camel":
                    retStr = changeCase.camelCase(str);
                    break;
                case "pascal":
                    retStr = changeCase.pascalCase(str);
                    break;
                case "none":
                    retStr = str;
                    break;
            }
            return retStr;
        });
        Handlebars.registerHelper("toLowerCase", str => {
            return str.toLowerCase();
        });
        Handlebars.registerHelper("toLazy", str => {
            if (this.Options.lazy) return `Promise<${str}>`;
            else return str;
        });
        Handlebars.registerHelper({
            eq: function(v1, v2) {
                return v1 === v2;
            },
            ne: function(v1, v2) {
                return v1 !== v2;
            },
            lt: function(v1, v2) {
                return v1 < v2;
            },
            gt: function(v1, v2) {
                return v1 > v2;
            },
            lte: function(v1, v2) {
                return v1 <= v2;
            },
            gte: function(v1, v2) {
                return v1 >= v2;
            },
            and: function(v1, v2) {
                return v1 && v2;
            },
            or: function(v1, v2) {
                return v1 || v2;
            }
        });
        Handlebars.registerHelper("escapeQuote", str => {
            return str.replace(/'/g, "\\'");
        });
    }

    private createModelFile(resultPath: string, databaseModel: DatabaseModel) {
        let compareModel: DatabaseModel;
        if (this.Options.compare) {
            compareModel = JSON.parse(
                fs.readFileSync(this.Options.compare, "utf8")
            );
        }

        // update model so that we have the case we want, hack which makes --cp and --ce useless
        databaseModel.entities.forEach(entity => {
            entity.entityName = changeCase.pascalCase(entity.entityName);
            entity.sqlName = entity.entityName.toLowerCase();
            entity.schema = undefined; // blank out

            const compareEntity = compareModel
                ? _.find(compareModel.entities, { sqlName: entity.sqlName })
                : undefined;
            if (compareModel) {
                if (compareEntity) {
                    entity.entityName = compareEntity.entityName;
                    entity.orgName = compareEntity.orgName;
                } else {
                    console.log("Could not find entity", entity.sqlName);
                }
            }

            if (!entity.orgName) {
                entity.orgName = entity.entityName;
            }

            entity.columns.forEach(column => {
                column.tsName = changeCase.camelCase(column.tsName);

                column.sqlName = column.tsName.toLowerCase();
                if (column.sql_type === "character varying") {
                    column.sql_type = "varchar";
                }
                if (column.default === "'-1'::integer") {
                    column.default = "-1";
                }

                const compareColumn = compareEntity
                    ? _.find(compareEntity.columns, { sqlName: column.sqlName })
                    : undefined;
                if (compareEntity) {
                    if (compareColumn) {
                        column.tsName = compareColumn.tsName;
                        column.orgName = compareColumn.orgName;
                    } else if (
                        !this.cleanColumnName(column.sqlName, column, entity)
                    ) {
                        if (
                            column.tsName.substr(column.tsName.length - 1) ===
                            "s"
                        ) {
                            const wrongRelation = _.find(
                                compareEntity.columns,
                                {
                                    sqlName: column.sqlName.substr(
                                        0,
                                        column.sqlName.length - 1
                                    )
                                }
                            );
                            if (wrongRelation) {
                                if (
                                    column.relations &&
                                    wrongRelation.relations
                                ) {
                                    console.log(
                                        "relations mismatch",
                                        entity.entityName,
                                        column.tsName,
                                        column.relations[0].relationType,
                                        wrongRelation.relations[0].relationType
                                    );
                                } else {
                                    console.log(
                                        "relations mismatch",
                                        entity.entityName,
                                        column.tsName,
                                        column.relations,
                                        wrongRelation.relations
                                    );
                                }
                            } else {
                                console.log(
                                    "Could not find relationship column",
                                    entity.entityName,
                                    column.tsName
                                );
                            }
                        } else {
                            console.log(
                                "Could not find column",
                                entity.entityName,
                                column.tsName
                            );
                        }
                    }
                } else {
                    this.cleanColumnName(column.tsName, column, entity);
                }

                if (!column.orgName) {
                    column.orgName = column.tsName;
                }
            });

            entity.indexes.forEach(index => {
                index.columns.forEach(indexCol => {
                    const columnInfo = _.find(entity.columns, {
                        sqlName: changeCase
                            .camelCase(indexCol.name)
                            .toLowerCase()
                    });
                    if (columnInfo) {
                        indexCol.name = columnInfo.tsName;
                    }
                });
            });
        });

        if (this.Options.compare) {
            // loop back through and fix the relationships
            databaseModel.entities.forEach(entity => {
                entity.columns.forEach(column => {
                    if (column.relations) {
                        column.relations.forEach(relation => {
                            const relatedEntity = _.find(
                                databaseModel.entities,
                                {
                                    sqlName: changeCase
                                        .pascalCase(relation.relatedTable)
                                        .toLowerCase()
                                }
                            );
                            if (relatedEntity) {
                                relation.relatedTable =
                                    relatedEntity.entityName;
                                const relatedColumn = _.find(
                                    relatedEntity.columns,
                                    {
                                        sqlName: changeCase
                                            .camelCase(relation.relatedColumn)
                                            .toLowerCase()
                                    }
                                );
                                if (relatedColumn) {
                                    relation.relatedColumn =
                                        relatedColumn.tsName;
                                } else {
                                    console.log(
                                        "Could not find related column",
                                        relation.relatedTable,
                                        relation.relatedColumn
                                    );
                                }
                                const ownerEntity = _.find(
                                    databaseModel.entities,
                                    {
                                        sqlName: changeCase
                                            .pascalCase(relation.ownerTable)
                                            .toLowerCase()
                                    }
                                );
                                if (ownerEntity) {
                                    relation.ownerTable =
                                        ownerEntity.entityName;
                                    const ownerColumn = _.find(
                                        ownerEntity.columns,
                                        {
                                            sqlName: changeCase
                                                .camelCase(relation.ownerColumn)
                                                .toLowerCase()
                                        }
                                    );
                                    if (ownerColumn) {
                                        relation.ownerColumn =
                                            ownerColumn.tsName;
                                    } else {
                                        const ownerColumn = _.find(
                                            relatedEntity.columns,
                                            {
                                                sqlName: changeCase
                                                    .camelCase(
                                                        relation.ownerColumn
                                                    )
                                                    .toLowerCase()
                                            }
                                        );
                                        if (ownerColumn) {
                                            relation.ownerColumn =
                                                ownerColumn.tsName;
                                        } else {
                                            console.log(
                                                "Could not find owner column",
                                                relation.ownerTable,
                                                relation.ownerColumn
                                            );
                                        }
                                    }
                                } else {
                                    console.log(
                                        "Could not find owner entity",
                                        relation.ownerTable,
                                        relation.ownerColumn
                                    );
                                }
                            } else {
                                console.log(
                                    "Could not find related entity",
                                    relation.relatedTable,
                                    relation.relatedColumn
                                );
                            }
                        });
                    }
                });
            });
        }

        fs.writeFileSync(
            path.resolve(resultPath, "databaseModel.json"),
            JSON.stringify(databaseModel, null, 2),
            { encoding: "UTF-8", flag: "w" }
        );
    }

    private cleanColumnName(
        name: string,
        column: ColumnInfo,
        entity: EntityInfo
    ): boolean {
        let rtn = true;
        if (
            name.length > 3 &&
            name.substr(name.length - 3).toLowerCase() === "key"
        ) {
            if (name.substr(0, name.length - 3) === entity.sqlName) {
                column.tsName = changeCase.camelCase(entity.entityName) + "Key";
            } else {
                let colName = name.substr(0, name.length - 3);
                if (
                    colName.length > 2 &&
                    colName.substr(colName.length - 2).toLowerCase() === "id"
                ) {
                    if (
                        colName.substr(0, colName.length - 2) === entity.sqlName
                    ) {
                        colName =
                            changeCase.camelCase(entity.entityName) + "Id";
                    } else {
                        colName = colName.substr(0, colName.length - 2) + "Id";
                    }
                }
                column.tsName = colName + "Key";
            }
        } else if (
            name.length > 2 &&
            name.substr(name.length - 2).toLowerCase() === "id"
        ) {
            if (name.substr(0, name.length - 2) === entity.sqlName) {
                column.tsName = changeCase.camelCase(entity.entityName) + "Id";
            } else {
                column.tsName = name.substr(0, name.length - 2) + "Id";
            }
        } else if (name == "lastmodifiedon") {
            column.tsName = "lastModifiedOn";
        } else if (name == "lastmodifiedby") {
            column.tsName = "lastModifiedBy";
        } else if (name.substr(name.length - 2) === "at") {
            column.tsName = name.substr(0, name.length - 2) + "At";
        } else if (name.substr(name.length - 2) === "by") {
            column.tsName = name.substr(0, name.length - 2) + "By";
        } else {
            rtn = false;
        }
        return rtn;
    }

    //TODO:Move to mustache template file
    private createTsConfigFile(resultPath) {
        fs.writeFileSync(
            path.resolve(resultPath, "tsconfig.json"),
            `{"compilerOptions": {
        "lib": ["es5", "es6"],
        "target": "es6",
        "module": "commonjs",
        "moduleResolution": "node",
        "emitDecoratorMetadata": true,
        "experimentalDecorators": true,
        "sourceMap": true
    }}`,
            { encoding: "UTF-8", flag: "w" }
        );
    }
    private createTypeOrmConfig(resultPath) {
        if (this.Options.schemaName == "") {
            fs.writeFileSync(
                path.resolve(resultPath, "ormconfig.json"),
                `[
  {
    "name": "default",
    "type": "${this.Options.databaseType}",
    "host": "${this.Options.host}",
    "port": ${this.Options.port},
    "username": "${this.Options.user}",
    "password": "${this.Options.password}",
    "database": "${this.Options.databaseName}",
    "synchronize": false,
    "entities": [
      "entities/*.js"
    ]
  }
]`,
                { encoding: "UTF-8", flag: "w" }
            );
        } else {
            fs.writeFileSync(
                path.resolve(resultPath, "ormconfig.json"),
                `[
  {
    "name": "default",
    "type": "${this.Options.databaseType}",
    "host": "${this.Options.host}",
    "port": ${this.Options.port},
    "username": "${this.Options.user}",
    "password": "${this.Options.password}",
    "database": "${this.Options.databaseName}",
    "schema": "${this.Options.schemaName}",
    "synchronize": false,
    "entities": [
      "entities/*.js"
    ]
  }
]`,
                { encoding: "UTF-8", flag: "w" }
            );
        }
    }
}
export interface EngineOptions {
    host: string;
    port: number;
    databaseName: string;
    user: string;
    password: string;
    resultsPath: string;
    databaseType: string;
    schemaName: string;
    ssl: boolean;
    noConfigs: boolean;
    convertCaseFile: "pascal" | "param" | "camel" | "none";
    convertCaseEntity: "pascal" | "camel" | "none";
    convertCaseProperty: "pascal" | "camel" | "none";
    lazy: boolean;
    constructor: boolean;
    namingStrategy: AbstractNamingStrategy;
    relationIds: boolean;
    model?: string;
    compare?: string;
}
