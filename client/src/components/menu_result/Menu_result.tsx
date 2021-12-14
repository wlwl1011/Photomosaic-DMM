import { Link } from "react-router-dom";
import Star_avg from "../star/star_avg/Star_avg";
import "./Menu_result.css";

// image, star 영역 디스플레이, 포지션 동적 관리
// 검색 누를경우 사라지지 않는 문제로 인해 생성
interface Iprops {
  imageBox: string;
  starNone: string;
  store_list: {
    id:number;
    address: string;
    avg_rating: number;
    menu_name: string;
    store_name: string;
    num_review: number;
    open_time: string;
    phone_number: string;
    store_img: string;
  };
}
function Menu_result(props: Iprops) {
  return (
    <>
     <Link to={ {pathname:`/store/${props.store_list.id}` }} style={{textDecoration: 'none'}} >
      <li className="menu_result-list">
        <div className={`menu_result-img-box ${props.imageBox}`}>
          <div className={`menu_result-star-box ${props.starNone}`}>
            <Star_avg avg_rating={props.store_list.avg_rating} />
          </div>
          <img className="menu_result-img" src="/jongro.jpeg" />
        </div>
        <div className="menu_result-text-box">
          <h1>{props.store_list.store_name}</h1>
          <div className="menu_result-text-info-box">
            <h3 className="menu_result-text-info">
              {props.store_list.address}
            </h3>
            <h3 className="menu_result-text-info">
              영업시간: {props.store_list.open_time}
            </h3>
            <h3 className="menu_result-text-info">
              연락처: 02) {props.store_list.phone_number}
            </h3>
          </div>
        </div>
      </li>
      </Link>
    </> 
  );
}

export default Menu_result;
