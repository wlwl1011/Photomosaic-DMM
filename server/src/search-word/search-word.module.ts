<<<<<<< HEAD
import { Module } from '@nestjs/common';

@Module({})
export class SearchWordModule {}
=======
import { Module ,NestModule, MiddlewareConsumer} from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { login } from '../middleware/token';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from '../auth/constants';
import { SearchWordController } from './search-word.controller';
import { SearchWord } from '../entities/search-word';
import { SearchWordService } from './search-word.service';
@Module({
    imports:[
        TypeOrmModule.forFeature([SearchWord]), 
        JwtModule.register({
            secret: jwtConstants.secret,
            signOptions: { expiresIn: '7200s' },
        })
    ],
    providers:[SearchWordService],
    exports:[SearchWordService]

})
export class SearchWordModule implements NestModule{
    configure(consumer: MiddlewareConsumer) {
      consumer.apply(login) 
        .forRoutes(SearchWordController);
    }
}
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
