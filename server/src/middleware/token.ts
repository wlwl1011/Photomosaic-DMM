import { Injectable, NestMiddleware } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request, Response, NextFunction } from 'express';
import { ReqCustomWithAuth } from '../type/express';
import { jwtConstants } from '../auth/constants';
import { UserService } from 'src/user/user.service';
import { NestFactory } from '@nestjs/core';

@Injectable()
export class login implements NestMiddleware {
    constructor(

        private jwtService: JwtService,
        private userService: UserService ){}

       async use(req: ReqCustomWithAuth, res: Response, next: NextFunction){
        if(!req.headers.cookie){
            res.status(404).json({ message: 'not exist token'})
        } else {

            const headers = req.headers.cookie.split(';')[1];
            if(!headers){
                const refreshtoken = req.headers.cookie.split('jwt1')[1];
                const refuserdata = refreshtoken.split('=')[1];
                const userdata = this.jwtService.verify(refuserdata);
                req.user = { ...userdata}; 
                const accesstoken = await this.userService.login(req.body)
                res.cookie('jwt', accesstoken, {
                    httpOnly: true,
                    sameSite:'none',
                    secure:true
                    
                  })
                  next();
                  // accesstoken이 없을때
            } else{
                const header = req.headers.cookie.split(';')[0];
                const token = header.split('=')[1];
                const userdata = this.jwtService.verify(token);
                req.user = { ...userdata}; 
                next();
                // accesstoken이 있을때
            }
        }
    }
}
