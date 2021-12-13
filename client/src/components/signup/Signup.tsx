import "./Signup.css";
import { useEffect, useState } from "react";
import axios from "axios";

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

interface UserName {
  message: string;
}

function Signup(props: Iprops) {
  const [image, setImage] = useState<File | string | Blob>("");
  const [pwConfirm, setPwConfirm] = useState<boolean>(false);
  const [pwCheck, setPwCheck] = useState<boolean>(false);

  // 닉네임 관리
  const [userCheck, setUserCheck] = useState<boolean>(false);
  const [userName, setUserName] = useState<UserName>({
    message: "",
  });
  const [blank, setBlank] = useState<boolean>(false);
  const [nameEmpty, setNameEmpty] = useState<boolean>(false);

  // 회원가입 입력 관리
  const [infor, setInfor] = useState<Infor>({
    email: "",
    password: "",
    passwordCheck: "",
    nickname: "",
  });
  const { email, password, passwordCheck, nickname } = infor;

  const handleNone = () => {
    const inputElement: NodeListOf<Element> =
      document.querySelectorAll(".signup_input");

    inputElement.forEach((el) => {
      let data = el as HTMLInputElement;
      data.value = "";
    });

    setPwCheck(false);
    setNameEmpty(false);
    props.handleSignup("signup_hidden");
  };

  // 프로필 이미지 등록하는 함수
  const handleImg = (e: React.ChangeEvent<HTMLInputElement>) => {
    const target = e.target as HTMLInputElement;

    if (target.files) {
      const uploadFile = target.files[0];
      //console.log(uploadFile);
      setImage(uploadFile);
    }
  };

  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setInfor({ ...infor, [name]: value });
  };

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
        .then((res) => {
          setUserName(res.data);
        })
        .catch((err) => {
          console.log("🚫 Not Found 🚫", err);
        });
      setNameEmpty(true);
    } else {
      setBlank(true);
    }
  };

  const handleSign = async () => {
    // 비밀번호, 닉네임 모두 합격해야 회원가입 버튼 클릭 가능
    const formData = new FormData();
    // js 내장객체인 FormData를 사용하여 이미지파일을 formData형식으로
    // append 메서드를 활용하여 key에 files, value에 uploadFile 각각 담아둔다.
    formData.append("email", email);
    formData.append("user_name", nickname);
    formData.append("password", password);
    formData.append("file", image);

    if (pwConfirm && userCheck) {
      await axios
        .post("https://localhost:4000/user/signup", formData, {
          headers: { "Content-Type": "multipart/form-data" },
          withCredentials: true,
        })
        .then((res) => console.log(res));
    }
  };

  useEffect(() => {
    if (userName.message === "possible to use this username") {
      console.log("중복되지 않음");
      setUserCheck(true);
    } else {
      console.log("중복됨", userName.message);
      setUserCheck(false);
    }
  }, [userName]);

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

    // 닉네임 공백 확인
    for (let i = 0; i < nickname.length; i++) {
      if (nickname[i] === " ") {
        setBlank(true);
        break;
      } else {
        setBlank(false);
      }
    }
  }, [password, passwordCheck, nickname]);
  return (
    <>
      <div className={`singup_modal ${props.signNone}`}>
        <div className="signup_overlay"></div>
        <div className="signup_content">
          <button className="signup_closeBtn" onClick={handleNone}>
            ❌
          </button>
          <section className="signup_writing">
            <h1 className="signup_title">회원가입</h1>

            <div className="signup_container">
              <img className="signup_image-box" src={""}></img>
            </div>
            <form>
              <div className="signup_image-label">
                <label htmlFor="chooseFile" className="signup_label">
                  프로필 선택
                </label>
              </div>
              <input
                type="file"
                id="chooseFile"
                name="chooseFile"
                accept="image/*"
                onChange={handleImg}
              />
            </form>
            <div className="sign_input-box">
              <div className="sign_input-text-box">
                <input
                  type="eamil"
                  name="email"
                  className="signup_input"
                  placeholder="이메일"
                  onChange={handleInfor}
                />
              </div>
              <div className="sign_input-text-box">
                <input
                  type="password"
                  name="password"
                  className="signup_input"
                  placeholder="패스워드"
                  onChange={handleInfor}
                />
                {
                  <h3 className="sign_password">
                    {pwConfirm ? "✅ 비밀번호 조건이 성립되었습니다." : null}
                  </h3>
                }
              </div>
              <div className="sign_input-text-box">
                <input
                  type="password"
                  name="passwordCheck"
                  className="signup_input"
                  placeholder="패스워드 확인"
                  onChange={handleInfor}
                />
                {
                  <h3 className="sign_password-check">
                    {pwCheck ? "비밀번호가 서로 다릅니다." : null}
                  </h3>
                }
              </div>
              <input
                type="word"
                name="nickname"
                className="signup_input signup_input-last"
                placeholder="닉네임"
                onChange={handleInfor}
              />
              <div className="signup_nickname-box">
                {blank ? (
                  <h5 className="signup_nickname-info">
                    공백은 사용할 수 없습니다.
                  </h5>
                ) : (
                  <h5 className="signup_nickname-info">
                    {nameEmpty
                      ? userCheck
                        ? "✅ 사용가능한 닉네임입니다."
                        : "⛔️ 중복된 닉네임입니다."
                      : null}
                  </h5>
                )}

                <button
                  className="signup_nickname-check"
                  onClick={handleNickname}
                >
                  중복 검사
                </button>
              </div>

              <h3 className="signup_success">
                🎊 회원 가입에 성공하셨습니다! 🎉
              </h3>

              <button className="signup_btn" onClick={handleSign}>
                회원가입
              </button>
            </div>
          </section>
        </div>
      </div>
    </>
  );
}

export default Signup;
