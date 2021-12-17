import "./Search_empty.css";

function Search_empty() {
  return (
    <>
      <div className="search_result-empty-box">
        <img className="search_result-empty-img" src="/mypage/empty.png" />
        <h3 className="search_result-empty-text">검색 결과가 없습니다.</h3>
      </div>
    </>
  );
}

export default Search_empty;
