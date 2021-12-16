import { Controller, Get, Request, Post, UseGuards, Res, Response, Param } from '@nestjs/common';
import { AppService } from './app.service';
import { join } from 'path';

@Controller()
export class AppController {

    constructor(private AppService:AppService){}

  @Get('/')
  getHello(){
     return this.AppService.getHello()
  }

  @Get('/:file_name')
  sendFile(@Res() res ,@Param('file_name') file_name:string){
    res.sendFile(join(__dirname,`../../public/${file_name}`))
  }
}


