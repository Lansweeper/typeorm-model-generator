import { EntityInfo } from "../models/EntityInfo";
import { DatabaseModel } from "../models/DatabaseModel";
import { IndexInfo } from "../models/IndexInfo";
import * as TomgUtils from "../Utils";
import { RelationInfo } from "../models/RelationInfo";
import { ColumnInfo } from "../models/ColumnInfo";
import {
    WithWidthColumnType,
    WithPrecisionColumnType,
    WithLengthColumnType
} from "typeorm/driver/types/ColumnTypes";
import { AbstractNamingStrategy } from "../AbstractNamingStrategy";

export abstract class AbstractDriver {
    changeColumnNames(dbModel: DatabaseModel) {
        dbModel.entities.forEach(entity => {
            entity.columns.forEach(column => {
                let newName = this.namingStrategy.columnName(column.tsName);
                entity.indexes.forEach(index => {
                    index.columns
                        .filter(column2 => {
                            return column2.name == column.tsName;
                        })
                        .forEach(column2 => {
                            column2.name = newName;
                        });
                });
                dbModel.entities.forEach(entity2 => {
                    entity2.columns.forEach(column2 => {
                        column2.relations
                            .filter(relation => {
                                return (
                                    relation.relatedTable ==
                                        entity.entityName &&
                                    relation.relatedColumn == column.tsName
                                );
                            })
                            .map(v => {
                                v.relatedColumn = newName;
                            });
                        column2.relations
                            .filter(relation => {
                                return (
                                    relation.relatedTable ==
                                        entity.entityName &&
                                    relation.ownerColumn == column.tsName
                                );
                            })
                            .map(v => {
                                v.ownerColumn = newName;
                            });
                    });
                });

                column.tsName = newName;
            });
        });
    }
    changeEntityNames(dbModel: DatabaseModel) {
        dbModel.entities.forEach(entity => {
            let newName = this.namingStrategy.entityName(entity.entityName);
            dbModel.entities.forEach(entity2 => {
                entity2.columns.forEach(column => {
                    column.relations.forEach(relation => {
                        if (relation.ownerTable == entity.entityName)
                            relation.ownerTable = newName;
                        if (relation.relatedTable == entity.entityName)
                            relation.relatedTable = newName;
                    });
                });
            });
            entity.entityName = newName;
        });
    }
    changeRelationNames(dbModel: DatabaseModel) {
        dbModel.entities.forEach(entity => {
            entity.columns.forEach(column => {
                column.relations.forEach(relation => {
                    if (true || !relation.isOwner) {
                        let newName = this.namingStrategy.relationName(
                            column.tsName,
                            relation,
                            dbModel
                        );
                        dbModel.entities.forEach(entity2 => {
                            entity2.columns.forEach(column2 => {
                                column2.relations.forEach(relation2 => {
                                    if (
                                        relation2.relatedTable ==
                                            entity.entityName &&
                                        relation2.ownerColumn == column.tsName
                                    ) {
                                        relation2.ownerColumn = newName;
                                    }
                                    if (
                                        relation2.relatedTable ==
                                            entity.entityName &&
                                        relation2.relatedColumn == column.tsName
                                    ) {
                                        relation2.relatedColumn = newName;
                                    }
                                    if (relation.isOwner) {
                                        entity.indexes.forEach(ind => {
                                            ind.columns.forEach(col => {
                                                if (col.name == column.tsName) {
                                                    col.name = newName;
                                                }
                                            });
                                        });
                                    }
                                });
                            });
                        });
                        column.tsName = newName;
                    }
                });
            });
        });
    }
    ColumnTypesWithWidth: WithWidthColumnType[] = [
        "tinyint",
        "smallint",
        "mediumint",
        "int",
        "bigint"
    ];
    ColumnTypesWithPrecision: WithPrecisionColumnType[] = [
        "float",
        "double",
        "dec",
        "decimal",
        "numeric",
        "real",
        "double precision",
        "number",
        "datetime",
        "datetime2",
        "datetimeoffset",
        "time",
        "time with time zone",
        "time without time zone",
        "timestamp",
        "timestamp without time zone",
        "timestamp with time zone",
        "timestamp with local time zone"
    ];
    ColumnTypesWithLength: WithLengthColumnType[] = [
        "character varying",
        "varying character",
        "nvarchar",
        "character",
        "native character",
        "varchar",
        "char",
        "nchar",
        "varchar2",
        "nvarchar2",
        "raw",
        "binary",
        "varbinary"
    ];
    namingStrategy: AbstractNamingStrategy;
    generateRelationsIds: boolean;

