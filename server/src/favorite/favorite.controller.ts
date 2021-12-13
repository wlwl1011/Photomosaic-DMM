import { Body, Controller, Delete, Get, Header, Param, Post, Request } from '@nestjs/common';
import { FavoriteService } from './favorite.service';
import { UserService } from 'src/user/user.service';
import { JwtService } from '@nestjs/jwt';
import { request } from 'express';

@Controller('favorite')
export class FavoriteController {
    
    constructor (private readonly FavoriteService: FavoriteService , private jwtService: JwtService){}
  
    
    @Get('/list')
    getList(@Request() req){       
        return this.FavoriteService.getList(req.user.id) 
    }

    @Get('/check-favorite/:store_name')
    checkFavorite(@Request() req, @Param('store_name') storeName:string){
        return this.FavoriteService.checkFavorite(req.user.id ,storeName)
    }

    
    @Post('/add-favorite')
    addFavorite(@Request() req ){
        console.log(req.user.id)
        return this.FavoriteService.addFavorite(req.user.id, req.body)
    }

    @Delete('/:store_name')
    deleteFavorite(@Request() req, @Param('store_name') storeName:string ){
        return this.FavoriteService.deleteFavorite(req.user.id ,storeName)
    }
}
