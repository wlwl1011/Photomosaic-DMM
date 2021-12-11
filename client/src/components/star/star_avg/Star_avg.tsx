import React, { useState } from "react";
import "./Star_avg.css";

interface Iprops {
  avg_rating: number;
}

function Star_avg(props: Iprops) {
  const [rating, setRating] = useState<string>("10");

  return (
    <>
      <div className="star-box">
        <div className="star-rating">
          <span
            className={`star-background star-rating-size${props.avg_rating}`}
          ></span>
        </div>
      </div>
    </>
  );
}

export default Star_avg;
