import { useEffect, useState } from "react";
import { useHistory } from "react-router-dom";
import "./Logout.css";
import axios from "axios";

interface Iprops {
  logoutNone: string;
  handleLogout: (e: string) => void;
}

function Logout(props: Iprops) {
  const history = useHistory();
  const handleNone = () => {
    props.handleLogout("logout_hidden");
  };

  const handleLogout = async () => {
    const logoutData = await axios
      .post(
        "https://yummyseoulserver.tk/user/signout",
        {},
        {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        }
      )
      .catch((err) => {
        console.log("🚫 Not Found 🚫", err);
      });

    if (logoutData) {
      if (window.location.href === "https://www.yummyseoul.com/mypage") {
        history.push("/main");
      } else {
        window.location.replace(window.location.href);
      }
    }
  };

  return (
    <>
      <div className={`logout_modal ${props.logoutNone}`}>
        <div className="logout_overlay"></div>
        <div className="logout_content">
          <section className="logout_writing">
            <h1 className="logout_title">로그아웃 하시겠습니까?</h1>
            <div className="logout_btn-box">
              <button className="logout_btn" onClick={handleLogout}>
                네
              </button>
              <button className="logout_btn" onClick={handleNone}>
                아니오
              </button>
            </div>
          </section>
        </div>
      </div>
    </>
  );
}

export default Logout;