    FindManyToManyRelations(dbModel: DatabaseModel) {
        let manyToManyEntities = dbModel.entities.filter(entity => {
            return (
                entity.columns.filter(column => {
                    return (
                        column.relations.length == 1 &&
                        !column.relations[0].isOneToMany &&
                        column.relations[0].isOwner
                    );
                }).length == entity.columns.length
            );
        });
        manyToManyEntities.map(entity => {
            let relations: RelationInfo[] = [];
            relations = entity.columns.reduce((prev: RelationInfo[], curr) => {
                return prev.concat(curr.relations);
            }, relations);
            let namesOfRelatedTables = relations
                .map(v => v.relatedTable)
                .filter((v, i, s) => s.indexOf(v) == i);
            if (namesOfRelatedTables.length == 2) {
                let relatedTable1 = dbModel.entities.filter(
                    v => v.entityName == namesOfRelatedTables[0]
                )[0];
                relatedTable1.columns = relatedTable1.columns.filter(
                    v =>
                        !v.tsName
                            .toLowerCase()
                            .startsWith(entity.entityName.toLowerCase())
                );
                let relatedTable2 = dbModel.entities.filter(
                    v => v.entityName == namesOfRelatedTables[1]
                )[0];
                relatedTable2.columns = relatedTable2.columns.filter(
                    v =>
                        !v.tsName
                            .toLowerCase()
                            .startsWith(entity.entityName.toLowerCase())
                );
                dbModel.entities = dbModel.entities.filter(ent => {
                    return ent.entityName != entity.entityName;
                });

                let column1 = new ColumnInfo();
                column1.tsName = namesOfRelatedTables[1];

                let col1Rel = new RelationInfo();
                col1Rel.relatedTable = namesOfRelatedTables[1];
                col1Rel.relatedColumn = namesOfRelatedTables[1];

                col1Rel.relationType = "ManyToMany";
                col1Rel.isOwner = true;
                col1Rel.ownerColumn = namesOfRelatedTables[0];

                column1.relations.push(col1Rel);
                relatedTable1.columns.push(column1);

                let column2 = new ColumnInfo();
                column2.tsName = namesOfRelatedTables[0];

                let col2Rel = new RelationInfo();
                col2Rel.relatedTable = namesOfRelatedTables[0];
                col2Rel.relatedColumn = namesOfRelatedTables[1];

                col2Rel.relationType = "ManyToMany";
                col2Rel.isOwner = false;
                column2.relations.push(col2Rel);
                relatedTable2.columns.push(column2);
            }
        });
    }
    async GetDataFromServer(
        database: string,
        server: string,
        port: number,
        user: string,
        password: string,
        schema: string,
        ssl: boolean,
        namingStrategy: AbstractNamingStrategy,
        relationIds: boolean
    ): Promise<DatabaseModel> {
        this.generateRelationsIds = relationIds;
        let dbModel = <DatabaseModel>{};
        this.namingStrategy = namingStrategy;
        await this.ConnectToServer(database, server, port, user, password, ssl);
        let sqlEscapedSchema = "'" + schema.split(",").join("','") + "'";
        dbModel.entities = await this.GetAllTables(sqlEscapedSchema);
        await this.GetCoulmnsFromEntity(dbModel.entities, sqlEscapedSchema);
        await this.GetIndexesFromEntity(dbModel.entities, sqlEscapedSchema);
        dbModel.entities = await this.GetRelations(
            dbModel.entities,
            sqlEscapedSchema
        );
        await this.DisconnectFromServer();
        this.FindManyToManyRelations(dbModel);
        this.FindPrimaryColumnsFromIndexes(dbModel);
        this.ApplyNamingStrategy(dbModel);
        return dbModel;
    }

