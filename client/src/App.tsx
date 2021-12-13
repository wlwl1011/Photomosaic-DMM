import React from "react";
import "./App.css";
import "./font/font.css";
<<<<<<< HEAD
=======
import { BrowserRouter, Route, Switch } from "react-router-dom";
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
import Main from "./page/main/Main";
import Menu from "./page/menu/Menu";
import Store from "./page/store/Store";
import Mypage from "./page/mypage/Mypage";
<<<<<<< HEAD
import Signup from "./components/signup/Signup";
import Kakao_map from "./components/kakao_map/Kakao_map";
import PwdChange from "./components/PwdChange/PwdChange";
import ProfileEdit from "./components/profile/ProfileEdit";
import NickName from "./components/nickname/NickName";
import ReviewEdit from "./components/reviewedit/ReviewEdit";
import ReviewDelete from "./components/ReviewDelete/ReviewDelete";
import Signout from "./components/signout/Signout";
import Logout from "./components/logout/Logout";

=======
import Not_found from "./components/not_found/Not_found";
import Render from "./page/render/Render";
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd

function App() {
  return (
    <>
<<<<<<< HEAD
      <div className="wrap">
        <ProfileEdit/>
      </div>
=======
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
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
    </>
  );
}

export default App;
<<<<<<< HEAD


// function App() {
//   return (
//     <>
//       <div className="wrap">
//         <Signout signNone={""} handleSignup={function (e: string): void {
//           throw new Error("Function not implemented.");
//         } } />
//       </div>
//     </>
//   );
// }

// export default App;
// function App() {
//   return (
//     <>
//       <div className="wrap">
//         <ReviewEdit signNone={""} handleSignup={function (e: string): void {
//           throw new Error("Function not implemented.");
//         } } reviewEdit={""} />
//       </div>
//     </>
//   );
// }

// export default App;
=======
>>>>>>> f8bf167468369ad28bfa869e0d377277ad8439bd
