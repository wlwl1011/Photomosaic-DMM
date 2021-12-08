import React, { useState } from "react";
//import "./font/font.css";
import "./Header_Off.css";

function Header_Off() {
  const [hidden, setHidden] = useState<string>("");
  const [line, setLine] = useState<string>("");

  const handleMenuOn = () => {
    setLine("OutLine");
    setHidden("header__menu_hidden");
  };

  const handleMenuOff = () => {
    setHidden("");
    setLine("");
  };
  return (
    <>
      <div className={line} onClick={handleMenuOff}></div>
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
                  <img className="header_icon-size" src="./menu/search.svg" />
                  검색
                </a>
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
    </>
  );
}

export default Header_Off;
