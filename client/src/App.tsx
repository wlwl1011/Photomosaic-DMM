import React from "react";
import "./App.css";
import "./font/font.css";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Main from "./page/main/Main";
import Menu from "./page/menu/Menu";
import Store from "./page/store/Store";
import Mypage from "./page/mypage/Mypage";
import Not_found from "./components/not_found/Not_found";
import Render from "./page/render/Render";

function App() {
  return (
    <>
      <BrowserRouter>
        <div className="wrap">
          <Switch>
            <Route exact path="/" render={() => <Render />} />
            <Route exact path="/main" component={Main} />
            <Route exact path="/menu" component={Menu} />
            <Route exact path="/store" component={Store} />
            <Route exact path="/mypage" component={Mypage} />
            <Route path="*" component={Not_found} />
          </Switch>
        </div>
      </BrowserRouter>
    </>
  );
}

export default App;
