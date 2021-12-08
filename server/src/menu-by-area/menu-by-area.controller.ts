import { Controller, Get } from '@nestjs/common';
import { MenuByAreaService } from './menu-by-area.service';

@Controller('menu-by-area')
export class MenuByAreaController {
    constructor(private readonly MenuByAreaService : MenuByAreaService){}

    @Get(':area_name')
    menuByArea(){
        return this.MenuByAreaService.menuByArea()
    }
}
