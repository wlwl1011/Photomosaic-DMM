import React, { useState } from "react";
import Header from "../../components/header/Header";
import Seoul_map from "../../components/seoul_map/Seoul_map";
import Footer from "../../components/footer/Footer";

function Main() {
  const handleImg = () => {};

  return (
    <>
      <Header handleImg={handleImg} />
      <Seoul_map />
      <Footer />
    </>
  );
}

export default Main;
