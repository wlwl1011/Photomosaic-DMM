import {  useEffect, useState } from "react";
import "./ReviewEdit.css";
import React from "react";

interface Iprops {
  signNone: string;
  handleSignup: (e: string) => void;
  reviewEdit: string;
}

interface Infor {
  email: string;
  password: string;
  passwordCheck: string;
  nickname: string;
}

function ReviewEdit(props: Iprops) {
  // const [info, setInfo] = useState<Infor>({
  //   email: "",
  //   password: "",
  const [infor, setInfor] = useState<Infor>({
    email: "",
    password: "",
    passwordCheck: "",
    nickname: "",
  });
  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setInfor({ ...infor, [name]: value });
  };
  const handleNone = () => {
    props.handleSignup("signup_hidden");
  };

  return (
    <>
     <div className={`singout_modal ${props.signNone}`}>
        <div className="signout_overlay"></div>
        <div className="reviewEd_content">
          <button className="signout_closeBtn" onClick={handleNone}>
            ❌
          </button>
          <section className="signout_writing">
            <h1 className="signout_title">리뷰작성</h1>
            <br />
            <div className="review_rating"> {/* 별점기능구현..? */}
            <div className="warning_msg">별점을 선택해 주세요.</div>
            <div className="rating">
              <input type="checkbox" id="star1" name="star1" value="1" />
            </div>
        </div>
            <br />           
            
            <div className="reviewEd_input-box">               
              <h3 className="reviewEd_input-box2">
              <input
              type="review"
              name="reviewEdit"
              className="review_input"
              placeholder="리뷰를 작성해주세요."
              onChange={handleInfor}
              />
              </h3>
              {/* {passwordError && ()} */}
           </div>
           <br />
            <button className="reviewEd_btn">작성하기</button>
            
          </section>
        </div>
      </div>
    </>
  );
}

export default ReviewEdit;

