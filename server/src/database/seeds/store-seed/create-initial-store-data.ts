import { Connection } from 'typeorm';
import { Seeder, Factory } from 'typeorm-seeding';
import { Favorite } from '../../..//entities/favorite';
import { MenuByArea } from '../../../entities/menu-by-area';
import { Review } from '../../../entities/review';
import { ReviewLike } from '../../../entities/review_like';
import { SearchWord } from '../../../entities/search-word';
import { Store } from '../../../entities/store';
import { User } from '../../../entities/user';

export class CreateInitialData implements Seeder {
  public async run(factory: Factory, connection: Connection): Promise<any> {
    await connection
      .createQueryBuilder()
      .insert()
      .into(Store)
      .values([
        {
          menu_name: '감자국',
          store_name: '원조은평감자국',
          address: '서울 은평구 응암로 287',
          open_time: '매일 10:00 ~ 24:00',
          phone_number: '02-389-4458',
          store_img:
            'https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F03062A03796811502C',
        },
        {
          menu_name: '감자국',
          store_name: '대조대림감자국',
          address: '서울 은평구 응암로 172',
          open_time: '매일 00:00 ~ 24:00',
          phone_number: '02-306-6535',
          store_img: '서울 은평구 응암로 172 (우)03478지번응암동 603-74',
        },
        {
          menu_name: '감자국',
          store_name: '원조이화감자국',
          address: '서울 은평구 응암로 174-1',
          open_time: '매일 09:00 ~ 23:00',
          phone_number: '02-307-4723',
          store_img:
            'https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F1346C2364FBEEB1F0A',
        },
      ])
      .execute();

    await connection
      .createQueryBuilder()
      .insert()
      .into(User)
      .values([
        {
          user_name: 'sh',
          email: 'sh@codestates.com',
          password: 'sh',
          user_img: '/adsf.jpg',
        },
        {
          user_name: 'sh2',
          email: 'sh2@codestates.com',
          password: 'sh2',
          user_img: '/adsf.jpg',
        },
      ])
      .execute();

    await connection
      .createQueryBuilder()
      .insert()
      .into(SearchWord)
      .values([
        {
          user_id: 2,
          search_word: 'sh',
        },
        {
          user_id: 2,
          search_word: 'shsh',
        },
      ])
      .execute();

    await connection
      .createQueryBuilder()
      .insert()
      .into(MenuByArea)
      .values([
        {
          area_name: '종로구',
          menu_img: './menu.jpg',
          menu_name: '생선구이',
          comment: '생선구이구이',
        },
        {
          area_name: '종로구',
          menu_img: './menu.jpg',
          menu_name: '닭한마리',
          comment: '닭한마리',
        },
        {
          area_name: '관악구',
          menu_img: './menu.jpg',
          menu_name: '신림동 순대',
          comment: '순대순대',
        },
      ])
      .execute();

    await connection
      .createQueryBuilder()
      .insert()
      .into(Review)
      .values([
        {
          user_id: 1,
          store_id: 1,
          comment: '맛잇어요!',
          rating: 10,
        },
        {
          user_id: 1,
          store_id: 2,
          comment: '맛잇어요!',
          rating: 5,
        },
        {
          user_id: 1,
          store_id: 3,
          comment: '맛잇어요!',
          rating: 9,
        },
        {
          user_id: 2,
          store_id: 1,
          comment: '맛잇어요!',
          rating: 10,
        },
        {
          user_id: 2,
          store_id: 2,
          comment: '맛잇어요!',
          rating: 7,
        },
      ])
      .execute();

    await connection
      .createQueryBuilder()
      .insert()
      .into(Favorite)
      .values([
        {
          user_id: 1,
          store_address: 'asdf',
          store_name: '생선구이가게',
          store_img: './store.jpg',
        },
        {
          user_id: 1,
          store_address: 'asdf',
          store_name: '생선구이가게2',
          store_img: './store.jpg',
        },
      ])
      .execute();
  }
}