    private ApplyNamingStrategy(dbModel: DatabaseModel) {
        this.changeRelationNames(dbModel);
        this.changeEntityNames(dbModel);
        this.changeColumnNames(dbModel);
    }

    abstract async ConnectToServer(
        database: string,
        server: string,
        port: number,
        user: string,
        password: string,
        ssl: boolean
    );

    abstract GetAllTablesQuery: (
        schema: string
    ) => Promise<
        {
            TABLE_SCHEMA: string;
            TABLE_NAME: string;
        }[]
    >;

    async GetAllTables(schema: string): Promise<EntityInfo[]> {
        let response = await this.GetAllTablesQuery(schema);
        let ret: EntityInfo[] = <EntityInfo[]>[];
        response.forEach(val => {
            let ent: EntityInfo = new EntityInfo();
            ent.entityName = val.TABLE_NAME;
            ent.orgName = val.TABLE_NAME;
            ent.schema = val.TABLE_SCHEMA;
            ent.columns = <ColumnInfo[]>[];
            ent.indexes = <IndexInfo[]>[];
            ret.push(ent);
        });
        return ret;
    }

    GetRelationsFromRelationTempInfo(
        relationsTemp: RelationTempInfo[],
        entities: EntityInfo[]
    ) {
        relationsTemp.forEach(relationTmp => {
            let ownerEntity = entities.find(entitity => {
                return entitity.entityName == relationTmp.ownerTable;
            });
            if (!ownerEntity) {
                TomgUtils.LogError(
                    `Relation between tables ${relationTmp.ownerTable} and ${
                        relationTmp.referencedTable
                    } didn't found entity model ${relationTmp.ownerTable}.`
                );
                return;
            }
            let referencedEntity = entities.find(entitity => {
                return entitity.entityName == relationTmp.referencedTable;
            });
            if (!referencedEntity) {
                TomgUtils.LogError(
                    `Relation between tables ${relationTmp.ownerTable} and ${
                        relationTmp.referencedTable
                    } didn't found entity model ${relationTmp.referencedTable}.`
                );
                return;
            }
            for (
                let relationColumnIndex = 0;
                relationColumnIndex < relationTmp.ownerColumnsNames.length;
                relationColumnIndex++
            ) {
                let ownerColumn = ownerEntity.columns.find(column => {
                    return (
                        column.tsName ==
                        relationTmp.ownerColumnsNames[relationColumnIndex]
                    );
                });
                if (!ownerColumn) {
                    TomgUtils.LogError(
                        `Relation between tables ${
                            relationTmp.ownerTable
                        } and ${
                            relationTmp.referencedTable
                        } didn't found entity column ${
                            relationTmp.ownerTable
                        }.${ownerColumn}.`
                    );
                    return;
                }
                let relatedColumn = referencedEntity.columns.find(column => {
                    return (
                        column.tsName ==
                        relationTmp.referencedColumnsNames[relationColumnIndex]
                    );
                });
                if (!relatedColumn) {
                    TomgUtils.LogError(
                        `Relation between tables ${
                            relationTmp.ownerTable
                        } and ${
                            relationTmp.referencedTable
                        } didn't found entity column ${
                            relationTmp.referencedTable
                        }.${relatedColumn}.`
                    );
                    return;
                }
                let isOneToMany: boolean;
                isOneToMany = false;
                let index = ownerEntity.indexes.find(index => {
                    return (
                        index.isUnique &&
                        index.columns.some(col => {
                            return col.name == ownerColumn!.tsName;
                        })
                    );
                });
                isOneToMany = !index;

                let ownerRelation = new RelationInfo();
                ownerRelation.actionOnDelete = relationTmp.actionOnDelete;
                ownerRelation.actionOnUpdate = relationTmp.actionOnUpdate;
                ownerRelation.isOwner = true;
                ownerRelation.relatedColumn = relatedColumn.tsName.toLowerCase();
                ownerRelation.relatedTable = relationTmp.referencedTable;
                ownerRelation.ownerTable = relationTmp.ownerTable;
                ownerRelation.relationType = isOneToMany
                    ? "ManyToOne"
                    : "OneToOne";
                ownerRelation.relationIdField = this.generateRelationsIds;

                let columnName = ownerEntity.entityName;
                if (
                    referencedEntity.columns.some(v => v.tsName == columnName)
                ) {
                    columnName = columnName + "_";
                    for (let i = 2; i <= referencedEntity.columns.length; i++) {
                        columnName =
                            columnName.substring(
                                0,
                                columnName.length - i.toString().length
                            ) + i.toString();
                        if (
                            referencedEntity.columns.every(
                                v => v.tsName != columnName
                            )
                        )
                            break;
                    }
                }

                ownerRelation.ownerColumn = columnName;
                ownerColumn.relations.push(ownerRelation);
                if (isOneToMany) {
                    let col = new ColumnInfo();
                    col.tsName = columnName;
                    let referencedRelation = new RelationInfo();
                    col.relations.push(referencedRelation);
                    referencedRelation.actionOnDelete =
                        relationTmp.actionOnDelete;
                    referencedRelation.actionOnUpdate =
                        relationTmp.actionOnUpdate;
                    referencedRelation.isOwner = false;
                    referencedRelation.relatedColumn = ownerColumn.tsName;
                    referencedRelation.relatedTable = relationTmp.ownerTable;
                    referencedRelation.ownerTable = relationTmp.referencedTable;
                    referencedRelation.ownerColumn = relatedColumn.tsName;
                    referencedRelation.relationType = "OneToMany";
                    referencedEntity.columns.push(col);
                } else {
                    let col = new ColumnInfo();
                    col.tsName = columnName;
                    let referencedRelation = new RelationInfo();
                    col.relations.push(referencedRelation);
                    referencedRelation.actionOnDelete =
                        relationTmp.actionOnDelete;
                    referencedRelation.actionOnUpdate =
                        relationTmp.actionOnUpdate;
                    referencedRelation.isOwner = false;
                    referencedRelation.relatedColumn = ownerColumn.tsName;
                    referencedRelation.relatedTable = relationTmp.ownerTable;
                    referencedRelation.ownerTable = relationTmp.referencedTable;
                    referencedRelation.ownerColumn = relatedColumn.tsName;
                    referencedRelation.relationType = "OneToOne";
                    referencedEntity.columns.push(col);
                }
            }
        });
        return entities;
    }
    abstract async GetCoulmnsFromEntity(
        entities: EntityInfo[],
        schema: string
    ): Promise<EntityInfo[]>;
    abstract async GetIndexesFromEntity(
        entities: EntityInfo[],
        schema: string
    ): Promise<EntityInfo[]>;
    abstract async GetRelations(
        entities: EntityInfo[],
        schema: string
    ): Promise<EntityInfo[]>;

    FindPrimaryColumnsFromIndexes(dbModel: DatabaseModel) {
        dbModel.entities.forEach(entity => {
            let primaryIndex = entity.indexes.find(v => v.isPrimaryKey);
            entity.columns.forEach(col => {
                if (
                    primaryIndex &&
                    primaryIndex.columns.some(
                        cIndex => cIndex.name == col.tsName
                    )
                )
                    col.isPrimary = true;
            });
            if (
                !entity.columns.some(v => {
                    return v.isPrimary;
                })
            ) {
                TomgUtils.LogError(
                    `Table ${entity.entityName} has no PK.`,
                    false
                );
                return;
            }
        });
    }
    abstract async DisconnectFromServer();
    abstract async CreateDB(dbName: string);
    abstract async DropDB(dbName: string);
    abstract async UseDB(dbName: string);
    abstract async CheckIfDBExists(dbName: string): Promise<boolean>;
}
