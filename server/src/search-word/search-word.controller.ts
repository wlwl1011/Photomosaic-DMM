import { Controller, Delete, Get, Param, Post, Request } from '@nestjs/common';
import { userInfo } from 'os';
import { SearchWordService } from './search-word.service';

@Controller('search-word')
export class SearchWordController {
    constructor(private readonly SearchWordService:SearchWordService){}

    @Get()
    getSearchWord(@Request() req){
        return this.SearchWordService.getSearchWord(req.user.id)
    }

    @Post('/add-search-word/:search_word')
    addSearchWord(@Request() req, @Param('search_word') searchWord:string){
        
    } 

    @Delete(':search_word')
    deleteSearchWord(@Request() req , @Param('search_word') searchWord:string){
        return this.SearchWordService.deleteSearchWord(req.user.id,searchWord)
    }
    
}
