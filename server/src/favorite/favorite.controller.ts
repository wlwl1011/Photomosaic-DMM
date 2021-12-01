import { Controller, Delete, Get, Header, Post } from '@nestjs/common';
import { FavoriteService } from './favorite.service';

@Controller('favorite')
export class FavoriteController {
    constructor (private readonly FavoriteService: FavoriteService){}

    @Get('/list')
    getList(){
        return this.FavoriteService.getList()
      
    }
    
    @Post('/add-favorite')
    addFavorite(){
        return this.FavoriteService.addFavorite()
    }

    @Delete('/:store_name')
    deleteFavorite(){
        return this.FavoriteService.deleteFavorite()
    }
}
