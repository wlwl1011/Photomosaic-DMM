import React, { useState } from "react";
//import "./font/font.css";
import "./Header.css";
import Search_list from "../search_list/Search_list";
import Search_result from "../search_result/Search_result";

interface Iprops {
  handleImg: () => void;
}

function Header_Off(props: Iprops) {
  const [hidden, setHidden] = useState<string>("");

  // 검색 리스트 관리
  const [list, setList] = useState<boolean>(false);
  // 초반 검색 효과 제거
  const [animation, setAnimation] = useState<boolean>(false);

  // 검색 모달 right -50% 좌표 주기
  const [chRight, setChRight] = useState<boolean>(true);
  const [right, setRight] = useState<string>("");

  // 검색 리스트 필터 value 관리
  const [liValue, setliValue] = useState<string>("선택");

  const handleMenuOn = () => {
    setHidden("header__menu_hidden");
  };

  const handleMenuOff = () => {
    setHidden("");
  };
  // 검색 모달 on/off 관리
  const handleSearch = () => {
    props.handleImg();

    setChRight(!chRight);
    if (chRight) {
      setRight("");
    } else {
      setRight("search_modal_container_none");
    }
    setAnimation(true);
  };
  // 검색 필터 관리
  const handleList = () => {
    setList(!list);
  };
  // 검색 필터 value 관리
  const handleListSelect = (e: any) => {
    const data: string = e.target.getAttribute("value");
    setliValue(data);
  };
  return (
    <>
      <header className="header_main">
        <nav className="header_nav header_container">
          <div className="header_box1"></div>
          <a href="#" className="header_title header_box2">
            Yummy <img className="header_logo" src="./logo.svg" /> Seoul
          </a>
          <div className={`header__menu ${hidden} header_box3`}>
            <ul className="header__list header_grid">
              <li className="header__item">
                <a href="#" className="header__link">
                  <img className="header_icon-size" src="./menu/signin.svg" />
                  로그인
                </a>
              </li>
              <li className="header__item">
                <a href="#" className="header__link">
                  <img
                    className="header_icon-size"
                    src="./menu/user-plus.svg"
                  />
                  회원가입
                </a>
              </li>
              <li className="header__item">
                <a href="#" className="header__link">
                  <label
                    htmlFor="search_modal"
                    className="search_label-box"
                    onClick={handleSearch}
                  >
                    검색
                    <img className="header_icon-size" src="./menu/search.svg" />
                  </label>
                </a>

                <img
                  onClick={handleMenuOff}
                  className="header_close-icon header_icon-size"
                  src="./search/close_tap.svg"
                />
              </li>
            </ul>
          </div>
          <div>
            <div className="header__toggle" onClick={handleMenuOn}>
              <img className="header_icon-size" src="./menu/apps.svg" />
            </div>
          </div>
        </nav>
      </header>
      <div>
        <input type="checkbox" id="search_modal" className="search_hidden" />
        {/* ########################################## 여기부터 검색 모달 ############################################ */}
        {animation ? (
          <div className={`search_modal_container ${right} `}>
            <section className="search_container">
              <div className="search_container_close-box">
                <label htmlFor="search_modal">
                  <img
                    className="search_container_close"
                    src="./search/close_tap.svg"
                    onClick={handleSearch}
                  />
                </label>
              </div>
              <div className="search_nav">
                <nav className="search_nav-box">
                  <div className="search_select" onClick={handleList}>
                    <div className="search_select-box">
                      <span>
                        {liValue}
                        {list ? (
                          <img
                            className="search_icon-arrow"
                            src="./search/arrow-up.svg"
                          />
                        ) : (
                          <img
                            className="search_icon-arrow"
                            src="./search/arrow-down.svg"
                          />
                        )}
                      </span>
                    </div>
                    {list ? (
                      <ul className="search_list-box">
                        <li
                          value="가게"
                          className="search_list"
                          onClick={handleListSelect}
                        >
                          가게 정보
                        </li>
                        <li
                          value="메뉴"
                          className="search_list"
                          onClick={handleListSelect}
                        >
                          메뉴 정보
                        </li>
                      </ul>
                    ) : null}
                  </div>
                  <div className="search_input-box">
                    <input
                      className="search_input"
                      placeholder="필터를 선택하여 검색어를 입력해주세요"
                    />
                    <div className="search_icon-box">
                      <img className="search_icon" src="./search/search.svg" />
                    </div>
                  </div>
                </nav>
              </div>
              <div className="search_lately-container">
                <h3 className="search_lately-title">최근 검색어</h3>
                <ul className="search_lately-box">
                  <Search_list />
                  <Search_list />
                  <Search_list />
                </ul>
              </div>
              <div className="search_result-container">
                <h3 className="search_lately-title">검색 결과</h3>
                <div className="search_result-box">
                  <ul className="search_result-list">
                    <Search_result />
                    <Search_result />
                    <Search_result />
                  </ul>
                </div>
              </div>
            </section>
          </div>
        ) : null}
      </div>
    </>
  );
}

export default Header_Off;
