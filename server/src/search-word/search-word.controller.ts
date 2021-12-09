import { Controller, Delete, Get, Param, Request } from '@nestjs/common';
import { userInfo } from 'os';
import { SearchWordService } from './search-word.service';

@Controller('search-word')
export class SearchWordController {
    constructor(private readonly SearchWordService:SearchWordService){}

    @Get()
    getSearchWord(@Request() req){
        return this.SearchWordService.getSearchWord(req.user.id)
    }

    @Delete(':search_word')
    deleteSearchWord(@Request() req , @Param('search_word') searchWord:string){
        return this.SearchWordService.deleteSearchWord(req.user.id,searchWord)
    }
    
}
