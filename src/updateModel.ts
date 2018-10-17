import { DatabaseModel } from "./models/DatabaseModel";

const { find } = require("lodash");
const Parser = require("parse-xl");
const mappingData = new Parser("mapping.xlsx");
const mapping = mappingData.data.Sheet1;

// Case insensitive find
const findCache = {};
function find2(arr: any[], str: string) {
    if (!findCache[str]) {
        findCache[str] = find(arr, item => {
            return item.table.toLowerCase() === str.toLowerCase();
        });
    }
    return findCache[str];
}

function getNewTableName(name: string) {
    const match = find2(mapping, name);
    if (match) {
        console.warn("Found match for", name, " == ", match.new);
        return match ? match.new : name;
    }
    //console.error("No match for", name);
    return name;
}

function getNewColumnName(name: string) {
    const match = find(mapping, { old: name });
    return match ? match.new : name;
}

export function updateModel(model: DatabaseModel): DatabaseModel {
    for (let entity of model.entities) {
        const newName = getNewTableName(entity.entityName);
        if (newName) {
            entity.entityName = newName;
        }
        for (let column of entity.columns) {
            const newTsName = getNewTableName(column.tsName);
            if (newTsName) {
                column.tsName = newTsName;
            }

            for (let relation of column.relations) {
                const newName2 = getNewTableName(relation.relatedTable);
                if (newName2) {
                    relation.relatedTable = newName2;
                }
                const newName3 = getNewTableName(relation.ownerTable);
                if (newName3) {
                    relation.ownerTable = newName3;
                }
            }
        }
    }
    //writeFileSync('./databaseModel_psql2.json', JSON.stringify(model, null, 2))
    return model;
}
