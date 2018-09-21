import { AbstractNamingStrategy } from "./AbstractNamingStrategy";
import { RelationInfo } from "./models/RelationInfo";
import { DatabaseModel } from "./models/DatabaseModel";

export class NamingStrategy extends AbstractNamingStrategy {
    relationName(
        columnOldName: string,
        relation: RelationInfo,
        dbModel: DatabaseModel
    ): string {
        let isRelationToMany = relation.isOneToMany || relation.isManyToMany;
        let ownerEntity = dbModel.entities.filter(v => {
            return v.entityName == relation.ownerTable;
        })[0];
        let referencedEntity = dbModel.entities.filter(v => {
            return v.entityName == relation.relatedTable;
        })[0];

        let columnName =
            columnOldName[0].toLowerCase() +
            columnOldName.substring(1, columnOldName.length);
        if (
            columnName
                .toLowerCase()
                .endsWith(
                    "id"
                ) /*&& !ownerEntity.columns.some(x=>x.tsName==columnName && x.isPrimary)*/
        ) {
            columnName = columnName.substring(
                0,
                columnName.toLowerCase().lastIndexOf("id")
            );
        }
        if (!isNaN(parseInt(columnName[columnName.length - 1]))) {
            columnName = columnName.substring(0, columnName.length - 1);
        }
        if (!isNaN(parseInt(columnName[columnName.length - 1]))) {
            columnName = columnName.substring(0, columnName.length - 1);
        }
        columnName += isRelationToMany ? "s" : "";

        if (
            relation.relationType != "ManyToMany" &&
            columnOldName != columnName
        ) {
            if (ownerEntity.columns.some(v => v.tsName == columnName)) {
                columnName = columnName + "_";
                for (let i = 2; i <= ownerEntity.columns.length; i++) {
                    columnName =
                        columnName.substring(
                            0,
                            columnName.length - i.toString().length
                        ) + i.toString();
                    if (
                        ownerEntity.columns.every(
                            v =>
                                v.tsName != columnName ||
                                columnName == columnOldName
                        )
                    )
                        break;
                }
            }
        }

        return columnName;
    }

    entityName(entityName: string): string {
        return entityName;
    }

    columnName(columnName: string): string {
        return columnName;
    }
}
