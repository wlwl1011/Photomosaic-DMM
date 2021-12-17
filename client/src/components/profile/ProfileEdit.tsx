import { useRef, useEffect, useState } from "react";
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
  handleCount: () => void;
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

  const emptyNickname: any = useRef();
  const emptyPw: any = useRef();
  const emptyImg: any = useRef();

  const handleNone = () => {
    // input text 초기화
    const inputElement: NodeListOf<Element> =
      document.querySelectorAll(".input_chan");
    inputElement.forEach((el) => {
      let data = el as HTMLInputElement;
      data.value = "";
    });

    // input 이미지 초기화
    const inputImg = document.getElementById(
      "input_chan_img"
    ) as HTMLInputElement;
    inputImg.value = "";

    emptyNickname.current.emptyNickname();
    emptyPw.current.emptyPw();
    emptyImg.current.emptyImg();

    // 정보 수정 모달 닫기
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

            <Password_chan
              password_none={selectNone.password_none}
              childRef={emptyPw}
            />
            <Nickname_chan
              nickname_none={selectNone.nickname_none}
              childRef={emptyNickname}
              handleCount={props.handleCount}
            />
            <Image_chan
              image_none={selectNone.image_none}
              emptyImg={emptyImg}
              handleCount={props.handleCount}
            />
          </section>
        </div>
      </div>
    </>
  );
}

export default ProfileEdit;
