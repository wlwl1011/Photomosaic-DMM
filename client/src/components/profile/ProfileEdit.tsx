import { Component, useEffect, useState } from "react";
import "./ProfileEdit.css";
import React from "react";

function ProfileEdit() {
  return (
    <>
      <div className={`profile_modal `}>
        <div className="profile_overlay"></div>
        <div className="profile_content">
          <section className="profile_writing">
            <h1 className="profile_title">정보 수정</h1>
            <nav className="profile_text-container">
              <h4>비밀번호 수정</h4>
              <h4>닉네임 수정</h4>
              <h4>프로필 사진 수정</h4>
            </nav>
            <div className="profile_change-container">
              <input type="pasword" />
              <input type="pasword" />
            </div>
            <div className="profile_btn-box">
              <button className="profile_btn">변경하기</button>
            </div>
          </section>
        </div>
      </div>
    </>
  );
}

export default ProfileEdit;
