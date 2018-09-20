import { EntityInfo } from "./EntityInfo";

export class DatabaseModel {
    entities: EntityInfo[];

    deserialize(input: DatabaseModel) {
        this.entities = [];
        input.entities.forEach(entity => {
            this.entities.push(new EntityInfo().deserialize(entity));
        });
        return this;
    }
}
