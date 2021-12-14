import "./Mypage.css";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import Mypage_review from "../../components/mypage_review/Mypage_review";
import Mypage_fav from "../../components/mypage_fav/Mypage_fav";
import Mypage_empty from "../../components/mypage_empty/Mypage_empty";
import ProfileEdit from "../../components/profile/ProfileEdit";
import Signout from "../../components/signout/Signout";
import { useEffect, useState } from "react";
import axios from "axios";

interface user_info {
  user_name: string;
  created_at: string;
  user_img: string;
}

interface review_info {
  comment: string;
  rating: number;
  created_at: string;
  store_name: string;
}

interface fav_info {
  created_at: string;
  rating: number;
  store_address: string;
  store_img: string;
  store_name: string;
}

function Mypage() {
  const handleImg = () => {};
  // empty 빈 화면 출력 관리
  // empty 초기 화면 설정
  const [empty, setEmpty] = useState<boolean>(false);

  // 필터 관리
  const [reviewNone, setReviewNone] = useState<string>("review_none");
  const [favNone, setFavNone] = useState<string>("");
  const [revselect, setRevSelect] = useState<string>("");
  const [favselect, setFavSelect] = useState<string>("mypage_select_fav-check");

  const [profilewNone, setProfilewNone] = useState<string>("profile_hidden");
  const [signoutNone, setSignoutNone] = useState<string>("signout_hidden");

  // 유저 정보
  const [userInfo, setUserInfo] = useState<user_info>({
    user_name: "",
    created_at: "",
    user_img: "",
  });

  const [reviewInfo, setReviewInfo] = useState<review_info[]>([]);
  const [favInfo, setFavInfo] = useState<fav_info[]>([]);

  const handleFav = () => {
    setReviewNone("review_none");
    setFavNone("");
    setFavSelect("mypage_select_fav-check");
    setRevSelect("");

    if (favInfo.length === 0) {
      setEmpty(true);
    } else {
      setEmpty(false);
    }
  };

  const handleReivew = () => {
    setFavNone("fav_none");
    setReviewNone("");
    setRevSelect("mypage_select_review-check");
    setFavSelect("");

    if (reviewInfo.length === 0) {
      setEmpty(true);
    } else {
      setEmpty(false);
    }
  };

  const profileEdit = (e: string) => {
    setProfilewNone(e);
  };
  const signoutEdit = (e: string) => {
    setSignoutNone(e);
  };

  useEffect(() => {
    (async () => {
      const userData = await axios.get(
        `https://localhost:4000/user/userinfo/userdata`,
        {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        }
      );

      const reviewData = await axios.get(
        `https://localhost:4000/review/myreview`,
        {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        }
      );

      const favData = await axios.get(`https://localhost:4000/favorite/list`, {
        headers: { "Content-Type": "application/json" },
        withCredentials: true,
      });

      setUserInfo(userData.data.data);
      setReviewInfo(reviewData.data.data);
      setFavInfo(favData.data.data);
    })();
  }, []);

  // console.log("유저 정보", userInfo);
  // console.log("리뷰", reviewInfo);

  // 초기 렌더링 상태에 찜하기 목록이 먼저 주어지므로 있는지 없는지 판별
  useEffect(() => {
    if (favInfo.length === 0) {
      setEmpty(true);
    } else {
      setEmpty(false);
    }
  }, [favInfo]);

  return (
    <>
      <Header handleImg={handleImg} isLogin={true} />
      <section className="mypage_info_container">
        <div className="mypage_info_box">
          <img className="mypage_info_img" src="/store/model.jpeg" />
          <div className="mypage_info_text-box">
            <h1 className="mypage_info_title">{userInfo.user_name}</h1>
            <span className="mypage_info_sign">가입일자</span>
            <span className="mypage_info_sign-day">
              {userInfo.created_at.slice(0, 10)}
            </span>
          </div>
        </div>
        <div>
          <button className="mypage-btn" onClick={() => signoutEdit("")}>
            회원탈퇴
          </button>
          <button className="mypage-btn" onClick={() => profileEdit("")}>
            정보수정
          </button>
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
        {favInfo.map((item: fav_info) => (
          <Mypage_fav favNone={favNone} fav_info={item} />
        ))}

        {reviewInfo.map((item: review_info) => (
          <Mypage_review reviewNone={reviewNone} review_info={item} />
        ))}

        {empty ? <Mypage_empty /> : null}
      </ul>
      <ProfileEdit profilewNone={profilewNone} profileEdit={profileEdit} />
      <Signout signoutNone={signoutNone} signoutEdit={signoutEdit} />
      <Footer />
    </>
  );
}

export default Mypage;
