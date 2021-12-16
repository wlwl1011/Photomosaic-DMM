import { Controller, MiddlewareConsumer, Module, NestModule, RequestMethod } from '@nestjs/common';
import { JwtModule, JwtService } from '@nestjs/jwt';
import { TypeOrmModule } from '@nestjs/typeorm';
import { login } from '../middleware/token';
import { jwtConstants } from '../auth/constants';
import { User } from './../entities/user';
import { UserController } from './user.controller';
import { UserService } from './user.service';
import { MulterModule } from '@nestjs/platform-express';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';


@Module({
    imports: [TypeOrmModule.forFeature([User]),JwtModule.register({
      secret: jwtConstants.accesssecret,
      signOptions: { expiresIn: '7200s' },
    }),
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '../../public'),
      exclude: ['/api*']})],
    providers: [UserService],
    exports: [UserService],
    
  })
  export class UserModule 
  implements NestModule{
    configure(consumer: MiddlewareConsumer) {
      consumer.apply(login).exclude(
        { path: 'user/login', method: RequestMethod.POST },
        { path: 'user/signup', method: RequestMethod.POST },
        { path: 'user/check-username', method: RequestMethod.POST },
        { path: 'user/google_login', method: RequestMethod.GET },
        { path: 'user/kakao_login', method: RequestMethod.GET })
        .forRoutes(UserController);
    }
  }
  