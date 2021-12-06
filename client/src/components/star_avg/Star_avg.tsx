import React, { useState } from "react";
import "./Star_avg.css";

function Star_avg() {
  const [rating, setRating] = useState<string>("10");

  return (
    <>
      <div className="star-box">
        <div className="star-rating">
          <span className={`star-background star-rating-size${"5"}`}></span>
        </div>
      </div>
    </>
  );
}

export default Star_avg;
