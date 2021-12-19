import "./Mypage_fav.css";
import Star_avg from "../../components/star/star_avg/Star_avg";

interface Iprops {
  favNone: string;
  fav_info: {
    created_at: string;
    rating: number;
    store_address: string;
    store_img: string;
    store_name: string;
    avg_rating:number
  };
}
function Mypage_fav(props: Iprops) {
  return (
    <>
      <li className={`mypage_fav_container ${props.favNone}`}>
        <div className="mypage_fav-box">
          <img className="mypage_fav-img" src={props.fav_info.store_img} />
          <div className="mypage_fav-text-box">
            <div className="mypage_fav-title-box">
              <h1 className="mypage_fav-title">{props.fav_info.store_name}</h1>
              <span className="mypage_fav-text-day">
                {props.fav_info.created_at.slice(0, 10)}
              </span>
            </div>
            <Star_avg avg_rating={props.fav_info.avg_rating} />
            <h3 className="mypage_fav-text">{props.fav_info.store_address}</h3>
          </div>
        </div>
      </li>
    </>
  );
}

export default Mypage_fav;
