import { Controller, Delete, Get, Post } from '@nestjs/common';
import { ReviewService } from './review.service';

@Controller('review')
export class ReviewController {
    constructor(private readonly ReviewService : ReviewService){}

    @Post('/add-review')
    addReview(){
        return this.ReviewService.addReview()
    }

    @Delete(':store_id')
    deleteReview(){
        return this.ReviewService.deleteReview()
    }

    @Get(':store_id')
    getReview(){
        return this.ReviewService.getReview()
    }

    @Get('/myreview')
    getMyReview(){
        return this.ReviewService.getMyReview()
    }

    @Post('/like/:review_id')
    addLikeReview(){
        return this.ReviewService.addLikeReview()
    }

    @Delete('/like/:review_id')
    deleteLikeReview(){
        return this.ReviewService.deleteLikeReview()
    }
}
