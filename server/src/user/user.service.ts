import { Injectable, NotFoundException, Res } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AbstractRepository, EntityRepository, Repository } from 'typeorm';
import { response, Response } from 'express';
import { User } from './../entities/user';
import { JwtService } from '@nestjs/jwt';
import { createImageURL } from 'src/middleware/multeroption';

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
      };
      return this.jwtService.sign(payload);
    }
    throw new NotFoundException('login fail');
  }

  async signup(userdata: any): Promise<any> {
    const usercheck = await this.userRepository.findOne({
      where: { email: userdata.email },
    });
    if (!usercheck) {
      await this.userRepository.save(userdata);
      return true;
      // this.createQueryBuilder('User')
      // .insert()
      // .into(tables)
      // .values(값)
      // .where('user_name = :userdata.user_name', { user_name })
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
    if (password !== userdata.password) {
      userdata.password = password;
      await this.userRepository.save(userdata);
      return true;
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

  async delete_account(data: any, user: any): Promise<any> {
    if (data.password !== user.password) {
      return 1;
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

  async check_username(data: any): Promise<any> {
    const userdata = await this.userRepository.findOne({
      where: { user_name: data.user_name },
    });
    if (!userdata) {
      return true;
    }
    return false;
  }

  public uploadFiles(files: File[]): string[] {
    const generatedFiles: string[] = [];

    generatedFiles.push(createImageURL(files));

    return generatedFiles;
  }
}
