import React from "react";
import "./App.css";
import "./font/font.css";
import Main from "./page/main/Main";
import Menu from "./page/menu/Menu";
import Store from "./page/store/Store";
import Mypage from "./page/mypage/Mypage";
import Signup from "./components/signup/Signup";
import Kakao_map from "./components/kakao_map/Kakao_map";

function App() {
  return (
    <>
      <div className="wrap">
        <Menu />
      </div>
    </>
  );
}

export default App;
