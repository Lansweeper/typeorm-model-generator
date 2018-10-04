import { ColumnInfo } from "./ColumnInfo";
import { IndexInfo } from "./IndexInfo";
import { RelationInfo } from "./RelationInfo";

export class EntityInfo {
    entityName: string;
    sqlName: string;
    orgName: string;
    description?: string;
    columns: ColumnInfo[];
    imports: string[];
    indexes: IndexInfo[];
    schema: string | undefined;
    generateConstructor: boolean;

    deserialize(input: any) {
        this.entityName = input.entityName;
        this.sqlName = input.sqlName;
        this.orgName = input.orgName;

        this.imports = input.imports;
        this.indexes = input.indexes;
        this.schema = input.schema;
        this.generateConstructor = input.generateConstructor;

        if (input.columns) {
            this.columns = [];
            input.columns.forEach(column => {
                const c = new ColumnInfo().deserialize(column);
                this.columns.push(c);
            });
        }

        return this;
    }

    hasRelation(checkRelation: (relation: RelationInfo) => boolean): boolean {
        let rtn: boolean = false;
        this.columns.forEach(column => {
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
        return this.indexes && this.indexes.length > 0;
    }
}
