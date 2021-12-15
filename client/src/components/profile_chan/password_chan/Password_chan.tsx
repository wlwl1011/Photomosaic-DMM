import "./Password_chan.css";
import React from "react";
import { useEffect, useState, useImperativeHandle } from "react";
import axios from "axios";

interface Iprops {
  password_none: string;
  childRef: () => void;
}

interface password {
  password: string;
  passwordCheck: string;
}

function Password_chan(props: Iprops) {
  const [password, setPassword] = useState<password>({
    password: "",
    passwordCheck: "",
  });
  const [pwConfirm, setPwConfirm] = useState<boolean>(false);
  const [pwCheck, setPwCheck] = useState<boolean>(false);
  const [result, setResult] = useState<boolean>(false);

  const value =
    /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[@$!%*#?&])[A-Za-z0-9@$!%*#?&]{8,}$/.test(
      password.password
    );

  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setPassword({ ...password, [name]: value });
  };

  // x버튼을 통해 자식 함수 호출
  useImperativeHandle(props.childRef, () => ({
    emptyPw() {
      setPwConfirm(false);
      setPwCheck(false);
      setResult(false);
      setPassword({
        password: "",
        passwordCheck: "",
      });
    },
  }));

  const handleChange = async () => {
    if (!pwCheck) {
      console.log("비번 수정 중");
      await axios
        .patch(
          "https://localhost:4000/user/change-password",
          {
            password: password.password,
          },
          {
            headers: { "Content-Type": "application/json" },
            withCredentials: true,
          }
        )
        .catch((err) => {
          console.log("🚫 Not Found 🚫", err);
        });
      setResult(true);
    } else {
      setResult(false);
    }
  };

  useEffect(() => {
    // 비밀번호와 비밀번호 확인 검사 합격 여부
    if (
      password.password !== password.passwordCheck &&
      password.passwordCheck !== ""
    ) {
      setPwCheck(true);
    } else {
      setPwCheck(false);
    }
    // 비밀번호 유효성 검사 조합 합격 여부
    if (value) {
      setPwConfirm(true);
    } else {
      setPwConfirm(false);
    }
  }, [password]);

  return (
    <>
      <div className={`password_chan ${props.password_none}`}>
        <div className="password_chan-container">
          <div className="password_chan_input-box">
            <input
              className="password_chan_input input_chan"
              placeholder="비밀번호"
              name="password"
              type="password"
              onChange={handleInfor}
            />
            {pwConfirm ? (
              <h3 className="password_chan_input-word">
                ✅ 비밀번호 조건이 성립되었습니다.
              </h3>
            ) : null}
          </div>
          <div className="password_chan_input-box">
            <input
              className="password_chan_input input_chan"
              placeholder="비밀번호 확인"
              name="passwordCheck"
              type="password"
              onChange={handleInfor}
            />
            {pwCheck ? (
              <h3 className="password_chan_input-word2">
                비밀번호가 서로 다릅니다.
              </h3>
            ) : null}
          </div>
        </div>
        <div className="password_chan_btn-box">
          <div className="password_chan_btn-text-box">
            {result ? (
              <h3 className="password_chan_btn-text-success">
                비밀번호 변경에 성공했습니다.
              </h3>
            ) : null}
          </div>
          <button className="password_chan_btn" onClick={handleChange}>
            변경하기
          </button>
        </div>
      </div>
    </>
  );
}

export default Password_chan;
