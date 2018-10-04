import { RelationInfo } from "./RelationInfo";

export class ColumnInfo {
    tsName: string = "";
    sqlName: string = "";
    orgName: string;
    description?: string;
    visible: boolean = true;
    default: string | null = null;
    is_nullable: boolean = false;
    is_unique: boolean = false;
    ts_type:
        | "number"
        | "string"
        | "boolean"
        | "Date"
        | "Buffer"
        | "Object"
        | "string | Object"
        | "string | string[]"
        | "any";
    sql_type: string;
    length: number | null = null;
    width: number | null = null;
    isPrimary: boolean = false;
    is_generated: boolean = false;
    is_array: boolean = false;
    numericPrecision: number | null = null;
    numericScale: number | null = null;
    enumOptions: string | null = null;
    relations: RelationInfo[];
    constructor() {
        this.relations = [];
    }

    deserialize(input: any) {
        for (let prop in input) {
            if (!input.hasOwnProperty(prop)) {
                continue;
            }

            if (prop === "relations") {
                this.relations = [];
                input.relations.forEach(relation => {
                    this.relations.push(
                        new RelationInfo().deserialize(relation)
                    );
                });
            } else {
                this[prop] = input[prop];
            }
        }
        if (input["lenght"]) {
            this.length = input["lenght"];
        }

        return this;
    }
}
