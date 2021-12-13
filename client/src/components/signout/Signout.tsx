import {  useEffect, useState } from "react";
import "./Signout.css";
import React from "react";

interface Iprops {
  signNone: string;
  handleSignup: (e: string) => void;
}

interface Infor {
  email: string;
  password: string;
  passwordCheck: string;
  nickname: string;
}

function Signout(props: Iprops) {
  const [image, setImage] = useState<undefined | string>(undefined);
  const [pwConfirm, setPwConfirm] = useState<boolean>(false);
  const [pwCheck, setPwCheck] = useState<boolean>(false);

  const [infor, setInfor] = useState<Infor>({
    email: "",
    password: "",
    passwordCheck: "",
    nickname: "",
  });
  const { email, password, passwordCheck, nickname } = infor;

  const handleNone = () => {
    props.handleSignup("signup_hidden");
  };

  
  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setInfor({ ...infor, [name]: value });
  };

  // 비밀번호 유효성 검사 함수
  const value =
    /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[@$!%*#?&])[A-Za-z0-9@$!%*#?&]{8,}$/.test(
      password
    );

  useEffect(() => {
    // 비밀번호와 비밀번호 확인 검사 합격 여부
    if (password !== passwordCheck && passwordCheck !== "") {
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
  }, [password, passwordCheck]);
  

  // console.log("이건 이메일이야", email.email);
  // console.log("이건 비밀번호야", password.password);

  return (
    <>
     <div className={`singout_modal ${props.signNone}`}>
        <div className="signout_overlay"></div>
        <div className="signout_content">
          <button className="signout_closeBtn" onClick={handleNone}>
            ❌
          </button>
      {/* <button type="button" onClick={handleOpenModal}>
        Open Modal
      </button>
      <div id="demo-modal" className={`modal ${hidden.close}`}>
        <div className="modal__overlay"></div>
        <div className="modal__content">
          <button className="closeBtn" onClick={handleCloseModal}>
            
          </button> */}
          <section className="signout_writing">
            <h1 className="signout_title">회원탈퇴</h1>
            <br />
            <h2 className="signout_subtitle">회원 탈퇴시 야미 서울에서 사용한
            정보가 모두 소멸됩니다.</h2>
            <br />
              <h4 className="signout_subtitle">비밀번호 입력 후 버튼을 클릭해주세요.</h4>
            
            
            <div className="signout_input-box">
                          
               <input
              type="password"
              name="passwordCheck"
              className="signout_input"
              placeholder="패스워드 확인"
              onChange={handleInfor}
              />

              <h3 className="signout_input-box2">
              {pwCheck ? "🚫비밀번호를 잘못 입력했습니다." : null}
              </h3>
              {/* {passwordError && ()} */}
           </div>
            <button className="signout_btn">회원탈퇴</button>
            
          </section>
        </div>
      </div>
    </>
  );
}

export default Signout;

// function confirmPasswordClassName() {
//   throw new Error("Function not implemented.");
// }

// function renderFeedbackMessage() {
//   throw new Error("Function not implemented.");
// }
// function useStyles() {
//   throw new Error("Function not implemented.");
// }

// function useMutation(LOGIN: any): [any, { data: any; }] {
//   throw new Error("Function not implemented.");
// }

// function useRecoilState(UserState: any): [any, any] {
//   throw new Error("Function not implemented.");
// }

