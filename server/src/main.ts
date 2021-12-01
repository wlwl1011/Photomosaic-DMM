import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
const fs = require("fs");

const httpsOptions = {
  key: fs.readFileSync(__dirname+'/../key.pem'),
  cert: fs.readFileSync(__dirname+'/../cert.pem'),
};

async function bootstrap() {
  const app = await NestFactory.create(AppModule,{
    httpsOptions
  });
  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
      whitelist: true,
    })
  )

  app.enableCors({
    origin: '*',
    allowedHeaders: 'Origin, X-Requested-With, Content-Type, Accept',
  });

  await app.listen(4000);
}
bootstrap();