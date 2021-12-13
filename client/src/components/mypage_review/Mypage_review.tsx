import "./Mypage_review.css";
import Star_avg from "../../components/star/star_avg/Star_avg";

interface Iprops {
  reviewNone: string;
  review_info: {
    comment: string;
    rating: number;
    created_at: string;
    store_name: string;
  };
}

function Mypage_review(props: Iprops) {
  return (
    <>
      <li className={`mypage_review_container ${props.reviewNone}`}>
        <div className="mypage_review_box">
          <div className="mypage_review_box">
            <h1 className="mypage_review_title">
              {props.review_info.store_name}
            </h1>
            <Star_avg avg_rating={props.review_info.rating} />
          </div>
          <span className="mypage_review_day">
            {props.review_info.created_at.slice(0, 10)}
          </span>
        </div>
        <div className="mypage_review_text-box">
          <h3>{props.review_info.comment}</h3>
        </div>
      </li>
    </>
  );
}

export default Mypage_review;
