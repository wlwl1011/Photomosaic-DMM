import { Controller, Get, Param } from '@nestjs/common';
import {StoreService} from './store.service'

@Controller('store')
export class StoreController {
    constructor(private readonly StoreService: StoreService ){}

    @Get()
    getAll() :{} {
        return this.StoreService.getAll()
    }

    @Get(':id')
    getOne(@Param('id') storeId : string){
        return this.StoreService.getOne(storeId)
    }
}
