import { Controller, Get, Post, Request, Res, Req, Patch, Delete, UseInterceptors, UploadedFile } from '@nestjs/common';
import { request, response, Response } from 'express';
import { UserService } from './user.service';
import { FileInterceptor } from '@nestjs/platform-express';
import { multerOptions } from '../middleware/multeroption';

@Controller('user')
export class UserController {
constructor(
  private userService: UserService) {}

  @UseInterceptors(FileInterceptor('file', multerOptions))


  @Post('login')
  async login(@Request() req, @Res({ passthrough: true }) response:Response) {
    const token = await this.userService.login(req.body)
    response.cookie('jwt', token)
    response.json({ message: 'login successfully'})
  }

  @Post('signup')
  @UseInterceptors(FileInterceptor('file'))
  async signup(@Request() req, @Res() response: Response, @UploadedFile() file: Express.Multer.File) {
    console.log(file)
      const data = await this.userService.signup(req.body)
      if(data){response.status(201).json({ message: 'sign up successfully' })}
      else{response.status(409).json({ message: 'email exists' })}
  }
  @Post('signout')
  async signout(@Res() response: Response) {
    response.status(205).clearCookie('jwt').json({message: 'sign out successfully'})
  }

  @Get('userinfo/userdata')
  async getprofile(@Request() req, @Res() response: Response) {
    const userdata = await this.userService.userinfo(req);
    delete userdata.user.password;
    response.json({ data: userdata.user, message: 'get user info successfully'})
  }

  @Patch('change-password')
  async change_password(@Request() req, @Res() response: Response){
    const boolean = await this.userService.changepassword(req.body, req.user)
    if(!boolean){
      response.status(409).json({ message: 'this password alredy exist'})
    }
    if(boolean){
      response.status(201).json({ message:"change password successfully" })
    }
  }

  @Patch('change-image')
  async change_image(@Request() request, @Res() response: Response, @UploadedFile() files: File[]){
    console.log(files)
    const uploadedFiles: string[] = this.userService.uploadFiles(files)
    if(uploadedFiles){
      response.status(201).json({ message: '성공'})
    }
  }

  @Patch('change-username')
  async change_username(@Request() req, @Res() response: Response){
    const boolean = await this.userService.changeusername(req.body, req.user)
    if(!boolean){
      response.status(400).json({ message: 'this username already exist'})
    }
    if(boolean){
      response.status(201).json({ message:"change username successfully" })
    }
 }

  @Delete('delete-account')
  async delete_account(@Request() req, @Res() response: Response){
    const boolean = await this.userService.delete_account(req.body, req.user)
    if(boolean === 1){
      response.status(401).json({ message: 'Wrong password' })
    }
    if(!boolean){
      response.status(401).json({ message: 'Invalid user'})
    }
    if(boolean){
      response.status(201).json({ message: "delete account seccessfully" })
    }
  }

  @Post('check-username')
  async check_username(@Request() req, @Res() response: Response){
    const boolean = await this.userService.check_username(req.body)
    if(boolean){
      response.json({ message: 'possible to use this username'})
    }
    if(!boolean){
      response.json({ message: 'this username already exist'})
    }
  }



}

