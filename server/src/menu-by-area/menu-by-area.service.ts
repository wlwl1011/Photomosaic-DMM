import { HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { HttpException } from '@nestjs/common';
import { MenuByArea } from 'src/entities/menu-by-area';
import { database } from 'ormconfig';

@Injectable()
export class MenuByAreaService {
    constructor(
        @InjectRepository(MenuByArea)
        private MenuByAreaRepository: Repository<MenuByArea>,
    ){}

    async menuByArea(area_name:string) {
        const data=await this.MenuByAreaRepository.find({
            where:{area_name:area_name}
        })

        console.log(data);

        if(!data){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "Empty menu list",
            }, 404);
        }
        return {"data":data, "message": "get favorite list successfully"}
    } 
}
