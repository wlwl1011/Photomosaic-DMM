import { Controller, Get, Param } from '@nestjs/common';
import {StoreService} from './store.service'

@Controller('store')
export class StoreController {
    constructor(private readonly StoreService: StoreService ){}

    @Get('byMenu/:menu_name')
    getByMenu(@Param('menu_name') menu_name:string) :{} {
        return this.StoreService.getByMenu(menu_name)
    }

    @Get('byMenuAndArea/:menu_name/:area_name')
    getByMenuAndArea(@Param('menu_name') menu_name:string ,@Param('area_name') area_name:string) :{} {
        return this.StoreService.getByMenuAndArea(menu_name,area_name)
    }

    @Get('byId/:id')
    getOne(@Param('id') storeId : string){
        return this.StoreService.getOne(storeId)
    }

    @Get('/byStorename/:store_name')
    getByStorename(@Param('store_name') storeName : string){
        return this.StoreService.getByStoreName(storeName);
    }
}

