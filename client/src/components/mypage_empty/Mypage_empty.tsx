import "./Mypage_empty.css";

function Mypage_empty() {
  return (
    <>
      <div className={`mypage_empty_container`}>
        <img className="mypage_empty-img" src="/mypage/empty.png" />
        <h1 className="mypage_empty-text">해당 항목이 비어있습니다.</h1>
      </div>
    </>
  );
}

export default Mypage_empty;
