import React, { useState } from "react";
//import "./font/font.css";
import "./Header.css";
import Search from "../search/Search";
import Signup from "../signup/Signup";
import Login from "../login/Login";
import Logout from "../logout/Logout";
import { Link } from "react-router-dom";

interface Iprops {
  handleImg: () => void;
  isLogin: boolean;
}

function Header_Off(props: Iprops) {
  // 태블릿 모바일 버전 메뉴 히든 관리
  const [hidden, setHidden] = useState<string>("");

  // 회원가입 모달 관리
  const [signNone, setSignNone] = useState<string>("signup_hidden");
  // 로그인 모달 관리
  const [loginNone, setLoginNone] = useState<string>("login_hidden");
  // 로그인 모달 관리
  const [logoutNone, setLogoutNone] = useState<string>("logout_hidden ");

  // 초반 검색 효과 제거
  const [animation, setAnimation] = useState<boolean>(false);

  // 검색 모달 right -50% 좌표 주기
  const [chRight, setChRight] = useState<boolean>(true);
  const [right, setRight] = useState<string>("");

  // 태블릿 스마트폰 버전 함수
  const handleMenuOn = () => {
    setHidden("header__menu_hidden");
  };
  const handleMenuOff = () => {
    setHidden("");
  };

  // 검색 모달 on/off 함수
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

  // 로그인, 회원가입 모달 함수
  const handleLgoin = (e: string) => {
    setLoginNone(e);
  };
  const handleSignup = (e: string) => {
    setSignNone(e);
  };
  const handleLogout = (e: string) => {
    setLogoutNone(e);
  };

  return (
    <>
      <header className="header_main">
        <nav className="header_nav header_container">
          <div className="header_box1"></div>
          <a href='/main' className="header_title header_box2">
            Yummy <img className="header_logo" src="/logo.svg" /> Seoul
          </a>
          <div className={`header__menu ${hidden} header_box3`}>
            <ul className="header__list header_grid">
              {props.isLogin ? (
                <li className="header__item">
                  <div className="header__link">
                    <img
                      onClick={() => handleLgoin("")}
                      className="header_icon-size"
                      src="/menu/signout.svg"
                    />
                    <h4 onClick={() => handleLogout("")}>로그아웃</h4>
                  </div>
                </li>
              ) : (
                <li className="header__item">
                  <div className="header__link">
                    <img
                      onClick={() => handleLgoin("")}
                      className="header_icon-size"
                      src="/menu/signin.svg"
                    />
                    <h4 onClick={() => handleLgoin("")}>로그인</h4>
                  </div>
                </li>
              )}
              {props.isLogin ? (
                <Link to="/mypage">
                  <li className="header__item">
                    <div className="header__link">
                      <img
                        onClick={() => handleLgoin("")}
                        className="header_icon-size"
                        src="/menu/user.svg"
                      />
                      <h4>마이페이지</h4>
                    </div>
                  </li>
                </Link>
              ) : (
                <li className="header__item">
                  <div className="header__link">
                    <img
                      onClick={() => handleSignup("")}
                      className="header_icon-size"
                      src="/menu/user-plus.svg"
                    />
                    <h4 onClick={() => handleSignup("")}>회원가입</h4>
                  </div>
                </li>
              )}

              <li className="header__item">
                <div className="header__link">
                  <label
                    htmlFor="search_modal"
                    className="search_label-box"
                    onClick={handleSearch}
                  >
                    검색
                    <img className="header_icon-size" src="/menu/search.svg" />
                  </label>
                </div>

                <img
                  onClick={handleMenuOff}
                  className="header_close-icon header_icon-size"
                  src="/search/close_tap.svg"
                />
              </li>
            </ul>
          </div>
          <div>
            <div className="header__toggle" onClick={handleMenuOn}>
              <img className="header_icon-size" src="/menu/apps.svg" />
            </div>
          </div>
        </nav>
      </header>
      <Search animation={animation} right={right} handleSearch={handleSearch} />
      <Signup signNone={signNone} handleSignup={handleSignup} />
      <Login loginNone={loginNone} handleLgoin={handleLgoin} />
      <Logout logoutNone={logoutNone} handleLogout={handleLogout} />
    </>
  );
}

export default Header_Off;
