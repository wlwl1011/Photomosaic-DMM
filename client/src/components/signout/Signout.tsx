import { useEffect, useState } from "react";
import "./Signout.css";
import React from "react";
import { useHistory } from "react-router-dom";
import axios from "axios";

interface Iprops {
  signoutNone: string;
  signoutEdit: (e: string) => void;
}

function Signout(props: Iprops) {
  const history = useHistory();
  const [checkPw, setCheckPw] = useState<boolean>(false);
  const [password, setPassword] = useState<string>("");

  const handleNone = () => {
    props.signoutEdit("signout_hidden");
  };

  // 해당 페이지 새로고침
  // window.location.href: 현 url 주소
  // window.location.replace(window.location.href);

  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPassword(e.target.value);
  };

  const handleOut = async () => {
    // await axios
    //   .delete(
    //     "https://localhost:4000/user/delete-account",
    //     {
    //       password: password,
    //     },
    //     {
    //       headers: { "Content-Type": "application/json" },
    //       withCredentials: true,
    //     },
    //   ).catch((err) => {
    //     console.log("🚫 Not Found 🚫", err);
    //     setCheckPw(true)
    //   });
  };

  // 버튼 누를 경우 결과
  // setCheckPw(false)
  // history.push("/");

  return (
    <>
      <div className={`signout_modal ${props.signoutNone}`}>
        <div className="signout_overlay"></div>
        <div className="signout_content">
          <button className="signout_closeBtn" onClick={handleNone}>
            ❌
          </button>

          <section className="signout_writing">
            <h1 className="signout_title">회원탈퇴</h1>

            <h2 className="signout_subtitle">
              회원 탈퇴시 야미 서울에서 사용한 정보가
            </h2>

            <h2 className="signout_subtitle">모두 소멸됩니다.</h2>

            {checkPw ? null : (
              <h4 className="signout_infor_text">
                비밀번호 입력 후 버튼을 클릭해주세요.
              </h4>
            )}

            <div className="signout_input-box">
              <input
                type="password"
                name="passwordCheck"
                className="signout_input"
                placeholder="패스워드 확인"
                onChange={handleInfor}
              />
              {checkPw ? (
                <h3 className="signout_input-box2">
                  비밀번호를 다시 입력해주세요.
                </h3>
              ) : null}
            </div>
            <button className="signout_btn" onClick={handleOut}>
              회원탈퇴
            </button>
          </section>
        </div>
      </div>
    </>
  );
}

export default Signout;
