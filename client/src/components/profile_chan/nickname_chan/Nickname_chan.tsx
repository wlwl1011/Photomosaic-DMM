import "./Nickname_chan.css";
import { useEffect, useState, useImperativeHandle } from "react";
import axios from "axios";

interface Iprops {
  nickname_none: string;
  childRef: () => void;
}

interface UserName {
  message: string;
}

function Nickname_chan(props: Iprops) {
  const [blank, setBlank] = useState<boolean>(false);
  const [nickname, setNickname] = useState<string>("");

  const [userCheck, setUserCheck] = useState<boolean>(false);
  const [nameEmpty, setNameEmpty] = useState<boolean>(false);
  const [userName, setUserName] = useState<UserName>({
    message: "",
  });
  const [result, setResult] = useState<boolean>(false);

  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    setNickname(e.target.value);
  };

  // x버튼을 통해 자식 함수 호출
  useImperativeHandle(props.childRef, () => ({
    emptyNickname() {
      setNameEmpty(false);
      setUserCheck(false);
      setBlank(false);
    },
  }));

  const handleNickname = async () => {
    if (!blank && nickname !== "") {
      await axios
        .post(
          "https://localhost:4000/user/check-username",
          {
            user_name: nickname,
          },
          {
            headers: { "Content-Type": "application/json" },
            withCredentials: true,
          }
        )
        .then((res) => setUserName(res.data))
        .catch((err) => {
          console.log("🚫 Not Found 🚫", err);
        });
      setNameEmpty(true);
    }
  };

  const handleChange = async () => {
    if (userCheck && nickname !== "") {
      console.log("닉네임 수정 중");
      await axios
        .patch(
          "https://localhost:4000/user/change-username",
          {
            user_name: nickname,
          },
          {
            headers: { "Content-Type": "application/json" },
            withCredentials: true,
          }
        )
        .catch((err) => {
          console.log("🚫 Not Found 🚫", err);
        });
    } else {
      setResult(false);
    }
  };

  useEffect(() => {
    // 비밀번호와 비밀번호 확인 검사 합격 여부

    // 닉네임 공백 확인
    for (let i = 0; i < nickname.length; i++) {
      if (nickname[i] === " ") {
        setBlank(true);
        break;
      } else {
        setBlank(false);
      }
    }

    if (nickname.length === 0) {
      setBlank(false);
      setNameEmpty(false);
    }
  }, [nickname]);

  useEffect(() => {
    if (userName.message === "possible to use this username") {
      console.log("중복되지 않음");
      setUserCheck(true);
    } else {
      console.log("중복됨", userName.message);
      setUserCheck(false);
    }
  }, [userName]);

  return (
    <>
      <div className={`nickname_chan ${props.nickname_none}`}>
        <div className="nickname_chan-container">
          <div className="nickname_chan-box ">
            <input
              className="nickname_chan_input input_chan"
              placeholder="닉네임"
              type="text"
              onChange={handleInfor}
            />
            <div className="nickname_chan-text-box">
              {blank ? (
                <h3 className="nickname_chan-text">
                  공백은 사용할 수 없습니다.
                </h3>
              ) : (
                <h3 className="nickname_chan-text">
                  {nameEmpty
                    ? userCheck
                      ? "✅ 사용 가능한 닉네임입니다."
                      : "⛔️ 중복된 닉네임입니다."
                    : null}
                </h3>
              )}
              <h4 className="nickname_chan-check" onClick={handleNickname}>
                중복검사
              </h4>
            </div>
          </div>
        </div>
        <div className="nickname_chan_btn-box">
          <div className="nickname_chan_btn-text-box">
            {result ? (
              <h3 className="password_chan_btn-text-success">
                닉네임 변경에 성공했습니다.
              </h3>
            ) : null}
          </div>
          <button className="nickname_chan_btn" onClick={handleChange}>
            변경하기
          </button>
        </div>
      </div>
    </>
  );
}

export default Nickname_chan;
