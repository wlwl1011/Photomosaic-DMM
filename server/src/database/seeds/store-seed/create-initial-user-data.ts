import { Connection } from "typeorm";
import {Seeder,Factory} from "typeorm-seeding"
import { Favorite } from "src/entities/favorite";
import { MenuByArea } from "src/entities/menu-by-area";
import { Review } from "src/entities/review";
import { ReviewLike } from "src/entities/review_like";
import { SearchWord } from "src/entities/search-word";
import { Store } from "../../../entities/store";
import { User } from "../../../entities/user";

export class CreateInitialData implements Seeder {
    public async run(factory:Factory , connection:Connection) : Promise<any>{
        await connection
        .createQueryBuilder()
        .insert()
        .into(User)
        .values([
            {
            user_name:"asdf",
            email:"asdfsdf",
            password:"asdfsdf",
            user_img:"12~12",
        }])
        .execute();
    }

}