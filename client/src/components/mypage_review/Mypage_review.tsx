import "./Mypage_review.css";
import Star_avg from "../../components/star/star_avg/Star_avg";

interface Iprops {
  reviewNone: string;
}

function Mypage_review(props: Iprops) {
  return (
    <>
      <li className={`mypage_review_container ${props.reviewNone}`}>
        <div className="mypage_review_box">
          <div className="mypage_review_box">
            <h1 className="mypage_review_title">대박난 종로 닭</h1>
            <Star_avg />
          </div>
          <span className="mypage_review_day">2021-12-03</span>
        </div>
        <div className="mypage_review_text-box">
          <h3>
            우아아아 저어어어어말로 진이이이이짜 맛있어요!! 우아아아
            저어어어어말로 진이이이이짜 맛있어요!!우아아아 저어어어어말로
            진이이이이짜 맛있어요!!
          </h3>
        </div>
      </li>
    </>
  );
}

export default Mypage_review;
