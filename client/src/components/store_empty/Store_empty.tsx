import "./Store_empty.css";

function Store_empty() {
  return (
    <>
      <div className="store_empty-box">
        <img className="store_empty-img" src="/mypage/empty.png" />
        <h3 className="store_empty-text">해당 가게 리뷰가 비어있습니다.</h3>
      </div>
    </>
  );
}

export default Store_empty;
