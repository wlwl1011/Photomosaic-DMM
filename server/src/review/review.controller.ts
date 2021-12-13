import { Controller, Delete, Get, Param, Post, Request } from '@nestjs/common';
import { ReviewService } from './review.service';

@Controller('review')
export class ReviewController {
    constructor(private readonly ReviewService : ReviewService){}

    @Post('/add-review')
    addReview(@Request() req){
        return this.ReviewService.addReview(req.user.id,req.body)
    }

    @Delete('/:store_id')
    deleteReview(@Request() req , @Param('store_id') storeId:number){
        return this.ReviewService.deleteReview(req.user.id,storeId)
    }

    @Get('/byStoreId/:store_id')
    getReview(@Param('store_id') storeId :number){
        return this.ReviewService.getReview(storeId)
    }

    @Get('/myreview')
    getMyReview(@Request() req){
        return this.ReviewService.getMyReview(req.user.id)
    }

    @Get('/likelist')
    getLikeList(@Request() req){
        return this.ReviewService.getLikeList(req.user.id)
    }


    @Post('/like/:review_id')
    addLikeReview(@Request() req, @Param('review_id') reviewId:number){
        return this.ReviewService.addLikeReview(req.user.id,reviewId)
    }

    @Delete('/like/:review_id')
    deleteLikeReview(@Request() req , @Param('review_id') reviewId:number){
        return this.ReviewService.deleteLikeReview(req.user.id,reviewId)
    }
}
