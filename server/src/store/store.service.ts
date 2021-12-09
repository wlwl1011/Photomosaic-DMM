import { HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Store } from 'src/entities/store';
import { Review } from 'src/entities/review';
import { getConnection, getManager, Repository } from 'typeorm';
import { HttpException } from '@nestjs/common';

@Injectable()
export class StoreService {

    constructor(
        @InjectRepository(Store)
        private StoreRepository: Repository<Store>,
        @InjectRepository(Review)
        private ReviewRepository: Repository<Review>
    ){}

    async getAll(menu_name : string) {
        let data=[];
        const store=await this.StoreRepository.find({
            where:{menu_name:menu_name}
        })

        if(store.length===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "Store doesn't exist",
            }, 404);
        }
        //리뷰갯수 
        for(let i=0;i<store.length;i++){
            const num_review= await this.ReviewRepository.findAndCount({
                where:{store_id:store[i].id}
            })

            if(num_review[1]===0){
                 const data2={
                    ...store[i],
                    num_review: 0
                }
                data.push(data2);
            }
            else{
                const data2={
                    ...store[i],
                    num_review: num_review[1]
                }
                data.push(data2);
            }
        }
        //avg_rating
         for(let i=0;i<store.length;i++){
            const entityManager = getManager();
            const avg_rating = await entityManager.query(`SELECT ROUND(AVG(rating)) as avg_rating FROM review WHERE store_id=${store[i].id}`) 

            if(!avg_rating[0].avg_rating){
                    data[i].avg_rating = 0
                }
            else{
                data[i].avg_rating = Number(avg_rating[0].avg_rating)
            }
        }
        return {"data":data , "message":"get all store infos successfully"}
}

    async getOne(storeId : string){
        const store=await this.StoreRepository.findOne({
            where:{id:+storeId}
        })
        if(!store){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "this store id doesn't exist",
            }, 404);
        }
        //avg rating
        const entityManager = getManager();
        const avg_rating = await entityManager.query(`SELECT ROUND(AVG(rating)) as avg_rating FROM review WHERE store_id=${+storeId}`) 
        
        let data={};
        if(!avg_rating[0].avg_rating){
            data={
                ...store,
                avg_rating:0
            }
        }
        else{
            data={
                ...store,
                avg_rating : Number(avg_rating[0].avg_rating)
            }
        }
        return {"data":data , "message":"get store info successfully"}
    }
}


//! avg_rating 이랑 num_review 추가할것
//! getALL 에서 받은 데이터가 똑같애서 굳이 getOne 이 필요할까????
//! 경로 area로 먼저 나눠야하지 않나?

//SELECT ROUND(AVG(rating)) as avg_rating FROM perfume_infos 