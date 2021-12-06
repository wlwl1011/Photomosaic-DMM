import { Injectable } from '@nestjs/common';

@Injectable()
export class FavoriteService {

    getList(){
        return "get favorite list"
    }

    addFavorite() :{} {
        return {"data":null ,"message":"add favorite success"}
    }

    deleteFavorite() :{} {
        return {"data":null ,"message":"delete favorite success"}
    }
    
}
