import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
//CONTROLLER
import { FavoriteController } from './favorite/favorite.controller';
import { StoreController } from './store/store.controller';
import { MenuByAreaController } from './menu-by-area/menu-by-area.controller';
import { ReviewController } from './review/review.controller';
import { SearchWordController } from './search-word/search-word.controller';
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
import { User } from './entities/user';

import { ConfigModule } from '@nestjs/config';
import *as ormconfig from '../ormconfig';
import { appendFile } from 'fs';

@Module({
  imports: [
    //이거 쓰면 env 앱 전체에서 쓸 수 있음
    ConfigModule.forRoot({
      isGlobal:true
    }),
    TypeOrmModule.forRoot(ormconfig),
    TypeOrmModule.forFeature([Store,Review,ReviewLike,MenuByArea,SearchWord,User,Favorite])
  ],
  controllers: [AppController, FavoriteController, StoreController, MenuByAreaController, ReviewController, SearchWordController],
  providers: [AppService, StoreService, FavoriteService, MenuByAreaService, ReviewService, SearchWordService],
})


export class AppModule {}
