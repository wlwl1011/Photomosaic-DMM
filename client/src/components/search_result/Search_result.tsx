import { Link } from "react-router-dom";
import "./Search_result.css";

interface Iprops{
  data:{
      id:number;
      address: string;
      avg_rating: number;
      menu_name: string;
      store_name: string;
      open_time: string;
      phone_number: string;
      store_img: string;
    }
}

function Search_result(props : Iprops) {
  return (
    <>
      <li className="search_result-listBox">
        <div className="search_result-link">
          <Link to={ {pathname:`/store/${props.data.id}` }} style={{textDecoration: 'none', color:"black"}} >
            <img className="search_list-img" src="/jongro.jpeg" />
            <h3 className="search_list-text">{props.data.store_name}</h3>
          </Link>
        </div>
      </li>
    </>
  );
}

export default Search_result;
