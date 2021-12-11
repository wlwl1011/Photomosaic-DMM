import Star_avg from "../star/star_avg/Star_avg";
import "./Menu_result.css";

// image, star 영역 디스플레이, 포지션 동적 관리
// 검색 누를경우 사라지지 않는 문제로 인해 생성
interface Iprops {
  imageBox: string;
  starNone: string;
}
function Menu_result(props: Iprops) {
  return (
    <>
      <li className="menu_result-list">
        <div className={`menu_result-img-box ${props.imageBox}`}>
          <div className={`menu_result-star-box ${props.starNone}`}>
            <Star_avg avg_rating={0} />
          </div>
          <img className="menu_result-img" src="./jongro.jpeg" />
        </div>
        <div className="menu_result-text-box">
          <h1>종로 닭집</h1>
          <div className="menu_result-text-info-box">
            <h3 className="menu_result-text-info">
              서울시 종로구 탑골로 941-21
            </h3>
            <h3 className="menu_result-text-info">
              영업시간: 오전 9:00 ~ 오후 10:30
            </h3>
            <h3 className="menu_result-text-info">연락처: 02) 445 - 3333</h3>
          </div>
        </div>
      </li>
    </>
  );
}

export default Menu_result;
