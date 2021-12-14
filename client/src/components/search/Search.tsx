import "./Search.css";
import React, { useState } from "react";
import Search_list from "../search_list/Search_list";
import Search_result from "../search_result/Search_result";
import axios from "axios";

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

  // input 검색어 관리
  const [Search, setSearch] = useState<string>('')

  // props 내려줄 데이터 관리
  const [data, setdata] = useState<any>({})

  // 검색 필터 관리
  const handleList = () => {
    setList(!list);
  };

  // 검색 필터 value 관리
  const handleListSelect = (e: any) => {
    const data: string = e.target.getAttribute("value");
    setliValue(data);
  };

  // 검색 아이콘 클릭시 서버에 요청
  const SearchClick = async() => {
   const Post: any = (liValue === '가게' ? 
   await axios.get(
     `https://localhost:4000/store/byStorename/${Search}`,
   {
     headers: { "Content-Type": "application/json" },
     withCredentials: true
   }
  ) :
   (liValue === '메뉴' ?
   await axios.get(
    `https://localhost:4000/store/byMenu/${Search}`,
  {
    headers: { "Content-Type": "application/json" },
    withCredentials: true
  }
 ) : '해당하는 메뉴가 없습니다.'))
    setdata(Post.data.data)
  }

  // 검색창 검색 value 업데이트
  const inputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { value } = e.target
    setSearch(value)
  }

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
                    src="/search/close_tap.svg"
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
                            src="/search/arrow-up.svg"
                          />
                        ) : (
                          <img
                            className="search_icon-arrow"
                            src="/search/arrow-down.svg"
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
                      onChange={inputChange}
                    />
                    <div className="search_icon-box">
                      <img className="search_icon" src="/search/search.svg" onClick={SearchClick}/>
                    </div>
                  </div>
                </nav>
              </div>
              <div className="search_lately-container">
                <h3 className="search_lately-title">최근 검색어</h3>
                <ul className="search_lately-box">
                  
                  
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
