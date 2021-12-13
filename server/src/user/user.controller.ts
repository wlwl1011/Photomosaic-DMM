import { Controller, Get, Post, Request, Res, Req, Patch, Delete, UseInterceptors, UploadedFile } from '@nestjs/common';
import { request, response, Response } from 'express';
import { UserService } from './user.service';
import { FileInterceptor } from '@nestjs/platform-express';
import { multerOptions } from '../middleware/multeroption';

@Controller('user')
export class UserController {
constructor(
  private userService: UserService) {}

  @Post('login')
  async login(@Request() req, @Res({ passthrough: true }) response) {
    const accesstoken = await this.userService.login(req.body)
    const refreshtoken = await this.userService.refreshtoken(req.body)
    response.cookie('jwt', accesstoken, {
      httpOnly: true
    })
    response.cookie('jwt1', refreshtoken, {
      data: accesstoken,
      httpOnly: true
    })
    response.json({ message: 'login successfully'})
  }

  @Post('signup')
  @UseInterceptors(FileInterceptor('file', multerOptions))
  async signup(@Request() req, @Res() response, @UploadedFile() file: File[]) {
    const data = await this.userService.signup(req.body)
    if(req.body.user_img === '') {
      this.userService.sign_image(req.body, 'default image')             //이미지 없으면 default image 삽입
      if(data){response.status(201).json({ message: 'sign up successfully' })}
      else{response.status(409).json({ message: 'email exists' })}
    }
    if(req.body.user_img !== '') {
      const uploadedFiles: string[] = this.userService.uploadFiles(file)
      this.userService.sign_image(req.body, uploadedFiles[0])
      if(data){response.status(201).json({ message: 'sign up successfully' })}
      else{response.status(409).json({ message: 'email exists' })}
    }
      
  }

  @Post('signout')
  async signout(@Res() response) {
    response.status(205).clearCookie('jwt').json({message: 'sign out successfully'})
  }

  @Get('userinfo/userimage')
  async getimage(@Request() req, @Res() response) {
    const userdata = await this.userService.userinfo(req);
    response.json({ data: userdata.user.user_img, message: 'get user image succesfully'})
  }

  @Get('userinfo/userdata')
  async getprofile(@Request() req, @Res() response) {
    console.log(req)
    const userdata = await this.userService.userinfo(req);
    delete userdata.user.password;
    response.json({ data: userdata.user, message: 'get user info successfully'})
  }

  @Patch('change-password')
<<<<<<< HEAD
  async change_password(@Request() req, @Res() response: Response){
=======
  async change_password(@Request() req, @Res() response){
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
    const boolean = await this.userService.changepassword(req.body, req.user)
    if(!boolean){
      response.status(409).json({ message: 'this password alredy exist'})
    }
    if(boolean){
      response.status(201).json({ message:"change password successfully" })
    }
  }

<<<<<<< HEAD
  @Patch('change-image')
  async change_image(@Request() request, @Res() response: Response, @UploadedFile() file: File[]){
    console.log(file)
    const uploadedFiles: string[] = this.userService.uploadFiles(file)
    if(uploadedFiles){
      response.status(201).json({ message: '성공'})
    }
  }

  @Patch('change-username')
  async change_username(@Request() req, @Res() response: Response){
=======
  @Patch('change-username')
  async change_username(@Request() req, @Res() response){
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
    const boolean = await this.userService.changeusername(req.body, req.user)
    if(!boolean){
      response.status(400).json({ message: 'this username already exist'})
    }
    if(boolean){
      response.status(201).json({ message:"change username successfully" })
    }
 }

<<<<<<< HEAD
  @Delete('delete-account')
  async delete_account(@Request() req, @Res() response: Response){
=======
  @Patch('change-image')
  @UseInterceptors(FileInterceptor('file', multerOptions))
  async change_image(@Request() req, @Res() response, @UploadedFile() file: File[]){
    const uploadedFiles: string [] = this.userService.uploadFiles(file)
    const boolean = await this.userService.change_image(uploadedFiles[0], req.user)
    if(boolean){
      response.status(201).json({ message: 'change profile image successfully'})
    }
    if(!boolean){
      response.status(401).json({ message: 'Invalid User'})
    }
    if(boolean === 1){
      response.status(409).json({ message: 'this image is already exist'})
    }
  }

 @Delete('image')
 async delete_image(@Request() req, @Res() response){
  const boolean = await this.userService.delete_image(req.body, req.user)
  if(!boolean){
    response.status(401).json({ message: 'Invalid User'})
  }
  if(boolean){
    response.json({ message: 'change profile image successfully'})
  }
 }

  @Delete('delete-account')
  async delete_account(@Request() req, @Res() response){
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
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

