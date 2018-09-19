import { AbstractDriver } from "./drivers/AbstractDriver";
import { DatabaseModel } from "./models/DatabaseModel";
import * as Handlebars from "handlebars";
import fs = require("fs");
import path = require("path");
import * as TomgUtils from "./Utils";
import changeCase = require("change-case");
import { AbstractNamingStrategy } from "./AbstractNamingStrategy";
import * as _ from "lodash";

export class Engine {
    constructor(
        private driver: AbstractDriver,
        public Options: EngineOptions
    ) {}

    public async createModelFromDatabase(): Promise<boolean> {
        let dbModel;
        if (this.Options.model) {
            dbModel = JSON.parse(fs.readFileSync(this.Options.model, "utf8"));
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
            element.Imports = [];
            element.Columns.forEach(column => {
                column.relations.forEach(relation => {
                    if (element.EntityName !== relation.relatedTable) {
                        element.Imports.push(relation.relatedTable);
                    }
                });
            });
            element.GenerateConstructor = this.Options.constructor;
            element.Imports.filter(function(elem, index, self) {
                return index === self.indexOf(elem);
            });
            let casedFileName = "";
            switch (this.Options.convertCaseFile) {
                case "camel":
                    casedFileName = changeCase.camelCase(element.EntityName);
                    break;
                case "param":
                    casedFileName = changeCase.paramCase(element.EntityName);
                    break;
                case "pascal":
                    casedFileName = changeCase.pascalCase(element.EntityName);
                    break;
                case "none":
                    casedFileName = element.EntityName;
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
            entity.EntityName = changeCase.pascalCase(entity.EntityName);
            entity.sqlName = entity.EntityName.toLowerCase();
            entity.Schema = undefined; // blank out

            const compareEntity = compareModel
                ? _.find(compareModel.entities, { sqlName: entity.sqlName })
                : undefined;
            if (compareModel) {
                if (compareEntity) {
                    entity.EntityName = compareEntity.EntityName;
                } else {
                    console.log("Could not find entity", entity.sqlName);
                }
            }

            entity.Columns.forEach(column => {
                column.tsName = changeCase.camelCase(column.tsName);

                column.sqlName = column.tsName.toLowerCase();
                if (column.sql_type === "character varying") {
                    column.sql_type = "varchar";
                }
                if (column.default === "'-1'::integer") {
                    column.default = "-1";
                }

                const compareColumn = compareEntity
                    ? _.find(compareEntity.Columns, { sqlName: column.sqlName })
                    : undefined;
                if (compareEntity) {
                    if (compareColumn) {
                        column.tsName = compareColumn.tsName;
                    } else if (
                        column.tsName.length > 3 &&
                        column.tsName
                            .substr(column.tsName.length - 3)
                            .toLowerCase() === "key"
                    ) {
                        if (
                            column.tsName.substr(
                                0,
                                column.tsName.length - 3
                            ) === entity.sqlName
                        ) {
                            column.tsName =
                                changeCase.camelCase(entity.EntityName) + "Key";
                        } else {
                            let name = column.tsName.substr(
                                0,
                                column.tsName.length - 3
                            );
                            if (
                                name.length > 2 &&
                                name.substr(name.length - 2).toLowerCase() ===
                                    "id"
                            ) {
                                if (
                                    name.substr(0, name.length - 2) ===
                                    entity.sqlName
                                ) {
                                    name =
                                        changeCase.camelCase(
                                            entity.EntityName
                                        ) + "Id";
                                } else {
                                    name =
                                        name.substr(0, name.length - 2) + "Id";
                                }
                            }
                            column.tsName = name + "Key";
                        }
                    } else if (
                        column.tsName.length > 2 &&
                        column.tsName
                            .substr(column.tsName.length - 2)
                            .toLowerCase() === "id"
                    ) {
                        if (
                            column.tsName.substr(
                                0,
                                column.tsName.length - 2
                            ) === entity.sqlName
                        ) {
                            column.tsName =
                                changeCase.camelCase(entity.EntityName) + "Id";
                        } else {
                            column.tsName =
                                column.tsName.substr(
                                    0,
                                    column.tsName.length - 2
                                ) + "Id";
                        }
                    } else if (column.sqlName == "lastmodifiedon") {
                        column.tsName = "lastModifiedOn";
                    } else if (column.sqlName == "lastmodifiedby") {
                        column.tsName = "lastModifiedBy";
                    } else if (column.sqlName == "createdat") {
                        column.tsName = "createdAt";
                    } else if (column.sqlName == "createdby") {
                        column.tsName = "createdBy";
                    } else if (
                        column.tsName.substr(column.tsName.length - 1) === "s"
                    ) {
                        const wrongRelation = _.find(compareEntity.Columns, {
                            sqlName: column.sqlName.substr(
                                0,
                                column.tsName.length - 1
                            )
                        });
                        if (wrongRelation) {
                            if (column.relations && wrongRelation.relations) {
                                console.log(
                                    "relations mismatch",
                                    entity.EntityName,
                                    column.tsName,
                                    column.relations[0].relationType,
                                    wrongRelation.relations[0].relationType
                                );
                            } else {
                                console.log(
                                    "relations mismatch",
                                    entity.EntityName,
                                    column.tsName,
                                    column.relations,
                                    wrongRelation.relations
                                );
                            }
                        } else {
                            console.log(
                                "Could not find column",
                                entity.EntityName,
                                column.tsName
                            );
                        }
                    } else {
                        console.log(
                            "Could not find column",
                            entity.EntityName,
                            column.tsName
                        );
                    }
                }
            });
        });

        if (this.Options.compare) {
            // loop back through and fix the relationships
            databaseModel.entities.forEach(entity => {
                entity.Columns.forEach(column => {
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
                                    relatedEntity.EntityName;
                                const relatedColumn = _.find(
                                    relatedEntity.Columns,
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
                            } else {
                                console.log(
                                    "Could not find related entity",
                                    relation.relatedTable,
                                    relation.relatedColumn
                                );
                            }
                            const ownerEntity = _.find(databaseModel.entities, {
                                sqlName: changeCase
                                    .pascalCase(relation.ownerTable)
                                    .toLowerCase()
                            });
                            if (ownerEntity) {
                                relation.ownerTable = ownerEntity.EntityName;
                                const ownerColumn = _.find(
                                    ownerEntity.Columns,
                                    {
                                        sqlName: changeCase
                                            .camelCase(relation.ownerColumn)
                                            .toLowerCase()
                                    }
                                );
                                if (ownerColumn) {
                                    relation.ownerColumn = ownerColumn.tsName;
                                } else {
                                    // special case doesn't matter
                                    // console.log('Could not find owner column', relation.ownerTable, relation.ownerColumn);
                                }
                            } else {
                                console.log(
                                    "Could not find owner entity",
                                    relation.ownerTable,
                                    relation.ownerColumn
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
