import { Favorite } from 'src/entities/favorite';
import { Injectable } from '@nestjs/common';
import { getConnection } from 'typeorm';

@Injectable()
export class FavoriteService {

    getList(request: Request){
        return "get favorite list"
    }

    addFavorite(request: Request) :{} {
        return {"data":null ,"message":"add favorite success"}
    }

    async deleteFavorite(req_body: Request , storeName :string){
        console.log(req_body);
        // const{user_id} = req_body;
        // const deletedata = await getConnection()
        //     .createQueryBuilder()
        //     .delete()
        //     .from(Favorite)
        //     .where({user_id:user_id , store_name:storeName })
        //     .execute()
        // if(store.length===0){
        //     throw new HttpException({
        //         status: HttpStatus.NOT_FOUND,
        //         data : null,
        //         message: "Store doesn't exist",
        //     }, 404);
        // }
        return {"data":null ,"message":"delete favorite success"}
    }
    
}
