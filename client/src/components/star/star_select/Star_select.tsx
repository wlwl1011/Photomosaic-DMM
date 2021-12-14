import React, { useState, useEffect } from "react";
import "./Star_select.css";

function Star_select() {
  const [star, setStar] = useState<string>("6");
  const [imoge, setImoge] = useState<string>("");
  const [imAni, setImAni] = useState<string>("");

  useEffect(() => {
    if (Number(star) < 3) {
      setImoge("🤢");
    } else if (Number(star) < 5) {
      setImoge("😤");
    } else if (Number(star) < 7) {
      setImoge("😐");
    } else if (Number(star) < 9) {
      setImoge("😁");
    } else {
      setImoge("😍");
    }
  }, [star]);

  const handleStar = (e: any) => {
    setImAni("star_select_imoge-none");
    const data = e.target.getAttribute("value");
    setStar(data);
    setTimeout(() => {
      setImAni("");
    }, 100);
  };

  console.log(star);
  console.log(imoge);

  // 타입스크립트 버전
  // const handleStar = (e: any) => {
  //   const data: string = e.target.getAttribute("value");

  // };

  return (
    <>
      <div className="star_select_imoge-box">
        <h1 className={`star_select_imoge ${imAni}`}>{imoge}</h1>
      </div>
      <div className="star_select_input-box">
        <div className="star_select_rate">
          <input
            className="star_select_input"
            type="radio"
            id="rating10"
            name="rating"
            value="10"
            onClick={handleStar}
          />
          <label
            className="star_select_label"
            htmlFor="rating10"
            title="5 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating9"
            name="rating"
            value="9"
            onClick={handleStar}
          />
          <label
            className="star_select_half star_select_label"
            htmlFor="rating9"
            title="4 1/2 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating8"
            name="rating"
            value="8"
            onClick={handleStar}
          />
          <label
            className="star_select_label"
            htmlFor="rating8"
            title="4 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating7"
            name="rating"
            value="7"
            onClick={handleStar}
          />
          <label
            className="star_select_half star_select_label"
            htmlFor="rating7"
            title="3 1/2 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating6"
            name="rating"
            value="6"
            onClick={handleStar}
          />
          <label
            className="star_select_label"
            htmlFor="rating6"
            title="3 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating5"
            name="rating"
            value="5"
            onClick={handleStar}
          />
          <label
            className="star_select_half star_select_label"
            htmlFor="rating5"
            title="2 1/2 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating4"
            name="rating"
            value="4"
            onClick={handleStar}
          />
          <label
            className="star_select_label"
            htmlFor="rating4"
            title="2 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating3"
            name="rating"
            value="3"
            onClick={handleStar}
          />
          <label
            className="star_select_half star_select_label"
            htmlFor="rating3"
            title="1 1/2 stars"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating2"
            name="rating"
            value="2"
            onClick={handleStar}
          />
          <label
            className="star_select_label"
            htmlFor="rating2"
            title="1 star"
          ></label>
          <input
            className="star_select_input"
            type="radio"
            id="rating1"
            name="rating"
            value="1"
            onClick={handleStar}
          />
          <label
            className="star_select_half star_select_label"
            htmlFor="rating1"
            title="1/2 star"
          ></label>
        </div>
      </div>
    </>
  );
}

export default Star_select;
