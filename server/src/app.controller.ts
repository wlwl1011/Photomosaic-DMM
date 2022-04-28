import { Controller, Get, Request, Post, UseGuards, Res, Param } from '@nestjs/common';
import { Response } from 'express';
import { join } from 'path';
import { AppService } from './app.service';


@Controller()
export class AppController {
    constructor(private appService: AppService) {}
  @Get('/')
  getHellow(){
    return this.appService.getHello()
  }

  @Get('/:file_name')
  sendFile(@Res() res ,@Param('file_name') file_name:string){
    res.sendFile(join(__dirname,`../../public/${file_name}`))
  }
}


