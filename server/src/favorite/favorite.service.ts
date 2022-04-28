import { Favorite } from 'src/entities/favorite';
import { User } from 'src/entities/user';
import { Injectable } from '@nestjs/common';
import { getConnection, getManager, Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { HttpException,HttpStatus } from '@nestjs/common';
import { Store } from 'src/entities/store';



@Injectable()
export class FavoriteService {
    constructor(
        @InjectRepository(Favorite)
        private FavoriteRepostory: Repository<Favorite>,
        @InjectRepository(Store)
        private StoreRepository: Repository<Store>,

    ){}

    async getList(user_id : number){
        const favorite= await this.FavoriteRepostory.find({where:{user_id:user_id}})
        if(favorite.length===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "Empty favorite list",
            }, 404);
        }
        let data=[];

        for(let i=0;i<favorite.length;i++){
            const store=await this.StoreRepository.findOne({where:{store_name:favorite[i].store_name}})
            const entityManager = getManager();
            const avg_rating = await entityManager.query(`SELECT ROUND(AVG(rating)) as avg_rating FROM review WHERE store_id=${store.id}`) 
            if(!avg_rating[0].avg_rating){
                const data2={
                    ...favorite[i],
                    avg_rating:0
                }
                data.push(data2);
            }
            else{
                const data2={
                    ...favorite[i],
                    avg_rating:Number(avg_rating[0].avg_rating)
                }
                data.push(data2);
            }
        }
        return {"data":data, "message":"get favorite list successfully"}
    }

    async checkFavorite(user_id:number , storeName:string){
        const data=await this.FavoriteRepostory.find({where:{user_id:user_id,store_name:storeName}})
        if(data.length===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "favorite list doesn't have this store",
            }, 404);
        } 
        return {"data":true, "message":"favorite list have this store"}
    }



    //!중복 불가!
    async addFavorite(user_id :number , body)  {
        //body 에 정보누락
        if(!body.store_name || !body.store_address || !body.store_img){
            throw new HttpException({
                status: HttpStatus.BAD_REQUEST,
                data : null,
                message: "Please insert every info",
            }, 400);
        }
        const data= await this.FavoriteRepostory.find({where:{user_id:user_id , store_name:body.store_name}})
        //중복 처리
        if(data.length!==0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "favorite already exist",
            }, 404);
        }

        await this.FavoriteRepostory.save({
            user_id:user_id,
            store_name:body.store_name,
            store_address:body.store_address,
            store_img:body.store_img
        })
        return {"data":null ,"message":"add favorite success"}
    }

    async deleteFavorite(user_id:number , storeName :string){
        const data = await this.FavoriteRepostory.delete({user_id:user_id,store_name:storeName})
        //테이블에 없어서 삭제되지 않은 경우
        if(data.affected===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "fail to delete favorite",
            }, 404);
        }
        return {"data":null ,"message":"delete favorite success"}
    }
    
}
