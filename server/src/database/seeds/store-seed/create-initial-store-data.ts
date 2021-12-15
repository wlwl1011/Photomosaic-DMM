import { Connection } from "typeorm";
import {Seeder,Factory} from "typeorm-seeding"
import { Favorite } from "../../..//entities/favorite";
import { MenuByArea } from "../../../entities/menu-by-area";
import { Review } from "../../../entities/review";
import { ReviewLike } from "../../../entities/review_like";
import { SearchWord } from "../../../entities/search-word";
import { Store } from "../../../entities/store";
import { User } from "../../../entities/user";

export class CreateInitialData implements Seeder {
    public async run(factory:Factory , connection:Connection) : Promise<any>{
        await connection
        .createQueryBuilder()
        .insert()
        .into(Store)
        .values([
            {
                menu_name:"감자국",
                store_name:"원조은평감자국",
                address:"서울 은평구 응암로 287 (우)03454지번응암동 117-9",
                open_time:"매일 10:00 ~ 24:00",
                phone_number:"02-389-4458",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F03062A03796811502C"
            },
            {
                menu_name:"감자국",
                store_name:"대조대림감자국",
                address:"서울 은평구 응암로 172 (우)03478지번응암동 603-74",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-306-6535",
                store_img:"서울 은평구 응암로 172 (우)03478지번응암동 603-74"
            },
            {
                menu_name:"감자국",
                store_name:"원조이화감자국",
                address:"서울 은평구 응암로 174-1 1층 (우)03478지번응암동 602-31",
                open_time:"매일 09:00 ~ 23:00",
                phone_number:"02-307-4723",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F1346C2364FBEEB1F0A"
            },
            {
                menu_name:"감자국",
                store_name:"시골감자국",
                address:"서울 은평구 응암로 174 (우)03478지번응암동 602-32",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-302-8484",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F166DD9354FBEE69E02"
            },
            {
                menu_name:"감자국",
                store_name:"서부감자국",
                address:"서울 은평구 서오릉로 8 (우)03384지번녹번동 181",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-356-4555",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F61a094fb0e92d5f45c585ea99ed82622e43a9b6b%3Foriginal"
            },
            {
                menu_name:"감자국",
                store_name:"성원감자국닭한마리",
                address:"서울 은평구 은평로 217 (우)03383지번녹번동 228",
                open_time:"",
                phone_number:"02-389-0823",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles8.naver.net%2FMjAxOTEyMThfMTgg%2FMDAxNTc2NjUxOTc1MzE4.w7rzOVYyxxQ_KDuMmRjiw6fkFivKixS_MYflPcSIq2sg.Btj6h0VwMSvt6Z_35Mco8FlFR3KF4MJHxTv7Rn-NJFkg.JPEG.pink3198%2FIMG_1591.jpg%3Ftype%3Dw580"
            },
            {
                menu_name:"감자국",
                store_name:"서부감자국",
                address:"서울 은평구 서오릉로 8 (우)03384지번녹번동 181",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-356-4555",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F61a094fb0e92d5f45c585ea99ed82622e43a9b6b%3Foriginal"
            },
            {
                menu_name:"생선구이",
                store_name:"전주식당",
                address:"서울 종로구 수표로20길 16-17 (우)03192지번관수동 43-2",
                open_time:"월 ~ 토 08:00 ~ 21:00",
                phone_number:"02-2267-5385",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles6.naver.net%2FMjAyMTAyMDhfNDQg%2FMDAxNjEyNzU5NDQyNDQ3.qh2LFSgLVjyqPKptxXL_BM5MN2ZkSCSl5h_4L59d0Xsg.rdtxsEuHkqWjzjLJ1nPWgEKt_4G4WtdULg6SyUTLSLAg.JPEG.with_rang%2FDSCF0786.JPG%3Ftype%3Dw966"
            },
            {
                menu_name:"생선구이",
                store_name:"전주집",
                address:"서울 종로구 종로40가길 3 (우)03197지번종로5가 281-2",
                open_time:"매일 06:00 ~ 21:00",
                phone_number:"02-2267-6897",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F01062A03792FF91662"
            },
            {
                menu_name:"생선구이",
                store_name:"한일식당",
                address:"서울 종로구 수표로20길 16-17 (우)03192지번관수동 43-2",
                open_time:"매일 11:00 ~ 22:00",
                phone_number:"02-2279-7343",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles16.naver.net%2FMjAyMTA0MDVfMjYz%2FMDAxNjE3NjI0NTY0NDI0.vr1Z5EYJgZJcHebsp9lctv6fITyJFWWdfEmi8MM8TScg.Rhm3U76iCunk6riDS0qzEBaZyVtyzDLO8v8lb8-8-JIg.JPEG.supercko%2F20210405%EF%BC%BF101134.jpg%3Ftype%3Dw966"
            },
            {
                menu_name:"닭한마리",
                store_name:"진옥화 할매원조닭한마리 본점",
                address:"서울 종로구 종로40가길 18 (우)03197지번종로5가 265-22",
                open_time:"매일 10:30 ~ 01:00 (입장마감 23:30까지)",
                phone_number:"02-2275-9666",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2F6A6A5B1EB44B45589BE66AF7464432B2"
            },
            {
                menu_name:"닭한마리",
                store_name:"원조원할매소문난닭한마리",
                address:"서울 종로구 종로5가 282-21",
                open_time:"매일 10:00 ~ 24:00",
                phone_number:"02-2279-2078",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Faa723681743ad678845f3f60cafe60eb16947360%3Foriginal"
            },
            {
                menu_name:"닭한마리",
                store_name:"명동닭한마리 본점",
                address:"서울 종로구 종로40가길 14 (우)03197지번종로5가 265-8",
                open_time:"매일 09:30 ~ 01:00",
                phone_number:"02-2266-8249",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ffd825456dee06c18e25dc8684760014a2b82bf89%3Foriginal"
            },
            {
                menu_name:"닭한마리",
                store_name:"백부장집닭한마리 본관",
                address:"서울 종로구 삼봉로 100-1 (우)03158지번공평동 129",
                open_time:"월~토 10:30 ~ 22:00",
                phone_number:"02-732-2565",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F49c56e8a4f9904292ccfbc18effee9a3c6af7bc2%3Foriginal"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"나정순할매쭈꾸미",
                address:"서울 동대문구 무학로 144 (우)02584지번용두동 119-20",
                open_time:"월~토 11:30 ~ 22:30, 월~토 브레이크타임 14:30 ~ 17:00",
                phone_number:"02-928-0231",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F4C28545947554149A02FCECEB2A82044"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"용두동쭈꾸미본점",
                address:"서울 동대문구 무학로36길 10 (우)02584지번용두동 119-3",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-925-3127",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F587b85c13b52a034be750376e88dd8556194366c%3Foriginal"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"임오네쭈꾸미2호점",
                address:"서울 동대문구 왕산로16길 13 (우)02584지번용두동 112-33",
                open_time:"",
                phone_number:"02-921-1628",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F28147e06795ae9ecb1a5cf8becc3da7e36fbdf6c%3Foriginal"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"고흥쭈꾸미",
                address:"서울 동대문구 무학로36길 14 (우)02584지번용두동 112-31",
                open_time:"",
                phone_number:"02-922-8435",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FBD2EA98F17954754815349D6A9A1C870"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"용두동임오네쭈꾸미본점",
                address:"서울 동대문구 무학로36길 6 (우)02584지번용두동 119-4",
                open_time:"매일 10:00 ~ 22:30",
                phone_number:"02-925-1628",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2F308A77CE073740F7934ED1290E7473F8"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"나정순할매쭈꾸미",
                address:"서울 동대문구 약령시로 65 (우)02478지번제기동 886-22",
                open_time:"월~토 11:00 ~ 22:00, 월~토 브레이크타임 15:00 ~ 16:30",
                phone_number:"",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F96b80b7b9c2e50caf46d7db9f01dac65f733eadf%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"마포진짜원조최대포 본점",
                address:"서울 마포구 마포대로 112 (우)04213지번공덕동 255-19",
                open_time:"매일 11:00 ~ 24:00",
                phone_number:"02-719-9292",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ffbef335f717f201198368a516fca4ee92917db5f%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"원조조박집 본관",
                address:"서울 마포구 토정로 313-1 (우)04166지번용강동 40-1",
                open_time:"월~토 11:30 ~ 23:00, 월~토 브레이크타임 15:00 ~ 17:00",
                phone_number:"02-712-7462",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F3efd38cdbfb7dd2cf6c878027ad4c95ed61a35bf%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"장수갈매기 본점",
                address:"서울 마포구 도화길 46 (우)04169지번도화동 182-11",
                open_time:"매일 10:00 ~ 02:00",
                phone_number:"02-716-7766",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Ft1.daumcdn.net%2Flocal%2Freview_placeapp%2Fbtql676alXd_HC9dUIWOx1cOoD2DDJXkhk_img.jpg"
            },
            {
                menu_name:"돼지갈비",
                store_name:"명인갈비",
                address:"서울 마포구 연남로 85 (우)03975지번연남동 361-17",
                open_time:"매일 11:30 ~ 21:50",
                phone_number:"02-3142-8292",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles9.naver.net%2FMjAyMDEyMTVfMTA0%2FMDAxNjA4MDEzODU4NDQx.MojElQa77sLn6iigN1D31LIneCdpfnRxcz7c3_ElT4gg.7WjxEmeFQSbmQ169oe0AoX_GxS5NZsl6xh4fdeLX1nkg.JPEG.nada4795%2FIMG_1348.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"돼지갈비",
                store_name:"강강술래 홍대점",
                address:"서울 마포구 잔다리로6길 25 (우)04039지번서교동 369-10",
                open_time:"매일 11:30 ~ 23:00",
                phone_number:"02-3143-6635",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fa6e4363e2f56f38ef1272aba44b31c7278f49089%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"양화정숯불갈비",
                address:"서울 마포구 월드컵로1길 17 (우)04027지번합정동 383-26",
                open_time:"매일 11:30 ~ 22:00",
                phone_number:"02-323-5777",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe7369d09e8ff3828b4cb5f7d91b00752dd461254%3Foriginal](https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe7369d09e8ff3828b4cb5f7d91b00752dd461254%3Foriginal"
            },
            {
                menu_name:"족발",
                store_name:"마포왕족발",
                address:"서울 마포구 만리재로 19 (우)04214지번공덕동 256-43",
                open_time:"월~토 00:00 ~ 24:00",
                phone_number:"02-717-2126",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2F4BEB1DA5ACFF470496BE9412DD4ADA80"
            },

            
        ])
        .execute();

        await connection
        .createQueryBuilder()
        .insert()
        .into(User)
        .values([
            {
                user_name:"sh",
                email:"sh@codestates.com",
                password:"sh",
                user_img:"/adsf.jpg",
            },
            {
                user_name:"sh2",
                email:"sh2@codestates.com",
                password:"sh2",
                user_img:"/adsf.jpg",
            }
        ])
        .execute();

        await connection
        .createQueryBuilder()
        .insert()
        .into(SearchWord)
        .values([
            {
                user_id:2,
                search_word:"sh",    
            },
            {
                user_id:2,
                search_word:"shsh",    
            } 
        ])
        .execute();

        await connection
        .createQueryBuilder()
        .insert()
        .into(MenuByArea)
        .values([
            {
                area_name:"종로구",
                menu_img:"./menu.jpg",
                menu_name:"생선구이",
                comment:"생선구이구이"    
            },
            {
                area_name:"종로구",
                menu_img:"./menu.jpg",
                menu_name:"닭한마리",
                comment:"닭한마리"    
            },
            {
                area_name:"관악구",
                menu_img:"./menu.jpg",
                menu_name:"신림동 순대",
                comment:"순대순대"    
            },    
            
        ])
        .execute();

        await connection
        .createQueryBuilder()
        .insert()
        .into(Review)
        .values([
            {
                user_id:1,
                store_id:1,
                comment:"맛잇어요!",
                rating:10    
            },
            {
                user_id:1,
                store_id:2,
                comment:"맛잇어요!",
                rating:5    
            },
            {
                user_id:1,
                store_id:3,
                comment:"맛잇어요!",
                rating:9    
            },
            {
                user_id:2,
                store_id:1,
                comment:"맛잇어요!",
                rating:10    
            },
            {
                user_id:2,
                store_id:2,
                comment:"맛잇어요!",
                rating:7   
            },
            
        ])
        .execute();

        await connection
        .createQueryBuilder()
        .insert()
        .into(Favorite)
        .values([
            {
                user_id:1,
                store_address:"asdf",
                store_name:"생선구이가게",
                store_img:"./store.jpg"    
            },
            {
                user_id:1,
                store_address:"asdf",
                store_name:"생선구이가게2",
                store_img:"./store.jpg"    
            },
            
            
        ])
        .execute();

        

    }

}