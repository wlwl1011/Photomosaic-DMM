import { useEffect, useState } from "react";
import "./ReviewEdit.css";
import React from "react";
import Star_select from "../star/star_select/Star_select";

interface Iprops {
  reviewEdit: (e: string) => void;
  reviewNone: string;
}

function ReviewEdit(props: Iprops) {
  const handleNone = () => {
    props.reviewEdit("reviewEdit_hidden");
  };

  return (
    <>
      <div className={`reviewEdit_modal ${props.reviewNone}`}>
        <div className="reviewEdit_overlay"></div>
        <div className="reviewEdit_content">
          <button className="reviewEdit_closeBtn" onClick={handleNone}>
            ❌
          </button>
          <section className="reviewEdit_writing">
            <h1 className="reviewEdit_title">리뷰 쓰기</h1>
            <Star_select />
            <div className="reviewEdit_input-box">
              <textarea className="reviewEdit_input"></textarea>
            </div>
            <button className="reviewEdit_btn">리뷰 등록</button>
          </section>
        </div>
      </div>
    </>
  );
}

export default ReviewEdit;
