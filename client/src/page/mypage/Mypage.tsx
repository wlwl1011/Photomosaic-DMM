import "./Mypage.css";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import Mypage_review from "../../components/mypage_review/Mypage_review";
import Mypage_fav from "../../components/mypage_fav/Mypage_fav";
import Mypage_empty from "../../components/mypage_empty/Mypage_empty";
import { useState } from "react";
function Mypage() {
  const handleImg = () => {};
  // empty 빈 화면 출력 관리
  // empty 초기 화면 설정
  const [empty, setEmpty] = useState<boolean>(false);
  const [emptyNone, setEmptyNone] = useState<string>("");

  // 필터 관리
  const [reviewNone, setReviewNone] = useState<string>("review_none");
  const [favNone, setFavNone] = useState<string>("fav_none");
  const [revselect, setRevSelect] = useState<string>("");
  const [favselect, setFavSelect] = useState<string>("");

  const handleFav = () => {
    setEmptyNone("empty_none");
    setReviewNone("review_none");
    setFavNone("");
    setFavSelect("mypage_select_fav-check");
    setRevSelect("");
  };

  const handleReivew = () => {
    setEmptyNone("empty_none");
    setFavNone("fav_none");
    setReviewNone("");
    setRevSelect("mypage_select_review-check");
    setFavSelect("");
  };
  return (
    <>
      <Header handleImg={handleImg} />
      <section className="mypage_info_container">
        <div className="mypage_info_box">
          <img className="mypage_info_img" src="./store/model.jpeg" />
          <div className="mypage_info_text-box">
            <h1 className="mypage_info_title">California</h1>
            <span className="mypage_info_sign">가입일자</span>
            <span className="mypage_info_sign-day">2021-12-01</span>
          </div>
        </div>
        <div>
          <button className="mypage-btn">회원탈퇴</button>
          <button className="mypage-btn">정보수정</button>
        </div>
      </section>
      <nav className="mypage_select_container">
        <span className={`mypage_select_text ${favselect}`} onClick={handleFav}>
          내가 누른 찜하기
        </span>
        <span
          className={`mypage_select_text ${revselect}`}
          onClick={handleReivew}
        >
          내가 작성한 리뷰
        </span>
      </nav>
      <ul className="mypage_result_container">
        {empty ? null : <Mypage_empty emptyNone={emptyNone} />}
        <Mypage_fav favNone={favNone} />
        <Mypage_review reviewNone={reviewNone} />
      </ul>
      <Footer />
    </>
  );
}

export default Mypage;
