import React, { useState, useRef } from "react";
import Header from "../../components/header/Header";
import Seoul_map from "../../components/seoul_map/Seoul_map";
import Footer from "../../components/footer/Footer";

function Main() {
  const handleImg = () => {};
  const accessLogin: any = useRef();

  return (
    <>
      <Header handleImg={handleImg} isLogin={true} accessLogin={accessLogin} />
      <Seoul_map />
      <Footer />
    </>
  );
}

export default Main;
