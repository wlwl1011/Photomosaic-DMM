import { Controller, Get, Param } from '@nestjs/common';
import {StoreService} from './store.service'

@Controller('store')
export class StoreController {
    constructor(private readonly StoreService: StoreService ){}

    @Get('byMenu/:menu_name')
    getAll(@Param('menu_name') menu_name:string) :{} {
        return this.StoreService.getAll(menu_name)
    }

    @Get('byId/:id')
    getOne(@Param('id') storeId : string){
        return this.StoreService.getOne(storeId)
    }
}
