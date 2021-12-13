import "./Search.css";
import React, { useState } from "react";
import Search_list from "../search_list/Search_list";
import Search_result from "../search_result/Search_result";

interface Iprops {
  animation: boolean;
  right: string;
  handleSearch: () => void;
}

function Search(props: Iprops) {
  // 검색 리스트 필터 value 관리
  const [liValue, setliValue] = useState<string>("선택");

  // 검색 리스트 관리
  const [list, setList] = useState<boolean>(false);

  // 검색 필터 관리
  const handleList = () => {
    setList(!list);
  };

  // 검색 필터 value 관리
  const handleListSelect = (e: any) => {
    const data: string = e.target.getAttribute("value");
    setliValue(data);
  };

  return (
    <>
      <div>
        <input type="checkbox" id="search_modal" className="search_hidden" />
        {/* ########################################## 여기부터 검색 모달 ############################################ */}
        {props.animation ? (
          <div className={`search_modal_container ${props.right} `}>
            <section className="search_container">
              <div className="search_container_close-box">
                <label htmlFor="search_modal">
                  <img
                    className="search_container_close"
                    src="./search/close_tap.svg"
                    onClick={props.handleSearch}
                  />
                </label>
              </div>
              <div className="search_nav">
                <nav className="search_nav-box">
                  <div className="search_select" onClick={handleList}>
                    <div className="search_select-box">
                      <span>
                        {liValue}
                        {list ? (
                          <img
                            className="search_icon-arrow"
                            src="./search/arrow-up.svg"
                          />
                        ) : (
                          <img
                            className="search_icon-arrow"
                            src="./search/arrow-down.svg"
                          />
                        )}
                      </span>
                    </div>
                    {list ? (
                      <ul className="search_list-box">
                        <li
                          value="가게"
                          className="search_list"
                          onClick={handleListSelect}
                        >
                          가게 정보
                        </li>
                        <li
                          value="메뉴"
                          className="search_list"
                          onClick={handleListSelect}
                        >
                          메뉴 정보
                        </li>
                      </ul>
                    ) : null}
                  </div>
                  <div className="search_input-box">
                    <input
                      className="search_input"
                      placeholder="필터를 선택하여 검색어를 입력해주세요"
                    />
                    <div className="search_icon-box">
                      <img className="search_icon" src="./search/search.svg" />
                    </div>
                  </div>
                </nav>
              </div>
              <div className="search_lately-container">
                <h3 className="search_lately-title">최근 검색어</h3>
                <ul className="search_lately-box">
                  <Search_list />
                  <Search_list />
                  <Search_list />
                </ul>
              </div>
              <div className="search_result-container">
                <h3 className="search_lately-title">검색 결과</h3>
                <div className="search_result-box">
                  <ul className="search_result-list">
                    <Search_result />
                    <Search_result />
                    <Search_result />
                  </ul>
                </div>
              </div>
            </section>
          </div>
        ) : null}
      </div>
    </>
  );
}

export default Search;
