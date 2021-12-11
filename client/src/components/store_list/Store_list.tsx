import "./Store_list.css";
import { useState } from "react";
import Star_small from "../../components/star/star_small/Star_small";
import axios from "axios";

interface Iprops {
  mesNone: string,
  ReviewInfo:{
    id:number,
    user_id:number,
    comment:string,
    rating:number,
    created_at:string,
    user_name:string,
    user_img:string,
    num_review_like:number
  },
  UserId:number
  deleteReviewHandler: ()=>void
  reviewLikeHandler: (reivew_id :number)=>void
}

function Store_list(props: Iprops) {
  
  
  return (
    <>
      <li className="store_review_li-box">
        <img className="store_review_img" src="./store/model.jpeg" />

        <div className={`store_balloon ${props.mesNone}`}>
          <div className="store_review-info">
            <div className="store_review-info-box">
              <span className="store_review-info-text">{props.ReviewInfo.user_name!==undefined ? props.ReviewInfo.user_name : null}</span>
              <span className="store_review-info-day">{props.ReviewInfo.created_at!==undefined ? props.ReviewInfo.created_at.slice(0,10) : null}</span>
              <Star_small rating={props.ReviewInfo.rating}/>
              <span className="store_review-good" onClick={()=>props.reviewLikeHandler(props.ReviewInfo.id)}>👍🏻 {props.ReviewInfo.num_review_like!==undefined ? props.ReviewInfo.num_review_like : null}</span>
            </div>
            {props.UserId===props.ReviewInfo.user_id ? <img className="store_review-icon" src="./search/close.svg" onClick={props.deleteReviewHandler}/> : null}
          </div>
          <h3 className="store_review-content">
            {props.ReviewInfo.comment!==undefined ? props.ReviewInfo.comment : null}
          </h3>
        </div>
      </li>
    </>
  );
}

export default Store_list;
