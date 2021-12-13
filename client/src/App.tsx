import React from "react";
import "./App.css";
import "./font/font.css";
import Main from "./page/main/Main";
import Menu from "./page/menu/Menu";
import Store from "./page/store/Store";
import Mypage from "./page/mypage/Mypage";
import Signup from "./components/signup/Signup";
import Kakao_map from "./components/kakao_map/Kakao_map";
import PwdChange from "./components/PwdChange/PwdChange";
import ProfileEdit from "./components/profile/ProfileEdit";
import NickName from "./components/nickname/NickName";
import ReviewEdit from "./components/reviewedit/ReviewEdit";
import ReviewDelete from "./components/ReviewDelete/ReviewDelete";
import Signout from "./components/signout/Signout";
import Logout from "./components/logout/Logout";


function App() {
  return (
    <>
      <div className="wrap">
        <ProfileEdit/>
      </div>
    </>
  );
}

export default App;


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
