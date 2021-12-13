import { Module } from '@nestjs/common';
<<<<<<< HEAD

@Module({})
=======
import { TypeOrmModule } from '@nestjs/typeorm';
import { Store } from 'src/entities/store';

@Module({
    imports:[TypeOrmModule.forFeature([Store])]
})
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
export class StoreModule {}
