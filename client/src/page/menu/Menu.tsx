import "./Menu.css";
import React, { useEffect, useState } from "react";
import Footer from "../../components/footer/Footer";
import Header from "../../components/header/Header";
import Menu_result from "../../components/menu_result/Menu_result";
import Kakao_map from "../../components/kakao_map/Kakao_map";
import axios from "axios";

function Menu() {
  // ******************************************************
  // image, star 영역 디스플레이, 포지션 동적 관리
  // 검색 누를경우 사라지지 않는 문제로 인해 생성
  const [chImage, setChImage] = useState<boolean>(false);
  const [imageBox, setImageBox] = useState<string>("");
  const [starNone, setStarNone] = useState<string>("");

  const handleImg = () => {
    setChImage(!chImage);
    if (chImage) {
      setImageBox("");
      setStarNone("");
    } else {
      setImageBox("menu_result-img-box-hidden");
      setStarNone("menu_result-star-hidden");
    }
  };
  // ******************************************************
  useEffect(() => {
    (async () => {
      await axios
        .get(`https://localhost:4000/store/byMenu/생선구이`, {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        })
        .then((res) => console.log(res));
    })();
  }, []);
  return (
    <>
      <Header handleImg={handleImg} />
      <section className="menu_container">
        <div className="menu_box">
          <div className="menu_infor-box">
            <aside className="menu_infor-box1">
              <div className="menu_infor-container-img">
                <img className="menu_infor-img" src="./jonglo_gui.gif" />
              </div>
              <div className="menu_infor-container-text">
                <h4 className="menu_infor-text">종로의 대표 음식</h4>
                <h1 className="menu_infor-text-main">가자미구이</h1>
              </div>
            </aside>
            <div className="menu_infor-map-box">
              <div className="menu_infor-map">
                <Kakao_map />
              </div>
            </div>
          </div>
        </div>
        <div className="menu_list-box">
          <div className="menu_filter-box">
            <button className="menu_filter-btn">리뷰 순</button>
            <button className="menu_filter-btn">별점 순</button>
          </div>
          <ul className="menu_result-box">
            <Menu_result imageBox={imageBox} starNone={starNone} />
            <Menu_result imageBox={imageBox} starNone={starNone} />
            <Menu_result imageBox={imageBox} starNone={starNone} />
            <Menu_result imageBox={imageBox} starNone={starNone} />
          </ul>
        </div>
      </section>
      <Footer />
    </>
  );
}

export default Menu;
