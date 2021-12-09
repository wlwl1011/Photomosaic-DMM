import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { Favorite } from './src/entities/favorite';
import { MenuByArea } from './src/entities/menu-by-area';
import { ReviewLike } from './src/entities/review_like';
import { Review } from './src/entities/review';
import { SearchWord } from './src/entities/search-word';
import { Store } from './src/entities/store';
import { User } from './src/entities/user';

import * as dotenv from 'dotenv';
dotenv.config();

const config: TypeOrmModuleOptions = {
  type: 'mysql',
  host: 'localhost',
  port: 3306,
  username: process.env.USERNAME,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
  entities: [Favorite, MenuByArea, ReviewLike, Review, SearchWord, Store, User],
  synchronize: false,
  autoLoadEntities: true,
  logging: true,
};

export = config;
