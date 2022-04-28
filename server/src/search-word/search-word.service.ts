import { Injectable, Request } from '@nestjs/common';
import { SearchWord } from '../entities/search-word';
import { Repository } from 'typeorm';
import { HttpException,HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class SearchWordService {
    constructor(
        @InjectRepository(SearchWord)
        private SearchWordRepository:Repository<SearchWord>){}

    async getSearchWord(userId : number) {
        const data = await this.SearchWordRepository.find({where:{user_id:userId}})
            if(data.length===0){
                throw new HttpException({
                    status: HttpStatus.NOT_FOUND,
                    data : null,
                    message: "No search words",
               }, 404);  
        }
        return {"data":data , "message":"get recent search words success"}
    }

    async addSearchWord(userId:number, searchWord:string){
        const data= await this.SearchWordRepository.find({where:{user_id:userId , search_word:searchWord}})
        //중복 처리
        if(data.length!==0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "you've searched this word already exist",
            }, 404);
        }

        await this.SearchWordRepository.save({
            user_id:userId,
            search_word:searchWord
        })
        return {"data":null ,"message":"add search word success"}
    }

    async deleteSearchWord(userId:number , searchWord : string) {
        const data = await this.SearchWordRepository.delete({user_id:userId,search_word:searchWord})
        if(data.affected===0){
            throw new HttpException({
                status: HttpStatus.NOT_FOUND,
                data : null,
                message: "No search word",
           }, 404); 
        }
        return {"message":"delete recent search word successfull"}
    }

}
