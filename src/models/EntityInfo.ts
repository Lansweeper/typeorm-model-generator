import { ColumnInfo } from "./ColumnInfo";
import { IndexInfo } from "./IndexInfo";
import { RelationInfo } from "./RelationInfo";

export class EntityInfo {
    EntityName: string;
    sqlName: string;
    Columns: ColumnInfo[];
    Imports: string[];
    Indexes: IndexInfo[];
    Schema: string | undefined;
    GenerateConstructor: boolean;

    deserialize(input: EntityInfo) {
        this.EntityName = input.EntityName;
        this.sqlName = input.sqlName;

        this.Imports = input.Imports;
        this.Indexes = input.Indexes;
        this.Schema = input.Schema;
        this.GenerateConstructor = input.GenerateConstructor;

        if (input.Columns) {
            this.Columns = [];
            input.Columns.forEach(column => {
                const c = new ColumnInfo().deserialize(column);
                this.Columns.push(c);
            });
        }

        return this;
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
