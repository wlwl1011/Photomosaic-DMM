import { useEffect, useState } from "react";
import "./ReviewDelete.css";

interface Iclose {
  close: string;
}
interface Iemail {
  email: string;
}
interface Ipassword {
  password: string;
}


function ReviewDelete() {
  const [hidden, setHidden] = useState<Iclose>({
    close: "",
  });
  const [email, setEmail] = useState<Iemail>({
    email: "",
  });
  const [password, setPassword] = useState<Ipassword>({
    password: "",
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
  const handleEmail = (e: React.ChangeEvent<HTMLInputElement>) => {
    setEmail({
      email: e.target.value,
    });
  };
  const handlePassword = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPassword({
      password: e.target.value,
    });
  };

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
          <section className="reviewD_writing">
            <h1 className="reviewD_title">리뷰 삭제?</h1>
           
              
            <button className="reviewD_btn">네</button>
            <button className="reviewd_bton">아니오</button>
          </section>
        </div>
      </div>
    </>
  );
}

export default ReviewDelete;
