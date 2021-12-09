import "./Mypage_empty.css";

interface Iprops {
  emptyNone: string;
}

function Mypage_empty(props: Iprops) {
  return (
    <>
      <div className={`mypage_empty_container ${props.emptyNone}`}>
        <img className="mypage_empty-img" src="./mypage/empty.png" />
        <h1 className="mypage_empty-text">위 메뉴 항목을 클릭해주세요!</h1>
      </div>
    </>
  );
}

export default Mypage_empty;
