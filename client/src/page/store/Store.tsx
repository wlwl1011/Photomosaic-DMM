import "./Store.css";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";
import Star_avg from "../../components/star/star_avg/Star_avg";
import Store_list from "../../components/store_list/Store_list";
import Kakao_map from "../../components/kakao_map/Kakao_map";
import { useState, useEffect } from "react";
import axios from "axios";

function Store() {
  const [chMessage, setChMessage] = useState<boolean>(false);
  const [mesNone, setMesNone] = useState<string>("");

  const handleImg = () => {
    setChMessage(!chMessage);
    if (chMessage) {
      setMesNone("");
    } else {
      setMesNone("store_balloon-none");
    }
  };

  useEffect(() => {
    (async () => {
      await axios
        .get(`https://localhost:4000/store/byId/1`, {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        })
        .then((res) => console.log(res));
      await axios
        .get(`https://localhost:4000/review/byStoreId/1`, {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        })
        .then((res) => console.log(res));
    })();
  }, []);

  return (
    <>
      <Header handleImg={handleImg} />
      <div className="store_container">
        <section className="store_info_container">
          <div className="store_info_box">
            <div className="store_info_box-line">
              <aside className="store_map-box">
                <Kakao_map />
              </aside>
              <div className="store_text-box">
                <div className="store_tx-title-box">
                  <div className="store_tx-box">
                    <h1 className="store_tx-title">전주식당</h1>
                    <Star_avg avg_rating={0} />
                  </div>
                  <div className="store_tx-icon-box">
                    <img className="store_tx-icon" src="/store/heart.svg" />
                    <img className="store_tx-icon" src="/store/edit.svg" />
                  </div>
                </div>
                <div className="store_tx-info-box">
                  <h3 className="store_tx-info-text">
                    주소: 서울특별시 종로구 관수동 43-2
                  </h3>
                  <h3 className="store_tx-info-text">
                    영업시간: 오전 8:00 ~ 오후: 8:50
                  </h3>
                  <h3 className="store_tx-info-text">연락처: 02)222-3333</h3>
                </div>
                <div className="store_tx-btn-box">
                  <button className="store-btn">대중교통 길찾기</button>
                  <button className="store-btn">차량 길찾기</button>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section className="store_review_container">
          <div className="store_review_box">
            <div className="store_review_count">
              <span>리뷰 (3)</span>
            </div>
            <ul className="store_review_ul-box">
              <Store_list mesNone={mesNone} />
              <Store_list mesNone={mesNone} />
            </ul>
          </div>
        </section>
      </div>
      <Footer />
    </>
  );
}

export default Store;
