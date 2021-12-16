import { MiddlewareConsumer, Module, NestModule, RequestMethod } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
//CONTROLLER
import { FavoriteController } from './favorite/favorite.controller';
import { StoreController } from './store/store.controller';
import { MenuByAreaController } from './menu-by-area/menu-by-area.controller';
import { ReviewController } from './review/review.controller';
import { SearchWordController } from './search-word/search-word.controller';
import { UserController } from './user/user.controller';
//SERVICE
import { FavoriteService } from './favorite/favorite.service';
import { StoreService } from './store/store.service';
import { MenuByAreaService } from './menu-by-area/menu-by-area.service';
import { ReviewService } from './review/review.service';
import { SearchWordService } from './search-word/search-word.service';
//ENTITIES
import { Favorite } from '../src/entities/favorite';
import { MenuByArea } from './entities/menu-by-area'
import { ReviewLike } from './entities/review_like';
import { Review } from './entities/review';
import { SearchWord } from './entities/search-word';
import { Store } from './entities/store';

import { ConfigModule } from '@nestjs/config';
import *as ormconfig from '../ormconfig';
import { UserModule } from './user/user.module';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from './auth/constants';
import { FavoriteModule } from './favorite/favorite.module';
import { ReviewModule } from './review/review.module';
import { SearchWordModule } from './search-word/search-word.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';

@Module({
  imports: [
    //이거 쓰면 env 앱 전체에서 쓸 수 있음
    ConfigModule.forRoot({
      isGlobal:true
    }),ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', 'public')}),
    TypeOrmModule.forRoot(ormconfig),
    TypeOrmModule.forFeature([Store,Review,ReviewLike,MenuByArea,SearchWord,Favorite]),
    UserModule,
    FavoriteModule,
    ReviewModule,
    SearchWordModule,
    JwtModule.register({
      secret: jwtConstants.accesssecret,
      signOptions: { expiresIn: '3600s' },
    }),
 
  ],
  
  controllers: [AppController, StoreController,FavoriteController, MenuByAreaController, ReviewController,SearchWordController,UserController],
  providers: [AppService, StoreService, MenuByAreaService],
})


export class AppModule {}
