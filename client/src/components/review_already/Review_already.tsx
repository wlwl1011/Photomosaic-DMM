import "./Review_already.css";

function Review_already() {
  return (
    <>
      <div className={`review_alr_modal `}>
        <div className="review_alr_overlay"></div>
        <div className="review_alr_content">
          <button className="review_alr_closeBtn">❌</button>
          <section className="review_alr_writing">
            <h1 className="review_alr_title"> 이미 리뷰를 등록하셨습니다.</h1>
          </section>
        </div>
      </div>
    </>
  );
}

export default Review_already;
