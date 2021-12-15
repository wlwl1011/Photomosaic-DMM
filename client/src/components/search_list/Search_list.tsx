import "./Search_list.css";

interface Iprops{
  searchword:{
    id:number;
    user_id:number;
    search_word:string;
    created_at:string;
  }
  deleteSearchWordHandler:(search_word:string)=>void
}

function Search_list(props:Iprops) {
  return (
    <>
      <li className="search_lately-list">
        <span>{props.searchword.search_word}</span>
        <div className="search_lately-list-box">
          <span>{props.searchword.created_at.slice(0,10)}</span>
          <img className="search_list-close" src="/search/close.svg" onClick={()=>{props.deleteSearchWordHandler(props.searchword.search_word)}}/>
        </div>
      </li>
    </>
  );
}

export default Search_list;
