import "./Search.css";
import React, { useEffect, useState, useImperativeHandle } from "react";
import Search_list from "../search_list/Search_list";
import Search_result from "../search_result/Search_result";
import Search_default from "../search_default/Search_default";
import Search_empty from "../search_empty/Search_empty";
import axios from "axios";

interface Iprops {
  animation: boolean;
  right: string;
  handleSearch: () => void;
  emptySearch: () => void;
}

function Search(props: Iprops) {
  const [count, setCount] = useState<number>(0);
  // 검색 리스트 필터 value 관리
  const [liValue, setliValue] = useState<string>("선택");

  // 검색 리스트 관리
  const [list, setList] = useState<boolean>(false);

  // input 검색어 관리
  const [Search, setSearch] = useState<string>("");

  // 검색 결과 초기 화면
  const [ser_default, setSer_default] = useState<boolean>(true);

  // 검색 결과 화면
  const [ser_result, setSer_result] = useState<boolean>(false);

  // props 내려줄 데이터 관리
  type Store = {
    address: string;
    avg_rating: number;
    created_at: string;
    id: number;
    menu_name: string;
    open_time: string;
    phone_number: string;
    store_img: string;
    store_name: string;
    updated_at: string;
  };
  const [data, setdata] = useState<Store[]>([]);

  type SearchWord = {
    id: number;
    user_id: number;
    search_word: string;
    created_at: string;
  };
  const [searchWord, setSearchWord] = useState<SearchWord[]>([]);

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
  const SearchClick = async () => {
    setSer_default(false);

    if (liValue === "가게") {
      await axios
        .get(`https://yummyseoulserver.tk/store/byStorename/${Search}`, {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        })
        .then(async (res) => {
          setdata([res.data.data]);
          //setCount(count+1);
          setSer_result(true);
          await axios
            .post(
              `https://yummyseoulserver.tk/search-word/add-search-word/${Search}`,
              {},
              {
                headers: { "Content-Type": "application/json" },
                withCredentials: true,
              }
            )
            .then((res) => setCount(count + 1))
            .catch(() => {});
        })
        .catch((err) => setSer_result(false));
    } else if (liValue === "메뉴") {
      await axios
        .get(`https://yummyseoulserver.tk/store/byMenu/${Search}`, {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        })
        .then(async (res) => {
          setdata(res.data.data);
          setSer_result(true);
          await axios
            .post(
              `https://yummyseoulserver.tk/search-word/add-search-word/${Search}`,
              {},
              {
                headers: { "Content-Type": "application/json" },
                withCredentials: true,
              }
            )
            .then((res) => {
              setCount(count + 1);
            })
            .catch(() => {});
        })
        .catch((err) => setSer_result(false));
    }
  };

  // 검색창 검색 value 업데이트
  const inputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { value } = e.target;
    setSearch(value);
  };

  const deleteSearchWordHandler = async (search_word: string) => {
    await axios
      .delete(`https://yummyseoulserver.tk/search-word/${search_word}`, {
        headers: { "Content-Type": "application/json" },
        withCredentials: true,
      })
      .then((res) => setCount(count + 1));
  };

  // useEffect(() => {}, [count]);

  useEffect(() => {
    (async () => {
      await axios
        .get(`https://yummyseoulserver.tk/search-word/`, {
          headers: { "Content-Type": "application/json" },
          withCredentials: true,
        })
        .then((res) => {
          setSearchWord(res.data.data);
        })
        .catch((err) => setSearchWord([]));
    })();
  }, [count]);

  useImperativeHandle(props.emptySearch, () => ({
    emptySearch() {
      setdata([]);
      setSer_default(true);
    },
  }));

  console.log("data 결과:", data);

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
                      <img
                        className="search_icon"
                        src="/search/search.svg"
                        onClick={SearchClick}
                      />
                    </div>
                  </div>
                </nav>
              </div>
              <div className="search_lately-container">
                <h3 className="search_lately-title">최근 검색어</h3>
                <ul className="search_lately-box">
                  {searchWord.length !== 0
                    ? searchWord.map((el: SearchWord) => {
                        return (
                          <Search_list
                            searchword={el}
                            deleteSearchWordHandler={deleteSearchWordHandler}
                          />
                        );
                      })
                    : null}
                </ul>
              </div>
              <div className="search_result-container">
                <h3 className="search_lately-title">검색 결과</h3>
                <div className="search_result-box">
                  {ser_default ? (
                    <Search_default />
                  ) : ser_result ? (
                    <ul className="search_result-list">
                      {data.length !== 0
                        ? data.map((el: Store) => {
                            return <Search_result data={el} />;
                          })
                        : null}
                    </ul>
                  ) : (
                    <Search_empty />
                  )}
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
