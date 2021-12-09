import React from "react";
import "./App.css";
import "./font/font.css";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Main from "./page/main/Main";
import Menu from "./page/menu/Menu";
import Store from "./page/store/Store";
import Mypage from "./page/mypage/Mypage";
import Signup from "./components/signup/Signup";
import Star_select from "./components/star/star_select/Star_select";

function App() {
  return (
    <>
      <div className="wrap">
        <Store />
      </div>
    </>
  );
}

export default App;
