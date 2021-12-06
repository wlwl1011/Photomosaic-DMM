import { Controller, Delete, Get } from '@nestjs/common';
import { SearchWordService } from './search-word.service';

@Controller('search-word')
export class SearchWordController {
    constructor(private readonly SearchWordService:SearchWordService){}

    @Get()
    getSearchWord(){
        return this.SearchWordService.getSearchWord()
    }

    @Delete(':search_word')
    deleteSearchWord(){
        return this.SearchWordService.deleteSearchWord()
    }
    
}
