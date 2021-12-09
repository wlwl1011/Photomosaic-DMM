import "./Mypage_fav.css";
import Star_avg from "../../components/star/star_avg/Star_avg";

interface Iprops {
  favNone: string;
}
function Mypage_fav(props: Iprops) {
  return (
    <>
      <li className={`mypage_fav_container ${props.favNone}`}>
        <div className="mypage_fav-box">
          <img className="mypage_fav-img" src="./jonglo_gui.gif" />
          <div className="mypage_fav-text-box">
            <div className="mypage_fav-title-box">
              <h1 className="mypage_fav-title">이거시 구이</h1>
              <span className="mypage_fav-text-day">2021-12-03</span>
            </div>
            <Star_avg />
            <h3 className="mypage_fav-text">서울시 종로구 5가 1231-2</h3>
          </div>
        </div>
      </li>
    </>
  );
}

export default Mypage_fav;
