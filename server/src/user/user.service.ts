import { Injectable, NotFoundException, Res } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AbstractRepository, EntityRepository, MetadataAlreadyExistsError, Repository } from 'typeorm';
import { response, Response } from 'express';
import { User } from './../entities/user';
import { JwtService } from '@nestjs/jwt';
import { createImageURL } from 'src/middleware/multeroption';
import { jwtConstants } from 'src/auth/constants';
import axios from 'axios';
import *as dotenv from 'dotenv'
import { stringify } from 'querystring';
dotenv.config();

@Injectable()
@EntityRepository()
export class UserService {
  constructor(
    private jwtService: JwtService,
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async login(data): Promise<any> {
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

    async signup(data: any, image: string): Promise<any>{
        const userdata = await this.userRepository.findOne({ where: { email: data.email }});
        if(!userdata){
            await this.userRepository.save({
              email: data.email,
              password: data.password,
              user_name: data.user_name,
              user_img: `${process.env.SERVER_ADDRESS}/${image}`
            })
            return true
        }
        return false
    }
    
  async userinfo(data: any): Promise<any> {
    const userdata = await this.userRepository.findOne({ where: { id: data.id }});
    return userdata;
  }

  async changepassword(data: any, user: any): Promise<any> {
    const { password } = data;
    const userdata = await this.userRepository.findOne({
      where: { email: user.email },
    });
    if (password === userdata.password) {
      return false;
    }
    userdata.password = String(password);
    await this.userRepository.save(userdata)
    return true;
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
  
  async changeusername(data: any, user: any): Promise<any> {
    const { user_name } = data;
    const userdata = await this.userRepository.findOne({
      where: { id: user.id },
    });
    const checkname = await this.userRepository.findOne({
      where: { user_name: user_name }
    })
    if (!checkname) {
      userdata.user_name = String(user_name);
      await this.userRepository.save(userdata);
      return true;
    }
    if (checkname) {
      return false;
    }
  }

    public uploadFiles(file: File[]): string [] {
      console.log(file)
            const generatedFiles: string [] = [];
              generatedFiles.push(createImageURL(file));
            return generatedFiles;
    }

    async check_username(user: any): Promise<any>{
        const userdata = await this.userRepository.findOne({
      where: { user_name: user.user_name },
    });
    if (!userdata) {
      return false;
    }
    if (userdata) {

      return true;
    }
  }
    
    async change_image(data: string, user: any): Promise<any>{
        const userdata = await this.userRepository.findOne({ where: { user_name: user.user_name } });
        if(!userdata){
           return false;
        }
        if(userdata){
            userdata.user_img = String(data);
            await this.userRepository.save(userdata);
            return true;
        }
        if(userdata.user_img === data){
            return 1
        }
    }

    // async sign_image(data: any, image: string): Promise<any>{
    //     const userdata = await this.userRepository.findOne({ where: { user_name: data.user_name } });
    //     userdata.user_img = image;
    //     await this.userRepository.save(userdata);
    // }

    async delete_image(user: any): Promise<any>{
        const userdata = await this.userRepository.findOne({ where: { user_name: user.user_name } });
        if(!userdata){
            return false;
        }
        if(userdata){
            userdata.user_img = `${process.env.SERVER_ADDRESS}/default.png` ///////////////////////////////////////////////////////////////////////
            await this.userRepository.save(userdata);
            return true;
        }
    }

    async google_login(data: any) {
      const url = `https://oauth2.googleapis.com/token?code=${data}&client_id=${process.env.GOOGLE_CLIENT_ID}&client_secret=${process.env.GOOGLE_CLIENT_SECRET}&redirect_uri=${process.env.GOOGLE_REDIRECT_URI}&grant_type=authorization_code`
      const access_token = await axios.post(
        url,
        {
          headers: { "content-type": "application/x-www-form-urlencoded" },
        },
      )
      const googleAPI = `https://www.googleapis.com/oauth2/v2/userinfo?access_token=${access_token.data.access_token}`
      const userInfo = await axios
      .get(googleAPI, {
        headers: {
          authorization: `Bearer ${access_token.data.access_token}`,
        },		
          })
          const userdata = await this.userRepository.findOne({ where: { id: userInfo.data.id } })
        if(userInfo && !userdata){
          return ;
        }
        if(!userInfo || userdata){
          await this.userRepository.save({
            id: userInfo.data.id,
            email: userInfo.data.email,
            password: 'admin',
            user_name: userInfo.data.name,
            user_img: userInfo.data.picture
          })
          return ;
        }
    }

    async kakao_login(data: any) {
      const url = `https://kauth.kakao.com/oauth/token?code=${data}&client_id=${process.env.KAKAO_CLIENT_ID}&client_secret=${process.env.KAKAO_CLIENT_SECRET}&redirect_uri=${process.env.KAKAO_REDIRECT_URI}&grant_type=authorization_code`
      const access_token = await axios.post(
        url,
        {
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
        },
      )
      
      const kakaoAPI = `https://kapi.kakao.com/v2/user/me`
      const userInfo = await axios
      .get(kakaoAPI, {
        headers: {
          authorization: `Bearer ${access_token.data.access_token}`,
          "Content-Type": "application/x-www-form-urlencoded"
        }
      })
      const userdata = await this.userRepository.findOne({ where: { id: userInfo.data.id } })
      
      if(userInfo && !userdata){
        return false;
      }
      if(!userInfo || userdata){
        await this.userRepository.save({
          id: userInfo.data.properties.id,
          email: userInfo.data.properties.account_email || userInfo.data.id,
          password: 'admin',
          user_name: userInfo.data.properties.nickname,
          user_img: userInfo.data.properties.profile_image
        })
        return true;
      }
      
    }

  }

