import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MenuByArea } from 'src/entities/menu-by-area';

@Module({
    imports:[TypeOrmModule.forFeature([MenuByArea])]
})
export class MenuByAreaModule {}
