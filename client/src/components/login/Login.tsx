import { useEffect, useState } from "react";
import "./Login.css";

interface Iprops {
  loginNone: string;
  handleLgoin: (e: string) => void;
}

interface Infor {
  email: string;
  password: string;
}

function Login(props: Iprops) {
  const [infor, setInfor] = useState<Infor>({
    email: "",
    password: "",
  });

  const [empty, setEmpty] = useState<boolean>(false);
  const [logFail, setLogFail] = useState<boolean>(false);

  // 로그인 모달창 on/off 함수
  const handleNone = () => {
    props.handleLgoin("login_hidden");
  };

  const handleInfor = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setInfor({ ...infor, [name]: value });
  };
  const { email, password } = infor;

  useEffect(() => {
    // 입력창 공백상태 확인
    if (email || password) {
      setEmpty(true);
    } else {
      setEmpty(false);
    }
  }, [email, password]);

  return (
    <>
      <div id="demo-modal" className={`login_modal ${props.loginNone}`}>
        <div className="login_overlay"></div>
        <div className="login_content">
          <button className="login_closeBtn" onClick={handleNone}>
            ❌
          </button>
          <section className="login_writing">
            <h1 className="login_title">로그인</h1>
            <div className="login_input-box">
              <input
                className="login_input"
                placeholder="이메일"
                type="email"
                name="email"
                onChange={handleInfor}
              />
              <input
                className="login_input"
                placeholder="비밀번호"
                type="password"
                name="password"
                onChange={handleInfor}
              />
              <h3 className="login_info-text">
                {empty ? null : "로그인 정보를 입력해주세요!"}
              </h3>
              <h3 className="login_result-text">
                {logFail ? "로그인이 실패되었습니다." : null}
              </h3>
            </div>
            <button className="login_btn">로그인</button>
            <div className="login_OAuth-box">
              <img className="login_OAuth" src="./oauth/naver.png" />
              <img className="login_OAuth" src="./oauth/google.jpeg" />
              <img className="login_OAuth" src="./oauth/kakao.svg" />
            </div>
          </section>
        </div>
      </div>
    </>
  );
}

export default Login;
