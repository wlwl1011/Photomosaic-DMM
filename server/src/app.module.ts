import { MiddlewareConsumer, Module, NestModule, RequestMethod } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { FavoriteController } from './favorite/favorite.controller';
import { FavoriteModule } from './favorite/favorite.module';
import { FavoriteService } from './favorite/favorite.service';
import { StoreController } from './store/store.controller';
import { MenuByAreaController } from './menu-by-area/menu-by-area.controller';
import { ReviewController } from './review/review.controller';
import { SearchWordController } from './search-word/search-word.controller';
import { StoreService } from './store/store.service';
import { TypeOrmModule } from '@nestjs/typeorm';

import { Favorite } from '../src/entities/favorite';
import { MenuByAreaService } from './menu-by-area/menu-by-area.service';
import { ReviewService } from './review/review.service';
import { SearchWordService } from './search-word/search-word.service';
import { ConfigModule } from '@nestjs/config';
import *as ormconfig from '../ormconfig';
import { UserModule } from './user/user.module';

import { UserController } from './user/user.controller';
import { response } from 'express';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from './auth/constants';




@Module({
  imports: [
    //이거 쓰면 env 앱 전체에서 쓸 수 있음
    ConfigModule.forRoot({
      isGlobal:true
    }),
    TypeOrmModule.forRoot(ormconfig),
    UserModule,
    JwtModule.register({
      secret: jwtConstants.secret,
      signOptions: { expiresIn: '3600s' },
    }),
    
  ],

  controllers: [AppController, FavoriteController, StoreController, MenuByAreaController, ReviewController, SearchWordController, UserController],
  providers: [AppService, StoreService, FavoriteService, MenuByAreaService, ReviewService, SearchWordService],
})


export class AppModule {}
