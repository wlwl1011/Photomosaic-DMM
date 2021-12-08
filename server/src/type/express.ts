import { Request, Response, NextFunction } from 'express';
import { User } from '../entities/user';


export interface ReqCustomWithAuth extends Request {
    user ?:User,
    


}
