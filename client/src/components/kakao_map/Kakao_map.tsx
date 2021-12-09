import "./Kakao_map.css";
import React, { useEffect, useState } from "react";

declare global {
  interface Window {
    kakao: any;
  }
}

function Kakao_map() {
  // const [width, setWidth] = useState<number>(0);

  // let result: any = document.querySelector<HTMLElement>(".kakao_map_container");
  // // 좌표 벗어날 경우 재설정 함수
  // function setCenter() {
  //   const moveLatLon = new window.kakao.maps.LatLng(37.54699, 127.09598);
  //   map.setCenter(moveLatLon);
  // }
  // setCenter();
  useEffect(() => {
    let container = document.getElementById("map");

    let options = {
      center: new window.kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

    let map = new window.kakao.maps.Map(container, options);

    console.log("loading kakaomap");

    var imageSrc = "./maker.png", // 마커이미지의 주소입니다
      imageSize = new window.kakao.maps.Size(70, 70), // 마커이미지의 크기입니다
      imageOption = { offset: new window.kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new window.kakao.maps.MarkerImage(
        imageSrc,
        imageSize,
        imageOption
      ),
      markerPosition = new window.kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new window.kakao.maps.Marker({
      position: markerPosition,
      image: markerImage, // 마커이미지 설정
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
