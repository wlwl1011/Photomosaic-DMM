import { Body, Controller, Get, HttpCode, Post, Redirect } from '@nestjs/common';
import { stringify } from 'querystring';
import { User } from './user.entities';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
constructor(private appService: UserService) {}

@Post('/login')
login(@Body() { email, password }: {email: string, password: string }){
    return this.appService.login( email, password );
}

@Post('/signup')
signup(@Body() { email, password, user_name, user_img }: {email: string, password: string, user_name: string, user_img: string }){
    return this.appService.signup( email, password, user_name, user_img)
}



@Get()

getAll() {
    return 'asdf'
}


}

