import { Injectable } from '@nestjs/common';

@Injectable()
export class SearchWordService {
    getSearchWord() :{}{
        return {"data":[] , "message":"get recent search words success"}
    }

    deleteSearchWord() :{}{
        return {"message":"delete recent search word successfull"}
    }

}
