import { Injectable } from '@nestjs/common';

@Injectable()
export class MenuByAreaService {

    menuByArea() :{}{
        return { "message": "get favorite list successfully"}
    }

}
