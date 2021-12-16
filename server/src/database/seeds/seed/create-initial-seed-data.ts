import { Connection } from "typeorm";
import {Seeder,Factory} from "typeorm-seeding"
import { Favorite } from "../../../entities/favorite";
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
                address:"서울 은평구 응암로 287",
                open_time:"매일 10:00 ~ 24:00",
                phone_number:"02-389-4458",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F03062A03796811502C"
            },
            {
                menu_name:"감자국",
                store_name:"태조대림감자국",
                address:"서울 은평구 응암로 172",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-306-6535",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FCB7B6E61BFA6422792C0BDD34C695789"
            },
            {
                menu_name:"감자국",
                store_name:"원조이화감자국",
                address:"서울 은평구 응암로 174-1",
                open_time:"매일 09:00 ~ 23:00",
                phone_number:"02-307-4723",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F1346C2364FBEEB1F0A"
            },
            {
                menu_name:"감자국",
                store_name:"시골감자국",
                address:"서울 은평구 응암로 174",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-302-8484",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F166DD9354FBEE69E02"
            },
            {
                menu_name:"감자국",
                store_name:"서부감자국",
                address:"서울 은평구 서오릉로 8",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-356-4555",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F61a094fb0e92d5f45c585ea99ed82622e43a9b6b%3Foriginal"
            },
            {
                menu_name:"감자국",
                store_name:"성원감자국닭한마리",
                address:"서울 은평구 은평로 217",
                open_time:"",
                phone_number:"02-389-0823",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles8.naver.net%2FMjAxOTEyMThfMTgg%2FMDAxNTc2NjUxOTc1MzE4.w7rzOVYyxxQ_KDuMmRjiw6fkFivKixS_MYflPcSIq2sg.Btj6h0VwMSvt6Z_35Mco8FlFR3KF4MJHxTv7Rn-NJFkg.JPEG.pink3198%2FIMG_1591.jpg%3Ftype%3Dw580"
            },
            {
                menu_name:"감자국",
                store_name:"서부감자국",
                address:"서울 은평구 서오릉로 8",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-356-4555",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F61a094fb0e92d5f45c585ea99ed82622e43a9b6b%3Foriginal"
            },
            {
                menu_name:"생선구이",
                store_name:"전주식당",
                address:"서울 종로구 수표로20길 16-17",
                open_time:"월 ~ 토 08:00 ~ 21:00",
                phone_number:"02-2267-5385",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles6.naver.net%2FMjAyMTAyMDhfNDQg%2FMDAxNjEyNzU5NDQyNDQ3.qh2LFSgLVjyqPKptxXL_BM5MN2ZkSCSl5h_4L59d0Xsg.rdtxsEuHkqWjzjLJ1nPWgEKt_4G4WtdULg6SyUTLSLAg.JPEG.with_rang%2FDSCF0786.JPG%3Ftype%3Dw966"
            },
            {
                menu_name:"생선구이",
                store_name:"전주집",
                address:"서울 종로구 종로40가길 3",
                open_time:"매일 06:00 ~ 21:00",
                phone_number:"02-2267-6897",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F01062A03792FF91662"
            },
            {
                menu_name:"생선구이",
                store_name:"한일식당",
                address:"서울 종로구 수표로20길 16-17",
                open_time:"매일 11:00 ~ 22:00",
                phone_number:"02-2279-7343",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles16.naver.net%2FMjAyMTA0MDVfMjYz%2FMDAxNjE3NjI0NTY0NDI0.vr1Z5EYJgZJcHebsp9lctv6fITyJFWWdfEmi8MM8TScg.Rhm3U76iCunk6riDS0qzEBaZyVtyzDLO8v8lb8-8-JIg.JPEG.supercko%2F20210405%EF%BC%BF101134.jpg%3Ftype%3Dw966"
            },
            {
                menu_name:"닭한마리",
                store_name:"진옥화 할매원조닭한마리 본점",
                address:"서울 종로구 종로40가길 18",
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
                address:"서울 종로구 종로40가길 14",
                open_time:"매일 09:30 ~ 01:00",
                phone_number:"02-2266-8249",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ffd825456dee06c18e25dc8684760014a2b82bf89%3Foriginal"
            },
            {
                menu_name:"닭한마리",
                store_name:"백부장집닭한마리 본관",
                address:"서울 종로구 삼봉로 100-1",
                open_time:"월~토 10:30 ~ 22:00",
                phone_number:"02-732-2565",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F49c56e8a4f9904292ccfbc18effee9a3c6af7bc2%3Foriginal"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"나정순할매쭈꾸미",
                address:"서울 동대문구 무학로 144",
                open_time:"월~토 11:30 ~ 22:30, 월~토 브레이크타임 14:30 ~ 17:00",
                phone_number:"02-928-0231",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F4C28545947554149A02FCECEB2A82044"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"용두동쭈꾸미본점",
                address:"서울 동대문구 무학로36길 10",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-925-3127",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F587b85c13b52a034be750376e88dd8556194366c%3Foriginal"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"임오네쭈꾸미2호점",
                address:"서울 동대문구 왕산로16길 13",
                open_time:"",
                phone_number:"02-921-1628",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F28147e06795ae9ecb1a5cf8becc3da7e36fbdf6c%3Foriginal"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"고흥쭈꾸미",
                address:"서울 동대문구 무학로36길 14",
                open_time:"",
                phone_number:"02-922-8435",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FBD2EA98F17954754815349D6A9A1C870"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"용두동임오네쭈꾸미본점",
                address:"서울 동대문구 무학로36길 6",
                open_time:"매일 10:00 ~ 22:30",
                phone_number:"02-925-1628",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2F308A77CE073740F7934ED1290E7473F8"
            },
            {
                menu_name:"쭈꾸미",
                store_name:"나정순할매쭈꾸미",
                address:"서울 동대문구 약령시로 65",
                open_time:"월~토 11:00 ~ 22:00, 월~토 브레이크타임 15:00 ~ 16:30",
                phone_number:"",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F96b80b7b9c2e50caf46d7db9f01dac65f733eadf%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"마포진짜원조최대포 본점",
                address:"서울 마포구 마포대로 112",
                open_time:"매일 11:00 ~ 24:00",
                phone_number:"02-719-9292",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ffbef335f717f201198368a516fca4ee92917db5f%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"원조조박집 본관",
                address:"서울 마포구 토정로 313-1",
                open_time:"월~토 11:30 ~ 23:00, 월~토 브레이크타임 15:00 ~ 17:00",
                phone_number:"02-712-7462",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F3efd38cdbfb7dd2cf6c878027ad4c95ed61a35bf%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"장수갈매기 본점",
                address:"서울 마포구 도화길 46",
                open_time:"매일 10:00 ~ 02:00",
                phone_number:"02-716-7766",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Ft1.daumcdn.net%2Flocal%2Freview_placeapp%2Fbtql676alXd_HC9dUIWOx1cOoD2DDJXkhk_img.jpg"
            },
            {
                menu_name:"돼지갈비",
                store_name:"명인갈비",
                address:"서울 마포구 연남로 85",
                open_time:"매일 11:30 ~ 21:50",
                phone_number:"02-3142-8292",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles9.naver.net%2FMjAyMDEyMTVfMTA0%2FMDAxNjA4MDEzODU4NDQx.MojElQa77sLn6iigN1D31LIneCdpfnRxcz7c3_ElT4gg.7WjxEmeFQSbmQ169oe0AoX_GxS5NZsl6xh4fdeLX1nkg.JPEG.nada4795%2FIMG_1348.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"돼지갈비",
                store_name:"강강술래 홍대점",
                address:"서울 마포구 잔다리로6길 25",
                open_time:"매일 11:30 ~ 23:00",
                phone_number:"02-3143-6635",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fa6e4363e2f56f38ef1272aba44b31c7278f49089%3Foriginal"
            },
            {
                menu_name:"돼지갈비",
                store_name:"양화정숯불갈비",
                address:"서울 마포구 월드컵로1길 17",
                open_time:"매일 11:30 ~ 22:00",
                phone_number:"02-323-5777",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe7369d09e8ff3828b4cb5f7d91b00752dd461254%3Foriginal](https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe7369d09e8ff3828b4cb5f7d91b00752dd461254%3Foriginal"
            },
            {
                menu_name:"족발",
                store_name:"마포왕족발",
                address:"서울 마포구 만리재로 19",
                open_time:"월~토 00:00 ~ 24:00",
                phone_number:"02-717-2126",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2F4BEB1DA5ACFF470496BE9412DD4ADA80"
            },
            {
                menu_name:"족발",
                store_name:"영광보쌈",
                address:"서울 마포구 만리재로1길 14",
                open_time:"일요일",
                phone_number:"02-716-0873",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe7788adfb7cbe9098ae9883d441f5a1da5b510d7%3Foriginal"
            },
            {
                menu_name:"족발",
                store_name:"마포소문난원조족발",
                address:"서울 마포구 만리재로 19",
                open_time:"매일 07:00 ~ 01:00",
                phone_number:"",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Ft1.daumcdn.net%2Flocal%2Freview_placeapp%2FbtqrRJZEcrr_VT191xSXEHVKFhXZvTmKB1_img.jpg"
            },
            {
                menu_name:"족발",
                store_name:"장수족발",
                address:"서울 마포구 만리재로 19",
                open_time:"매일 10:00 ~ 02:00 (늦은시간 방문은 미리연락요망)",
                phone_number:"010-552-4348",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FD8CA6CA8CFD246EEBE701E7300E878FF"
            },
            {
                menu_name:"족발",
                store_name:"한방족발",
                address:"서울 마포구 만리재로 19",
                open_time:"매일 10:00 ~ 02:00 (늦은시간 방문은 미리연락요망)",
                phone_number:"02-706-2126",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2F61F669C1C85E4A6C82DABFC7415D2FA6"
            },
            {
                menu_name:"족발",
                store_name:"마포오항족발",
                address:"서울 마포구 만리재로 19",
                open_time:"월~토 10:00 ~ 24:00",
                phone_number:"02-715-7719",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F2357428e8045d5e5a10ba6a0867225b740f5acf6%3Foriginal"
            },
            {
                menu_name:"족발",
                store_name:"평안도족발집",
                address:"서울 중구 장충단로 174-6",
                open_time:"화~일 12:00 ~ 22:00",
                phone_number:"02-2279-9759",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F112E49154C7CB3388E"
            },
            {
                menu_name:"족발",
                store_name:"뚱뚱이할머니집",
                address:"서울 중구 장충단로 174-1",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-2279-2714",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fb0fb9fc599fa912e4e2dd51115dcca70260f58b5%3Foriginal"
            },
            {
                menu_name:"족발",
                store_name:"원조1호 장충동할머니집",
                address:"서울 중구 장충단로 174",
                open_time:"매일 09:30 ~ 23:30",
                phone_number:"02-2279-9979",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FD80FCF6FFF074B64909DE9A11BE8BA18"
            },
            {
                menu_name:"족발",
                store_name:"평남할머니집족발",
                address:"서울 중구 장충단로 170-1",
                open_time:"매일 11:30 ~ 22:00",
                phone_number:"02-2275-7580",
                store_img:"[https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles16.naver.net%2FMjAyMDEwMjZfMjcx%2FMDAxNjAzNzIwOTI5MTkz.Vx4HA7yCen-T1L3NI17ctPuB2j7PH1UfH08fji3G16og.qFvMhEasLelp2hcIFHxcTuxIsum669sNOIuke8ux3lYg.JPEG.go10billion%2F20201026%EF%BC%BF191725.jpg%3Ftype%3Dw773](https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles16.naver.net%2FMjAyMDEwMjZfMjcx%2FMDAxNjAzNzIwOTI5MTkz.Vx4HA7yCen-T1L3NI17ctPuB2j7PH1UfH08fji3G16og.qFvMhEasLelp2hcIFHxcTuxIsum669sNOIuke8ux3lYg.JPEG.go10billion%2F20201026%25EF%25BC%25BF191725.jpg%3Ftype%3Dw773)"
            },
            {
                menu_name:"족발",
                store_name:"장충족발집",
                address:"서울 중구 장충단로 170-5",
                open_time:"매일 10:00 ~ 23:30",
                phone_number:"02-2268-0325",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles11.naver.net%2FMjAxOTEwMTVfMTA1%2FMDAxNTcxMTQ1OTUwOTIy.A6XYoP9O4WcO27d-MXipTq7AGYunUNIUEQrSMVcnpnEg.Ff88mlo9tLJdkb9ewIQR9ZO-Vgm_O52HyHT5OSer294g.JPEG.hongdangmoodeco%2FSE-ed1c3613-e918-4a84-b388-552230665a19.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"족발",
                store_name:"노다지평양집족발",
                address:"서울 중구 퇴계로56길 31",
                open_time:"매일 11:00 ~ 05:00",
                phone_number:"02-2278-0557",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F2024ED194B99CD0889"
            },
            {
                menu_name:"족발",
                store_name:"조옥당 약수본점",
                address:"서울 중구 동호로12길 39",
                open_time:"월,화,수,목,일 12:00 ~ 23:00",
                phone_number:"02-2232-8282",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fa71c68b8e4655856d56d54633a6040d4e122b8c8%3Foriginal"
            },
            {
                menu_name:"떡볶이",
                store_name:"신당동떡볶이 삼대할먼네",
                address:"서울 중구 퇴계로76길 54",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-2233-1559",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles2.naver.net%2FMjAyMTA0MTRfMTEg%2FMDAxNjE4NDA5MzUyNzI2.2L8JuNpXgKjGwn_AMwCyjx6D5SU5rs6cYBPV-RBrGkgg.rBBxo8XOgmUkOB2GleeSZ5soLd_bKPM6pun8rexQ0gog.JPEG.hjjo8470%2FIMG_6429.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"떡볶이",
                store_name:"마복림떡볶이",
                address:"서울 중구 다산로35길 5",
                open_time:"월~금 09:00 ~ 24:00",
                phone_number:"02-2232-8930",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe8c2045f8c10b59dbe0834b496d57df39ad670b5%3Foriginal"
            },
            {
                menu_name:"떡볶이",
                store_name:"진미떡볶이",
                address:"서울 중구 다산로38길 60",
                open_time:"매일 11:00 ~ 21:00",
                phone_number:"02-2252-5889",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F53337c7465416843902f0225d721b76e132cf53f%3Foriginal"
            },
            {
                menu_name:"곱창",
                store_name:"왕십리한양곱창",
                address:"서울 성동구 왕십리로 357",
                open_time:"매일 16:00 ~ 22:30",
                phone_number:"",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Fpostfiles.pstatic.net%2FMjAyMTA0MDhfMTY2%2FMDAxNjE3ODcyMjAwMjMy.YJY6nOL21_EUlfn38739zGMn3RuLRQhOTe5E_qgrw6Ag.Dtr942v8froEwKzGmJUlBEAzGizwYxchWdpyIMAF4tMg.JPEG.zizonjunsoo%2F20210402%EF%BC%BF202229.jpg%3Ftype%3Dw966"
            },
            {
                menu_name:"곱창",
                store_name:"수상한막창 왕십리점",
                address:"서울 성동구 무학봉28길 20",
                open_time:"월~금 16:00 ~ 00:00",
                phone_number:"02-2282-3177",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalad_thumb%2Ft%2Fe3b23ac62b95f92ab35bd14a0a96a8e63be62527"
            },
            {
                menu_name:"곱창",
                store_name:"호남곱창",
                address:"서울 성동구 왕십리로21길 39",
                open_time:"",
                phone_number:"02-2294-1402",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ff0da82933a9eee49555c3df32d0ef93b40c7f2a0%3Foriginal"
            },
            {
                menu_name:"곱창",
                store_name:"곱순이네",
                address:"서울 성동구 무학봉26길 12-1",
                open_time:"매일 10:00 ~ 24:00",
                phone_number:"02-2299-9600",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles16.naver.net%2FMjAyMTA1MDNfMjk3%2FMDAxNjIwMDQyMzY3NDkz.Jpz-JuBXKL_wnEZHcXlGfLwUpE0KCvNMMmiOoSmqbrUg.3a3Cwd1T4l7g16RHC_siMMpe5cjLJSCJJzOdljw66BUg.JPEG.actimon23%2F1620041177903.jpg%3Ftype%3Dw580"
            },
            {
                menu_name:"곱창",
                store_name:"곱창쓰",
                address:"서울 성동구 왕십리로21길 17",
                open_time:"매일 14:00 ~ 02:00",
                phone_number:"02-2292-9838",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles14.naver.net%2FMjAyMDA2MDVfMjA4%2FMDAxNTkxMzI1ODI3MTgx.-4pt_8TzXdrapcM5rp7-D-uOLi_CFSmuSh1dgA33IoAg.VqYri6BQO24aCytvooTR2q67b2lYoFBpfxjy2bthACcg.JPEG.ktjktj11%2F1591325826814.jpg%3Ftype%3Dw966"
            },
            {
                menu_name:"타코",
                store_name:"타코아미고",
                address:"서울 용산구 보광로 123",
                open_time:"매일 12:00 ~ 22:00",
                phone_number:"02-749-5253",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fbc59509f72f58dd1d6efc909536b149d9c5093a8%3Foriginal"
            },
            {
                menu_name:"브리스킷",
                store_name:"로우앤슬로우",
                address:"서울 용산구 보광로 126",
                open_time:"매일 13:00 ~ 21:00 (예약제로만 운영)",
                phone_number:"02-793-2268",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F8941474843b748dcc3f656406f8b9e6e21af6a2a%3Foriginal"
            },
            {
                menu_name:"퀘사디아",
                store_name:"바토스 이태원점",
                address:"서울 용산구 이태원로15길 1",
                open_time:"월,화,수,목,일 11:30 ~ 22:00, 월~금 브레이크타임 15:00 ~ 17:00",
                phone_number:"02-797-8226",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F9dd4014b7d7fe7ba1fdd80d94ee76a6531c5828e%3Foriginal"
            },
            {
                menu_name:"파스타",
                store_name:"라쿠치나",
                address:"서울 용산구 회나무로44길 10",
                open_time:"월~토 12:00 ~ 22:00, 월~토 12:00 ~ 22:00",
                phone_number:"02-794-6005",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fb57aa5294dd83adc3459bc9fdbefb44b7590b627%3Foriginal"
            },
            {
                menu_name:"쏨탐",
                store_name:"쏭타이 이태원점",
                address:"서울 용산구 이태원로20가길 7-2",
                open_time:"매일 12:00 ~ 23:30",
                phone_number:"02-798-2495",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F90612D69A5694B0593EEB35EEDEB962A"
            },
            {
                menu_name:"똠양꿍",
                store_name:"부다스벨리",
                address:"서울 용산구 녹사평대로40길 48",
                open_time:"매일 11:30 ~ 22:00, 매일 브레이크타임 15:30 ~ 16:30",
                phone_number:"",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F38C9D5A36812428EBF673569FB67A1D4"
            },
            {
                menu_name:"갈비",
                store_name:"마포최대포숯불갈비",
                address:"서울 동작구 서달로14길 11",
                open_time:"",
                phone_number:"02-817-0738",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F234d857768045c1ffb31921f33033ef28f88b85a%3Foriginal"
            },
            {
                menu_name:"갈비",
                store_name:"고기싸롱 중앙대점",
                address:"서울 동작구 흑석로 106-5",
                open_time:"매일 12:00 ~ 23:30",
                phone_number:"02-812-1418",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Fpostfiles.pstatic.net%2FMjAyMTA2MTFfMTAg%2FMDAxNjIzMzk1MzQ3OTU4.Nz0_4jqhUVDq-boqmVTdqu5gQPFQIc_QH4y4LTVGvZgg.vx_UZuOHIkCPTmSgyF9p6BhVNGY8t-pkC8JBaZV0luMg.JPEG.shguswls3773%2FKakaoTalk_20210611_154525667.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"갈비",
                store_name:"황토정",
                address:"서울 동작구 서달로14길 22",
                open_time:"",
                phone_number:"02-822-4754",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles3.naver.net%2FMjAxOTA4MDZfMjc3%2FMDAxNTY1MDIwNTY5NjE5.MTsB8HvU8Do1pNon-8M1qHVAPfIsn0OfMshDPfD8ldUg.Bwpp3z2Qrxe9-1EIJ59gvt9xkW2NbrF57XHg2NpBqbIg.JPEG.sala7305%2FKakaoTalk_20190806_005333051.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"순대",
                store_name:"원조민속순대타운",
                address:"서울 관악구 신림로59길 14",
                open_time:"",
                phone_number:"02-876-7727",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FA873F7905CAD4F7B943D767AC3C1A5AE"
            },
            {
                menu_name:"순대",
                store_name:"털보네순대국",
                address:"서울 관악구 미성길 6",
                open_time:"휴무일 둘째,넷째 토요일",
                phone_number:"02-851-3407",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Fpostfiles.pstatic.net%2FMjAyMTEwMTNfMTY4%2FMDAxNjM0MDkwMjY1Mjk1.WxEb7dxt7kzV_Hm0PpKayilOhuerIDzgfaSwrSogHpAg.jo2NuwwQgeYwpuSEWW9k1arqX0Id8hbkqsjqc_mUim0g.JPEG.halladosol%2F%EA%BE%B8%EB%AF%B8%EA%B8%B020211005_125643.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"순대",
                store_name:"계경순대국 신대방점",
                address:"서울 관악구 조원로 101",
                open_time:"매일 00:00 ~ 24:00",
                phone_number:"02-866-7545",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles15.naver.net%2FMjAyMDEyMjhfMTk1%2FMDAxNjA5MTYxMTM2NTMy.8rqW9yWGUrm0jgjp9vX-APhC-ZyDjtyJRsrQ7X0qpqQg.zzGQUm0GdpiVHgyKv8Vo8Xc2lBYJRbLBiqE1jx-CGTwg.JPEG.so_iing%2FIMG_0210.JPG%3Ftype%3Dw773"
            },
            {
                menu_name:"순대",
                store_name:"50년순대장인 추억",
                address:"서울 관악구 신림로26길 11",
                open_time:"매일 10:00 ~ 21:00",
                phone_number:"",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Fpostfiles.pstatic.net%2FMjAyMTA2MjNfNTkg%2FMDAxNjI0NDA3OTYxOTQx.lAkeLsyLuS2nrUk9HABIG2eyUoUwrOoMGhjX0GgdAUgg.Ojx49WOvLQI8DUBaJ-_YCfLb4DQeygG_EAKd04o7BqQg.JPEG.iamwinmir%2FSE-1fa53ccc-d8fd-4eca-9d40-8aee231eaa90.jpg%3Ftype%3Dw773"
            },
            {
                menu_name:"곱창",
                store_name:"세광양대창 교대본점",
                address:"서울 서초구 반포대로28길 79",
                open_time:"매일 12:00 ~ 02:00",
                phone_number:"02-583-6692",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe04d52ecceb76afb9c565cae1b92ab017c41842f%3Foriginal"
            },
            {
                menu_name:"곱창",
                store_name:"세광양대창 교대2호점",
                address:"서울 서초구 서초대로46길 99",
                open_time:"매일 17:00 ~ 03:00",
                phone_number:"02-587-8188",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles16.naver.net%2FMjAyMDA3MjdfMjA1%2FMDAxNTk1ODQ1MDI2NDE2.ObyNlBvlpxD_pABj1F-aKRhq7EVMQ59QG_GmRSf9luEg.et8H7gIjzJe85oIxpKwXwzErpGn-52PHyfAGlsvy1f4g.JPEG.silver4429%2FKakaoTalk_20200725_192501248_28.jpg%3Ftype%3Dw966"
            },
            {
                menu_name:"곱창",
                store_name:"교대곱창",
                address:"서울 서초구 서초중앙로 77",
                open_time:"매일 12:00 ~ 23:00",
                phone_number:"02-3474-9167",
                store_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F1527F5104C846DFAA2"
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
        .into(MenuByArea)
        .values([
            {
                area_name:"은평구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fcfile%2F03062A03796811502C",
                menu_name:"감자국",
                comment:""    
            },
            {
                area_name:"종로구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2F6A6A5B1EB44B45589BE66AF7464432B2",
                menu_name:"닭한마리",
                comment:""    
            },
            {
                area_name:"종로구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles6.naver.net%2FMjAyMTAyMDhfNDQg%2FMDAxNjEyNzU5NDQyNDQ3.qh2LFSgLVjyqPKptxXL_BM5MN2ZkSCSl5h_4L59d0Xsg.rdtxsEuHkqWjzjLJ1nPWgEKt_4G4WtdULg6SyUTLSLAg.JPEG.with_rang%2FDSCF0786.JPG%3Ftype%3Dw966",
                menu_name:"생선구이",
                comment:""    
            },
            {
                area_name:"동대문구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F4C28545947554149A02FCECEB2A82044",
                menu_name:"쭈꾸미",
                comment:""    
            },
            {
                area_name:"마포구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ffbef335f717f201198368a516fca4ee92917db5f%3Foriginal",
                menu_name:"갈비",
                comment:""    
            },
            {
                area_name:"마포구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FD8CA6CA8CFD246EEBE701E7300E878FF",
                menu_name:"족발",
                comment:""    
            },
            {
                area_name:"중구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fb0fb9fc599fa912e4e2dd51115dcca70260f58b5%3Foriginal",
                menu_name:"족발",
                comment:""    
            },
            {
                area_name:"중구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Fpostfiles2.naver.net%2FMjAyMTA0MTRfMTEg%2FMDAxNjE4NDA5MzUyNzI2.2L8JuNpXgKjGwn_AMwCyjx6D5SU5rs6cYBPV-RBrGkgg.rBBxo8XOgmUkOB2GleeSZ5soLd_bKPM6pun8rexQ0gog.JPEG.hjjo8470%2FIMG_6429.jpg%3Ftype%3Dw773",
                menu_name:"떡볶이",
                comment:""    
            },
            {
                area_name:"성동구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Fpostfiles.pstatic.net%2FMjAyMTA0MDhfMTY2%2FMDAxNjE3ODcyMjAwMjMy.YJY6nOL21_EUlfn38739zGMn3RuLRQhOTe5E_qgrw6Ag.Dtr942v8froEwKzGmJUlBEAzGizwYxchWdpyIMAF4tMg.JPEG.zizonjunsoo%2F20210402%EF%BC%BF202229.jpg%3Ftype%3Dw966",
                menu_name:"곱창",
                comment:""    
            },
            {
                area_name:"용산구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fbc59509f72f58dd1d6efc909536b149d9c5093a8%3Foriginal",
                menu_name:"타코",
                comment:""    
            },
            {
                area_name:"용산구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F8941474843b748dcc3f656406f8b9e6e21af6a2a%3Foriginal",
                menu_name:"브리스킷",
                comment:""    
            },
            {
                area_name:"용산구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F9dd4014b7d7fe7ba1fdd80d94ee76a6531c5828e%3Foriginal",
                menu_name:"퀘사디아",
                comment:""    
            },
            {
                area_name:"용산구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fb57aa5294dd83adc3459bc9fdbefb44b7590b627%3Foriginal",
                menu_name:"파스타",
                comment:""    
            },
            {
                area_name:"용산구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F90612D69A5694B0593EEB35EEDEB962A",
                menu_name:"쏨탐",
                comment:""    
            },
            {
                area_name:"용산구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F38C9D5A36812428EBF673569FB67A1D4",
                menu_name:"똠양꿍",
                comment:""    
            },
            {
                area_name:"동작구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F234d857768045c1ffb31921f33033ef28f88b85a%3Foriginal",
                menu_name:"갈비",
                comment:""    
            },
            {
                area_name:"관악구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=https%3A%2F%2Fpostfiles.pstatic.net%2FMjAyMTEwMTNfMTY4%2FMDAxNjM0MDkwMjY1Mjk1.WxEb7dxt7kzV_Hm0PpKayilOhuerIDzgfaSwrSogHpAg.jo2NuwwQgeYwpuSEWW9k1arqX0Id8hbkqsjqc_mUim0g.JPEG.halladosol%2F%EA%BE%B8%EB%AF%B8%EA%B8%B020211005_125643.jpg%3Ftype%3Dw773",
                menu_name:"순대",
                comment:""    
            },
            {
                area_name:"서초구",
                menu_img:"https://img1.kakaocdn.net/relay/local/R680x420/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe04d52ecceb76afb9c565cae1b92ab017c41842f%3Foriginal",
                menu_name:"곱창",
                comment:""    
            },
              
            
        ])
        .execute();

    }

}