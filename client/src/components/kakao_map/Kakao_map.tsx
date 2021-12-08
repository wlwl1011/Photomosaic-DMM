import "./Kakao_map.css";
import React, { useEffect, useState } from "react";

declare global {
  interface Window {
    kakao: any;
  }
}

function Kakao_map() {
  useEffect(() => {
    let container = document.getElementById("map");

    let options = {
      center: new window.kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

    let map = new window.kakao.maps.Map(container, options);

    console.log("loading kakaomap");
    var markerPosition = new window.kakao.maps.LatLng(37.54699, 127.09598);

    // 마커를 생성합니다
    var marker = new window.kakao.maps.Marker({
      position: markerPosition,
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
  }, []);

  return (
    <>
      <div id="map" className="kakao_map_container"></div>
    </>
  );
}

export default Kakao_map;
