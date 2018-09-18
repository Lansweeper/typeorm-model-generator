import { ColumnInfo } from "./ColumnInfo";
import { RelationInfo } from "./RelationInfo";

export class EntityInfo {
    EntityName: string;
    Columns: ColumnInfo[];
    Imports: string[];
    UniqueImports: string[];
    Indexes: IndexInfo[];
    Schema: string;
    GenerateConstructor: boolean;

    relationImports(): any {
        var imports: string[] = [];
        this.Columns.forEach(column => {
            column.relations.forEach(relation => {
                if (this.EntityName != relation.relatedTable)
                    imports.push(relation.relatedTable);
            });
        });
        this.UniqueImports = imports.filter(function(elem, index, self) {
            return index == self.indexOf(elem);
        });
    }

    hasRelation(checkRelation: (relation: RelationInfo) => boolean): boolean {
        let rtn: boolean = false;
        this.Columns.forEach(column => {
            column.relations.forEach(relation => {
                if (checkRelation(relation)) {
                    rtn = true;
                }
            });
        });
        return rtn;
    }

    get hasOneToMany(): boolean {
        return this.hasRelation((relation: RelationInfo): boolean => {
            return relation.isOneToMany;
        });
    }

    get hasOneToOne(): boolean {
        return this.hasRelation((relation: RelationInfo) => {
            return relation.isOneToOne;
        });
    }

    get hasManyToMany(): boolean {
        return this.hasRelation((relation: RelationInfo) => {
            return relation.isManyToMany;
        });
    }

    get hasManyToOne(): boolean {
        return this.hasRelation((relation: RelationInfo) => {
            return relation.isManyToOne;
        });
    }

    get hasJoinColumn(): boolean {
        return this.hasOneToMany || this.hasOneToOne || this.hasManyToOne;
    }

    get hasIndexes(): boolean {
        return this.Indexes && this.Indexes.length > 0;
    }
}
