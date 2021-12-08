import { Controller, Delete, Get, Header, Param, Post, Req } from '@nestjs/common';
import { FavoriteService } from './favorite.service';
import { Request } from 'express';

@Controller('favorite')
export class FavoriteController {
    constructor (private readonly FavoriteService: FavoriteService){}

    @Get('/list')
    getList(@Req() request : Request){
        return this.FavoriteService.getList(request.body) 
    }
    
    @Post('/add-favorite')
    addFavorite(@Req() request : Request ){
        return this.FavoriteService.addFavorite(request.body)
    }

    @Delete('/:store_name')
    deleteFavorite(@Req() request : Request, @Param('store_name') storeName:string ){
        return this.FavoriteService.deleteFavorite(request.body ,storeName)
    }
}
