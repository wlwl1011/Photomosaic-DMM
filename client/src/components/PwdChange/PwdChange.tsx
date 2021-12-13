import { Component, useEffect, useState } from "react";
import "./PwdChange.css";
import React from "react";


interface Iclose {
  close: string;
}
interface Iemail {
  email: string;
}
interface Ipassword {
  password: string;
}
interface Inickname {
  nickname: string;
}
interface Infor {
  email: string;
  password: string;
}

function PwdChange() {
  const [infor, setInfor] = useState<Infor>({
    email: "",
    password: "",
  });

  const [hidden, setHidden] = useState<Iclose>({
    close: "",
  });
  const [email, setEmail] = useState<Iemail>({
    email: "",
  });
  const [password, setPassword] = useState<Ipassword>({
    password: "",
  });
  const [nickname, setNickname] = useState<Inickname>({
    nickname: "",
  });

  const handleOpenModal = () => {
    setHidden({
      close: "",
    });

    window.location.href = "#demo-modal";
  };
  const handleCloseModal = () => {
    setHidden({
      close: "login_hidden",
    });
    console.log(hidden);
  };
  // const handleEmail = (e: React.ChangeEvent<HTMLInputElement>) => {
  //   setEmail({
  //     email: e.target.value,
  //   });
  // };
  // const handlePassword = (e: React.ChangeEvent<HTMLInputElement>) => {
  //   setPassword({
  //     password: e.target.value,
  //   });
  // };
  // const handleNickname = (e: React.ChangeEvent<HTMLInputElement>) => {
  //   setNickname({
  //     nickname: e.target.value,
  //   });
  // };
  const [empty, setEmpty] = useState<boolean>(false);
  const [emptyNone, setEmptyNone] = useState<string>("");
  const [profileselect, setProfileSelect] = useState<string>("");
  const [passedit, setPassEdit] = useState<string>("");
  const [nickedit, setNickEdit] = useState<string>("");
  const [profileedit, setProfileEdit] = useState<string>("");
  const [pwCheck, setPwCheck] = useState<boolean>(false);

  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setInfor({ ...infor, [name]: value });
  };

  const handleSelect = () => {
    setEmptyNone("empty_none");
  }
  const handleNick = () => {
    setEmptyNone("empty_none");
  }
  const handleProfile = () => {
    setEmptyNone("empty_none");
  }
  const handlePassword = () => {
    setEmptyNone("empty_none");
  }

  // console.log("이건 이메일이야", email.email);
  // console.log("이건 비밀번호야", password.password);

  return (
    <>
      <button type="button" onClick={handleOpenModal}>
        Open Modal
      </button>
            
      <div id="demo-modal" className={`modal ${hidden.close}`}>
        <div className="modal__overlay"></div>
        <div className="modal__content">
          <button className="closeBtn" onClick={handleCloseModal}>
            ❌
          </button>
          <section className="nickname_writing">            
          <div className="profile_container">
              <h1 className="nick_title">패스워드 수정</h1>              
              </div>         
          <nav className="edit_menu_container">
            <span className={`edit_text ${passedit}`}
            onClick={handlePassword}>비밀번호 수정</span>
            <span className={`edit_text ${nickedit}`}
            onClick={handleNick}>닉네임 수정</span>
            <span className={`edit_text ${profileedit}`}
            onClick={handleProfile}>프로필 수정</span>
            </nav>
            <div className="profile_input-box">
              <input
                className="pwd_input"
                placeholder="비밀번호 확인"
                type="password"
                onChange={handleInfor}
              /> </div>
              <h4 className="nick_input-box-fatal">
                "비밀번호 조건이 성립되었습니다."
                {pwCheck ? "비밀번호 조건이 성립되었습니다." : null}
                </h4>
              <input
                className="pwdC_input"
                placeholder="비밀번호 확인"
                type="password"
                onChange={handleInfor}
              />
              <h3 className="nick_input-box-fatal">
                "⛔공백은 추가 할 수 업습니다"
                {pwCheck ? "⛔공백은 추가 할 수 업습니다" : null}
                </h3>
           <br></br>
            <button className="change_btn">변경하기</button>
            
          </section>
        </div>
      </div>
    </>
  );
}

export default PwdChange;
