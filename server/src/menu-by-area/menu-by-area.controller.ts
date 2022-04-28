import { Controller, Get, Param } from '@nestjs/common';
import { MenuByAreaService } from './menu-by-area.service';

@Controller('menu-by-area')
export class MenuByAreaController {
    constructor(private readonly MenuByAreaService : MenuByAreaService){}

    @Get(':area_name')
    menuByArea(@Param('area_name') area_name : string){
        return this.MenuByAreaService.menuByArea(area_name)
    }

    @Get('/image/:menu_name')
    getMenuImage(@Param('menu_name') menu_name : string){
        return this.MenuByAreaService.getMenuImage(menu_name);
    }
}
