import { Link } from "react-router-dom";
import "./Menu_list.css";

interface Iprops {
  menu_list: {
    id:number;
    area_name: string;
    comment: string;
    menu_img: string;
    menu_name: string;
  };
}

function Menu_list(props: Iprops) {
  return (
    <>
      <li>
        <img className="map_list-img" src="jongro.jpeg" />
        <h3>{props.menu_list.menu_name}</h3>
        <Link to={ {pathname:`/menu/${props.menu_list.area_name}/${props.menu_list.menu_name}`}} style={{textDecoration: 'none'}} >
          <h4 className="map_list-store">해당 가게 알아보기</h4>
          </Link>
      </li>
    </>
  );
}

export default Menu_list;
