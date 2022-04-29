import * as dotenv from 'dotenv'
dotenv.config();

export const jwtConstants = {
    accesssecret: process.env.JWT_SECRET_KEY,
    refreshsecret: process.env.JWT_REFRESH_TOKEN
  };