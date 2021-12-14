import { Component, useEffect, useState } from "react";
import "./ProfileEdit.css";
import React from "react";
import Password_chan from "../profile_chan/password_chan/Password_chan";
import Nickname_chan from "../profile_chan/nickname_chan/Nickname_chan";
import Image_chan from "../profile_chan/image_chan/Image_chan";

interface Select_word {
  password: string;
  nickname: string;
  image: string;
}

interface Select_none {
  password_none: string;
  nickname_none: string;
  image_none: string;
}

interface Iprops {
  profilewNone: string;
  profileEdit: (e: string) => void;
}

function ProfileEdit(props: Iprops) {
  const [select, setSelect] = useState<Select_word>({
    password: "profile_select_pass-check",
    nickname: "",
    image: "",
  });

  const [selectNone, setSelectNone] = useState<Select_none>({
    password_none: "",
    nickname_none: "nickname_chan_none",
    image_none: "image_chan_none",
  });

  const handlePassword = (e: string) => {
    setSelect({
      password: e,
      nickname: "",
      image: "",
    });

    setSelectNone({
      password_none: "",
      nickname_none: "nickname_chan_none",
      image_none: "image_chan_none",
    });
  };

  const handleNickname = (e: string) => {
    setSelect({
      password: "",
      nickname: e,
      image: "",
    });

    setSelectNone({
      password_none: "password_chan_none",
      nickname_none: "",
      image_none: "image_chan_none",
    });
  };

  const handleImage = (e: string) => {
    setSelect({
      password: "",
      nickname: "",
      image: e,
    });

    setSelectNone({
      password_none: "password_chan_none",
      nickname_none: "nickname_chan_none",
      image_none: "",
    });
  };

  const handleNone = () => {
    props.profileEdit("profile_hidden");
  };

  return (
    <>
      <div className={`profile_modal ${props.profilewNone}`}>
        <div className="profile_overlay"></div>
        <div className="profile_content">
          <button className="profile_closeBtn" onClick={handleNone}>
            ❌
          </button>
          <section className="profile_writing">
            <h1 className="profile_title">정보 수정</h1>
            <nav className="profile_text-container">
              <h4
                className={`profile_select_text ${select.password}`}
                onClick={() => handlePassword("profile_select_pass-check")}
              >
                비밀번호 수정
              </h4>
              <h4
                className={`profile_select_text ${select.nickname}`}
                onClick={() => handleNickname("profile_select_name-check")}
              >
                닉네임 수정
              </h4>
              <h4
                className={`profile_select_text ${select.image}`}
                onClick={() => handleImage("profile_select_img-check")}
              >
                프로필 사진 수정
              </h4>
            </nav>

            <Password_chan password_none={selectNone.password_none} />
            <Nickname_chan nickname_none={selectNone.nickname_none} />
            <Image_chan image_none={selectNone.image_none} />
          </section>
        </div>
      </div>
    </>
  );
}

export default ProfileEdit;
