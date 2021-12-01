import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './user.entities';
import { Body, Controller, Get, HttpCode, Post, Redirect } from '@nestjs/common';

@Injectable()
export class UserService {
    constructor(
        @InjectRepository(User)
        private userRepository: Repository<User>,
        ) {}
    async login(email: string, password: string){
        const userdata = {
            email,
            password
        }
        const usercheck = await this.userRepository.findOne(userdata);
        if(usercheck){
            return Object.assign({
                statusMsg: 'login success'
            })
        }
            throw new NotFoundException("user not exist")
    }

    async signup(email: string, password: string, user_name: string, user_img: string ){
        const userdata = { email, password, user_name, user_img }
        const usercheck = await this.userRepository.findOne(email);
        if(!usercheck){
            return 'sign up successfully'
        }
        return Object.assign({
            statusMsg: 'user exists'
        })
    }


}
