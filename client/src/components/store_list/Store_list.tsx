import "./Store_list.css";
import Star_small from "../../components/star/star_small/Star_small";

interface Iprops {
  mesNone: string;
}

function Store_list(props: Iprops) {
  return (
    <>
      <li className="store_review_li-box">
        <img className="store_review_img" src="./store/model.jpeg" />

        <div className={`store_balloon ${props.mesNone}`}>
          <div className="store_review-info">
            <div className="store_review-info-box">
              <span className="store_review-info-text">이진성</span>
              <span className="store_review-info-day">2021-12-01</span>
              <Star_small />
              <span className="store_review-good">👍🏻 29</span>
            </div>
            <img className="store_review-icon" src="./search/close.svg" />
          </div>
          <h3 className="store_review-content">
            우아아아 저어어어어말로 진이이이이짜 맛있어요!! 우아아아
            저어어어어말로 진이이이이짜 맛있어요!!우아아아 저어어어어말로
            진이이이이짜 맛있어요!!
          </h3>
        </div>
      </li>
    </>
  );
}

export default Store_list;
