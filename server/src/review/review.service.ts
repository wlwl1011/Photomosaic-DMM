import { Injectable } from '@nestjs/common';

@Injectable()
export class ReviewService {

    addReview() :{}{
        return {"message":"add review success"}
    }

    deleteReview() :{}{
        return {"message":"add review success"}
    }

    getReview() :{}{
        return {"data":[] , "message":"get review successully"}
    }

    getMyReview() :{}{
        return { "data":[] , "message":"get my review list success"}
    }

    addLikeReview() :{}{
        return {"message":"review like success"}
        
    }

    deleteLikeReview() :{}{
        return {"message":"delete review like success"}
       
    }
}
