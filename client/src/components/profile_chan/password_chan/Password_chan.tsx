import "./Password_chan.css";
import React from "react";

interface Iprops {
  password_none: string;
}

function Password_chan(props: Iprops) {
  return (
    <>
      <div className={`password_chan ${props.password_none}`}>
        <div className="password_chan-container">
          <div className="password_chan_input-box">
            <input
              className="password_chan_input"
              placeholder="비밀번호"
              type="password"
            />
            <h3>fsdfsdfdsfsdfsdf</h3>
          </div>
          <div className="password_chan_input-box">
            <input
              className="password_chan_input"
              placeholder="비밀번호 확인"
              type="password"
            />
            <h3>fsdfsdfdsfsdfsdf</h3>
          </div>
        </div>
        <div className="password_chan_btn-box">
          <div className="password_chan_btn-text-box">
            <h3 className="password_chan_btn-text-success">
              변경에 성공했습니다.
            </h3>
          </div>
          <button className="password_chan_btn">변경하기</button>
        </div>
      </div>
    </>
  );
}

export default Password_chan;
