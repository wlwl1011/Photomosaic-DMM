import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Store } from 'src/entities/store';

@Module({
    imports:[TypeOrmModule.forFeature([Store])]
})
export class StoreModule {}
