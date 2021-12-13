import { Injectable, Param } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Review } from 'src/entities/review';
import { getManager, getRepository, Repository } from 'typeorm';
import { HttpException,HttpStatus } from '@nestjs/common';
import { Store } from '../entities/store';
import { ReviewLike } from 'src/entities/review_like';
@Injectable()
export class ReviewService {
    constructor(
        @InjectRepository(Review)
        private ReviewRepostory: Repository<Review>,
        @InjectRepository(ReviewLike)
        private ReviewlikeRepostory: Repository<ReviewLike>
        ){}

    async addReview(userId:number , body) {
        if(!body.store_id || !body.comment || !body.rating){
            throw new HttpException({
                status: HttpStatus.BAD_REQUEST,
                data : null,
                message: "Please insert every info",
            }, 400);
        }
        const data= await this.ReviewRepostory.find({where:{user_id:userId , store_id:body.store_id}})
        //중복 처리
        if(data.length!==0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "your review already exist",
            }, 404);
        }

        await this.ReviewRepostory.save({
            user_id:userId,
            store_id:body.store_id,
            comment:body.comment,
            rating:body.rating
        })
        return {"data":null ,"message":"add review success"}
    }

    async deleteReview(userId:number, storeId:number) {
        const data = await this.ReviewRepostory.delete({user_id:userId,store_id:storeId})
        //테이블에 없어서 삭제되지 않은 경우
        if(data.affected===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "fail to delete review",
            }, 404);
        }
        return {"data":null ,"message":"delete review success"}
    }
    //!USER랑 리뷰좋아요 갯수 조인하기
    async getReview(storeId : number) {
        // const data = await this.ReviewRepostory.find({where:{store_id:storeId}})
        const query = `Select review.id,review.comment,review.rating,review.created_at,review.user_id,user.user_name, user.user_img 
                        FROM review 
                        INNER JOIN user ON user.id=review.user_id 
                        WHERE review.store_id=${storeId}`
                        
        const entityManager = getManager();
        const data = await entityManager.query(query)
        
        if(data.length===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "empty review",
            }, 404);
        }
        for(let i=0;i<data.length;i++){
            let data2 = await entityManager.query(`Select COUNT(review_like.review_id) AS num_review_like FROM review_like WHERE review_id=${data[i].id}`)
            data[i].num_review_like = Number(data2[0].num_review_like);
        }
        return {"data":data , "message":"get review successully"}
    }
    
    //!JOIN with Store , storename 보내주기
    async getMyReview(userId : number) {
        // const data = await this.ReviewRepostory.find({where:{user_id:userId}})
        const entityManager = getManager();
        const data = await entityManager.query(
        `SELECT review.comment,review.rating,review.created_at,store.store_name from review INNER JOIN store ON review.store_id = store.id WHERE user_id=${userId}`)
        if(data.length===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "myreview doesn't exist",
            }, 404);
        }
        return { "data":data , "message":"get my review list success"}
    }   

    async getLikeList(userId:number){
        const data= await this.ReviewlikeRepostory.find({user_id:userId})
        if(data.length===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "empty review like",
            }, 404); 
        }
        
        return {"data":data,"message":"get like list success"}
    }


    //!중복방지
    async addLikeReview(userId:number ,reviewId:number ) {
        const data = await this.ReviewlikeRepostory.find({
            review_id:reviewId,
            user_id:userId
        })
        if(data.length!==0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "you already like this review",
            }, 404); 
        }
        await this.ReviewlikeRepostory.save({
            review_id:reviewId,
            user_id:userId
        })
        return {"message":"review like success"}
        
    }

<<<<<<< HEAD
    deleteLikeReview() :{}{
=======
    async deleteLikeReview(userId:number,reviewId:number) {
        const data=await this.ReviewlikeRepostory.delete(
            {user_id:userId,review_id:reviewId}
        )
        if(data.affected===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "fail to delete review like",
            }, 404);
        }
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
        return {"message":"delete review like success"}
       
    }
}
