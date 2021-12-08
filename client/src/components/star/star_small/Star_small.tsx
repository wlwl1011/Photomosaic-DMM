import React, { useState } from "react";
import "./Star_small.css";

function Star_avg() {
  const [rating, setRating] = useState<string>("10");

  return (
    <>
      <div className="star_small-box">
        <div className="star_small-rating">
          <span
            className={`star_small-background star_small-rating-size${"5"}`}
          ></span>
        </div>
      </div>
    </>
  );
}

export default Star_avg;
