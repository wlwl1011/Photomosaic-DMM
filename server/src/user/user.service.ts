import { Injectable, NotFoundException, Res } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AbstractRepository, EntityRepository, Repository } from 'typeorm';
import { response, Response } from 'express';
import { User } from './../entities/user';
import { JwtService } from '@nestjs/jwt';
import { createImageURL } from 'src/middleware/multeroption';
import { jwtConstants } from 'src/auth/constants';

@Injectable()
@EntityRepository()
export class UserService {
  constructor(
    private jwtService: JwtService,
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async login(data): Promise<any> {
    console.log(data);
    const userdata = await this.userRepository.findOne({
      where: { email: data.email, password: data.password },
    });
    if (userdata) {
      const payload = {
        id: userdata.id,
        user_name: userdata.user_name,
        email: userdata.email,
        user_img: userdata.user_img,
        password: userdata.password,
        created_at: userdata.created_at,
      };
      return this.jwtService.sign(payload);
    }
    throw new NotFoundException('login fail');
  }

    async refreshtoken(data): Promise<any>{
        const userdata = await this.userRepository.findOne({ where: { email: data.email, password: data.password } });
        const payload = { id: userdata.id, user_name: userdata.user_name, email: userdata.email, user_img: userdata.user_img, password: userdata.password };
        const token = this.jwtService.sign(payload, {
            secret: jwtConstants.refreshsecret,
            expiresIn: `10800s`
        })

        return token;
    }

    async signup(data: any): Promise<any>{
        console.log(typeof(data))
        const usercheck = await this.userRepository.findOne({ where: { email: data.email }});
        if(!usercheck){
            await this.userRepository.save(data)
            return true
            // this.createQueryBuilder('User')
            // .insert()
            // .into(tables)
            // .values(값)
            // .where('user_name = :userdata.user_name', { user_name })
        }
        return false
    }
    
    async userinfo(data: string): Promise<any> {
        return data
    }
    return false;
  }

  async userinfo(data: string): Promise<any> {
    return data;
  }

  async changepassword(data: any, user: any): Promise<any> {
    const { password } = data;
    const userdata = await this.userRepository.findOne({
      where: { email: user.email },
    });
    if (password === userdata.password) {
      return false;
    }

    async delete_account(data: any, user: any): Promise<any> {
        if(data.password !== user.password){
            return 1;
        }
        const userdata = await this.userRepository.findOne({ where: { user_name: user.user_name } });
        if(!userdata){
            return false;
        }
        if(userdata){
            await this.userRepository.delete(userdata.id);
            return true;
        }

    }
  }

  async changeusername(data: any, user: any): Promise<any> {
    const { user_name } = data;
    const userdata = await this.userRepository.findOne({
      where: { user_name: user.user_name },
    });
    if (!userdata) {
      const useremail = await this.userRepository.findOne({
        where: { email: user.email },
      });
      useremail.user_name = user_name;
      await this.userRepository.save(useremail);
      return true;
    }
    if (userdata) {
      return false;
    }
  }

    public uploadFiles(file: File[]): string [] {
            const generatedFiles: string [] = [];
              generatedFiles.push(createImageURL(file));
            return generatedFiles;
    }
    const userdata = await this.userRepository.findOne({
      where: { user_name: user.user_name },
    });
    console.log(userdata);
    if (!userdata) {
      return false;
    }
    if (userdata) {
      await this.userRepository.delete(userdata.id);
      return true;
    }
  }

    async change_image(data: string, user: any): Promise<any>{
        const userdata = await this.userRepository.findOne({ where: { user_name: user.user_name } });
        if(!userdata){
           return false;
        }
        if(userdata){
            userdata.user_img = data;
            await this.userRepository.save(userdata);
            return true;
        }
        if(userdata.user_img === data){
            return 1
        }
    }

    async sign_image(data: any, image: any): Promise<any>{
        const userdata = await this.userRepository.findOne({ where: { user_name: data.user_name } });
        userdata.user_img = image;
        await this.userRepository.save(userdata);
    }

    async delete_image(data: any, user: any): Promise<any>{
        const userdata = await this.userRepository.findOne({ where: { user_name: user.user_name } });
        if(!userdata){
            return false;
        }
        if(userdata){
            userdata.user_img = 'default image로 변환' ///////////////////////////////////////////////////////////////////////
            await this.userRepository.save(userdata);
            return true;
        }

    }

    generatedFiles.push(createImageURL(files));

    return generatedFiles;
  }
}
