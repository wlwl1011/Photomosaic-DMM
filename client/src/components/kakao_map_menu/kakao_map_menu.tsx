import "./kakao_map_menu.css";
import React, { useEffect, useState } from "react";

declare global {
  interface Window {
    kakao: any;
  }
}

type store_list={  
    id:number;
    address: string;
    avg_rating: number;
    menu_name: string;
    store_name: string;
    num_review: number;
    open_time: string;
    phone_number: string;
    store_img: string;
  
}

interface Iprops {
  store_list: store_list[]
}

function Kakao_map_menu(props: Iprops) {

  useEffect(() => {

      let container = document.getElementById("map");

      let options = {
        center: new window.kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 8, // 지도의 확대 레벨
      };

      let map = new window.kakao.maps.Map(container, options);

      let geocoder = new window.kakao.maps.services.Geocoder();
      let imageSrc = "/maker.png" // 마커이미지의 주소입니다
      // 마커 이미지의 이미지 크기 입니다
      let imageSize = new window.kakao.maps.Size(24, 35); 
      // 마커 이미지를 생성합니다    
      let markerImage = new window.kakao.maps.MarkerImage(imageSrc, imageSize); 
      

      console.log(props.store_list)
  
      props.store_list.map((el:any)=>{ 
        geocoder.addressSearch(el.address,function (result: any, status: string) {   
          // 정상적으로 검색이 완료됐으면
          if (status === window.kakao.maps.services.Status.OK) {
            let coords = new window.kakao.maps.LatLng(result[0].y, result[0].x)
            // 마커를 생성합니다
            console.log(coords)
            var marker = new window.kakao.maps.Marker({
              map: map, // 마커를 표시할 지도
              position: coords, // 마커를 표시할 위치
              title : el.store_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
              image : markerImage // 마커 이미지 
            }); 
            map.setCenter(coords);
          }
        });
      })

     
     

  }, [props.store_list]);

  return (
    <>
      <div id="map" className="kakao_map_menu_container"></div>
    </>
  );
}

export default Kakao_map_menu;


// 용산구 퀘사디아
// 마포구 갈비