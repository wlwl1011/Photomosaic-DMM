import React, { useState, useRef, useEffect } from "react";
import Header from "../../components/header/Header";
import Seoul_map from "../../components/seoul_map/Seoul_map";
import Footer from "../../components/footer/Footer";
import axios from "axios";

function Main() {
  const handleImg = () => {};
  const accessLogin: any = useRef();
  const [isLogin, setIsLogin] = useState<boolean>(true);

  useEffect(() => {
    (async () => {
      await axios
        .get("https://yummyseoulserver.tk/user/userinfo/userdata", {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        })
        .then((res) => {
          setIsLogin(true);
        })
        .catch((err) => setIsLogin(false));
    })();
  }, [isLogin]);

  return (
    <>
      <Header
        handleImg={handleImg}
        isLogin={isLogin}
        accessLogin={accessLogin}
      />
      <Seoul_map />
      <Footer />
    </>
  );
}

export default Main;
