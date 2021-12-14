import { useEffect, useState } from "react";
import "./Logout.css";

interface Iprops {
  logoutNone: string;
  handleLogout: (e: string) => void;
}

function Logout(props: Iprops) {
  const handleNone = () => {
    props.handleLogout("logout_hidden");
  };

  return (
    <>
      <div className={`logout_modal ${props.logoutNone}`}>
        <div className="logout_overlay"></div>
        <div className="logout_content">
          <section className="logout_writing">
            <h1 className="logout_title">로그아웃 하시겠습니까?</h1>

            <div className="logout_btn-box">
              <button className="logout_btn">네</button>
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
