import "./Signup.css";
import { useEffect, useState } from "react";

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

function Signup(props: Iprops) {
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

  // 프로필 이미지 등록하는 함수
  const handleImg = (e: React.ChangeEvent<HTMLInputElement>) => {
    const target = e.target as HTMLInputElement;
    const file: File = (target.files as FileList)[0];
    const imageUrl = URL.createObjectURL(file);
    //console.log(imageUrl, typeof imageUrl);
    // 이래 찍힘 blob:http://localhost:3000/2091452d-c3e9-4d62-9a47-4b01e3069394
    setImage(imageUrl);
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
              <img className="signup_image-box" src={image}></img>
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
                className="signup_input-last"
                placeholder="닉네임"
                onChange={handleInfor}
              />
              <div className="signup_nickname-box">
                <h5 className="signup_nickname-info">
                  ✅ 중복된 닉네임입니다.
                </h5>
                <button className="signup_nickname-check">중복 검사</button>
              </div>

              <h3 className="signup_success">
                🎊 회원 가입에 성공하셨습니다! 🎉
              </h3>

              <button className="signup_btn">회원가입</button>
            </div>
          </section>
        </div>
      </div>
    </>
  );
}

export default Signup;
