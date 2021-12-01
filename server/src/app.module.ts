import { Module } from '@nestjs/common';
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

import { MenuByArea } from './entities/menu-by-area'
import { ReviewLike } from './entities/review_like';
import { Review } from './entities/review';
import { SearchWord } from './entities/search-word';
import { Store } from './entities/store';


@Module({
  imports: [
    //이거 쓰면 env 앱 전체에서 쓸 수 있음
    ConfigModule.forRoot({
      isGlobal:true
    }),

    TypeOrmModule.forRoot(ormconfig)
  ],

  controllers: [AppController, FavoriteController, StoreController, MenuByAreaController, ReviewController, SearchWordController],
  providers: [AppService, StoreService, FavoriteService, MenuByAreaService, ReviewService, SearchWordService],
})


export class AppModule {}
