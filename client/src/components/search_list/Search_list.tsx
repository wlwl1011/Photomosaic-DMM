import "./Search_list.css";

function Search_list() {
  return (
    <>
      <li className="search_lately-list">
        <span>캘리포니아</span>
        <div className="search_lately-list-box">
          <span>2021-12-02</span>
          <img className="search_list-close" src="./search/close.svg" />
        </div>
      </li>
    </>
  );
}

export default Search_list;
