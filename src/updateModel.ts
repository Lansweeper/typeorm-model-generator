import { DatabaseModel } from "./models/DatabaseModel";

const { find } = require("lodash");
const Parser = require("parse-xl");
const mappingData = new Parser("mapping.xlsx");
const mapping = mappingData.data.Sheet1;

// Uppercase / lowercase first letter
const up = string => string.charAt(0).toUpperCase() + string.slice(1);
const lw = string => string.charAt(0).toLowerCase() + string.slice(1);

function getNewTableName(name: string) {
    const match = find(mapping, { table: lw(name) });
    if (match) {
        console.info("Found match for", name, " == ", match.new);
        return match ? match.new : name;
    } else {
        const match2 = find(mapping, { table: name });
        if (match2) {
            return match2 ? match2.new : name;
        }
    }
    console.error("No match for", name);
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
