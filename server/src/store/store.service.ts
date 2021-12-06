import { Injectable } from '@nestjs/common';

@Injectable()
export class StoreService {

    getAll() :{} {
        //DB에서 찾자 
        const data:[string,string] = ['1','2'];
        console.log(data.length);

        if(data !== []){
            return {"data":data , "message":"get all store infos successfully"}
        }
        return {"data":null , "message":"Store doesn't exist"}
    }
    getOne(storeId : string){
        return `get store by ${storeId}` 
    }
}
