import { useEffect, useState } from "react";
import "./ReviewEdit.css";
import React from "react";
import Star_select from "../star/star_select/Star_select";

interface Iprops {
  reviewEdit: (e: string) => void;
  addReviewHandler:(store_id:number,comment:string,rating:number)=>void;
  reviewNone: string;
  storeId:number
}

function ReviewEdit(props: Iprops) {
  const handleNone = () => {
    props.reviewEdit("reviewEdit_hidden");
  };

  const [rating,setRating]=useState<number>(0);
  const [comment,setComment]=useState<string>("");
  
  const ratingHandler=(rating:number)=>{
    setRating(rating)
  }

  const commentHandler=(e: React.ChangeEvent<HTMLTextAreaElement>)=>{
    setComment(e.target.value)
  }

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
            <Star_select ratingHandler={ratingHandler}/>
            <div className="reviewEdit_input-box">
              <textarea className="reviewEdit_input" onChange={commentHandler}></textarea>
            </div>
            <button className="reviewEdit_btn" onClick={()=>{props.addReviewHandler(props.storeId,comment,rating)}}>리뷰 등록</button>
          </section>
        </div>
      </div>
    </>
  );
}

export default ReviewEdit;
