import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import * as express from 'express';
import { join } from 'path';
import { AppModule } from './app.module';
const fs = require('fs');

async function bootstrap() {
  const app = await NestFactory.create(AppModule,{

});
  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
      whitelist: true,
    })
  )
  
  app.enableCors({
    origin: true,
    credentials:true,
    allowedHeaders: 'Origin, X-Requested-With, Content-Type, Accept',
  });

  await app.listen(4000);
}
bootstrap();

