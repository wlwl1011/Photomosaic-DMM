import { Connection } from "typeorm";
import {Seeder,Factory} from "typeorm-seeding"
import { Favorite } from "src/entities/favorite";
import { MenuByArea } from "src/entities/menu-by-area";
import { Review } from "src/entities/review";
import { ReviewLike } from "src/entities/review_like";
import { SearchWord } from "src/entities/search-word";
import { Store } from "../../../entities/store";

export class CreateInitialData implements Seeder {
    public async run(factory:Factory , connection:Connection) : Promise<any>{
        await connection
        .createQueryBuilder()
        .insert()
        .into(Store)
        .values([
            {
            menu_name:"asdf",
            store_name:"asdfsdf",
            address:"asdfsdf",
            open_time:"12~12",
            phone_number:"1234-1234",
            store_img:"/sdf.jpg"
        }])
        .execute();
    }

}