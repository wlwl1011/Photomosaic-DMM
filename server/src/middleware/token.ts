import { Injectable, NestMiddleware } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request, Response, NextFunction } from 'express';
import { ReqCustomWithAuth } from '../type/express';
import { jwtConstants } from '../auth/constants';

@Injectable()
export class login implements NestMiddleware {
    constructor(
        private jwtService: JwtService ){}

       use(req: ReqCustomWithAuth, res: Response, next: NextFunction){

        if(!req.headers.cookie){
            res.status(404).json({ message: 'not exist token'})
            next();
        } else {
            const token = req.headers.cookie.split('=')[1];
            const userdata = this.jwtService.verify(token);
            req.user = { ...userdata};
            
            
            next();
        }
    }
    
}
