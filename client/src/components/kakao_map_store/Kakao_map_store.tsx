import "./Kakao_map_store.css";
import React, { useEffect, useState } from "react";

declare global {
  interface Window {
    kakao: any;
  }
}


interface Iprops {
  coordsHandler: (x: number, y: number) => void;
  address: string;
}

function Kakao_map_store(props: Iprops) {
  
  useEffect(() => {
    let container = document.getElementById("map");

    let options = {
      center: new window.kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

    let map = new window.kakao.maps.Map(container, options);

    
      // 주소-좌표 변환 객체를 생성합니다
      let geocoder = new window.kakao.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      geocoder.addressSearch(
        props.address,
        function (result: any, status: string) {
          var imageSrc = "/maker.png", // 마커이미지의 주소입니다
            imageSize = new window.kakao.maps.Size(70, 70), // 마커이미지의 크기입니다
            imageOption = { offset: new window.kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

          // 정상적으로 검색이 완료됐으면
          if (status === window.kakao.maps.services.Status.OK) {
            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new window.kakao.maps.MarkerImage(
              imageSrc,
              imageSize,
              imageOption
            );

            var coords = new window.kakao.maps.LatLng(result[0].y, result[0].x);      
            props.coordsHandler(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            new window.kakao.maps.Marker({
              map: map,
              position: coords,
              image: markerImage,
            });

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
          }
        }
      );
  
  }, [props.address]);

  return (
    <>
      <div id="map" className="kakao_map_store_container"></div>
    </>
  );
}

export default Kakao_map_store;


// 용산구 퀘사디아
// 마포구 갈비