# Photomosaic


# 2022 1학기 종합프로젝트 설계-2
- Deep learning을 활용한 Photomosaic 개발 (참여 기업체 : (주)빈즈 소프트)

```
컴퓨터학부 글로벌Sw융합전공 19학번 권수빈
컴퓨터학부 글로벌Sw융합전공 19학번 김민지
컴퓨터학부 글로벌Sw융합전공 19학번 김은하
```
<br/>

## Project Title  << Deep learning을 활용한 Photomosaic 개발 >>
   
---------------------------------------------
## [목차]

- [실행방법](#실행방법)
- [과제수행배경](#과제수행배경)
- [과제수행목표](#과제수행목표)
- [개발환경](#개발환경)
- [프로젝트개발내용](#프로젝트개발내용)
- [기대효과](#기대효과)
- [데모영상](#데모영상)
--------------------------------------------

## 실행방법


### pre-requirements

- postgres docker
- minio docker
- minio-ui (optional : if you need admin dashboard page to check minio)

### how to deploy docker

```zsh
cd docker
docker-compose up -d
```

- you can access `minioui.localhost:9001` at admin dashboard
- Please modify the `docker-compose.yaml` in docker directory for custom configuration

### front

- You can develop front with flutter on `front` directory
- Please use `front/deploy.sh` to deploy front
  ```zsh
  bash front/deploy.sh
  ```

### How to run

```zsh
go run main.go
```

## 개발배경

![Untitled](https://user-images.githubusercontent.com/62577565/171769318-99eece14-d89d-436c-9a9d-3fc34165489f.jpg)

- 최근 딥러닝 기술이 각광받게 되면서 딥러닝을 이용해 컴퓨터가 자동으로 Photomosaic를 생성하도록 하는 기술이 활성화 되었음. 
- 이를 통해 서울 관광 홍보 application과 같이 다양한 서비스도 탄생함

>> 이러한 배경으로 빈즈소프트에서도 Photomosaic과 관련된 서비스를 제공하는 application을 기획하였고 저희에게 프로젝트 수행을 요청

## 과제수행목표

![Untitled](https://user-images.githubusercontent.com/62577565/171769450-d3da1cda-324a-43cc-ae6f-a4526093965b.jpg)

- 포토모자이크 기술을 활용하여 이용자에게 다양한 서비스를 제공
- 공유 기능을 추가하여 바이럴 마케팅
- 기업의 홍보효과 및 배너 광고를 통한 수익 창출

## 개발환경

![sysA 001](https://user-images.githubusercontent.com/62577565/171769542-72ab3482-e2b8-4409-ae1c-075fc4701e39.jpeg)

### Client

- Flutter

### Server 

#### Authorization Server

- Firebase

#### Data Management Module  

- MINIO : Save image object
- PostgreSQL : image meta data

또한 Photomosaic model은 모듈화하여 Golang으로 실행
 
## 프로젝트개발내용

### 로그인 및 회원 가입

![Untitled](https://user-images.githubusercontent.com/62577565/171769918-0902ebc9-e34f-4706-92fe-ad4a9e8a08df.jpg)

- 회원 관리를 위해 firebase 내의 auth 기능을 이용함 
- 해당 사진은 firebase auth내에 회원의 계정이 어떻게 저장되는지 보여줌

(1) SNS 연동 로그인
![Untitled](https://user-images.githubusercontent.com/62577565/171770006-c92f5b93-f9cb-4b39-be52-53714a7e1730.jpg)

- 앱을 처음 실행시켰을 때 splash 후 처음으로 등장하는 페이지에서 SNS 연동 로그인 및 이메일을 이용한 로그인, 회원가입 가능

(2) 일반 로그인
![Untitled](https://user-images.githubusercontent.com/62577565/171770085-9987e9e2-11d1-4f08-89f2-119639b65d43.jpg)

- sns 연동 로그인을 하지 않고 이메일을 통한 로그인 및 회원가입을 원한다면 해당 페이지에서 진행 가능

(3) 자동 로그인
![Untitled](https://user-images.githubusercontent.com/62577565/171770132-1c43139d-3c7a-4e44-bb6c-21674177e039.jpg)

- 로그인을 하게 되면 firebase auth에서 일정시간동안 token을 관리하게 되는데, 이를 이용하여 자동로그인을 구현함


### Photomosaic을 활용한 사진 생성


![Untitled](https://user-images.githubusercontent.com/62577565/171770272-6be3b8a3-546c-4740-a46b-f4a850667bf3.jpg)

- 사용자가 Photomosaic을 생성하는 페이지로 이동하면 Target 이미지를 업로드 함 
- 그 다음으로 Target이미지를 구성하는 소스 이미지를 선택 가능. 이 때 소스 이미지는 사용자의 선호에 따라 서버에 업로드 되어있는 이미지 혹은 User의 앨범에 있는 개인 이미지를 선택할 수 있음

![Untitled](https://user-images.githubusercontent.com/62577565/171770341-d2f5dc37-5f6b-4790-9a57-dd1eb68f1b8c.jpg)

- 이 때 데이터베이스 내의 소스 이미지의 개수가 많아질 수록 타깃 이미지의 각 셀마다 가지고 있는 고유한 값을 표현하기 위한 비교 가능한 셋이 많아지기 때문에 처리 시간이 증가하는 문제 발견

> 따라서 (처리 시간과 사진의 완성도를 고려하여) 데이터 베이스 내의 최소한의 사진을 저장 한 후 향후 생성된 Photomosaic 이미지와 만들고자 했던 Target이미지를 오버랩하여 완성도와 효율을 최대한 확보함

![Untitled](https://user-images.githubusercontent.com/62577565/171778521-fc5bd4bb-11e7-4ac9-ae74-07257982c318.jpg)

![Untitled](https://user-images.githubusercontent.com/62577565/171778543-27b08671-0715-4e2e-921f-58fe2e1f2c86.jpg)

- 이를 통해 서비스 제공 측면에서 앱 처리시간이 늘어나는 것을 방지

#### pixabay로 소스 이미지 Crawling

![Untitled](https://user-images.githubusercontent.com/62577565/171778578-7a1965f8-2b78-4f9c-b0ac-419cf14dea68.jpg)

-  데이터 베이스 내의 사진은 Pixabay에서 크롤링 하여 구성
- Pixabay Developer API를 사용하였고 이는 각 사용자의 Api Key를 통해 HTTP통신으로 작동된다. 

### DB 처리 속도 개선 및 사용자 HISTORY 관리

![Untitled](https://user-images.githubusercontent.com/62577565/171778768-aeb8090d-02f5-41c7-adf1-e2f5828f326e.jpg)

- 서버와 앱의 데이터 송수신 시 HTTP의 Get, Post 방식을 이용

![Untitled](https://user-images.githubusercontent.com/62577565/171778807-6857a33a-ad60-4b27-b0a3-6cc6ee3696f1.jpg)

- 사용자 이미지 데이터 저장을 위한 데이터 베이스는 Minio를 사용
-  이미지의 메타 데이터 저장을 위한 데이터 베이스는 PostgreSQL을 사용
>> 이는 image 타입으로 일반적인 데이터베이스에 저장 가능하나 이미지 데이터가 고해상도, 고용량인 경우 데이터 조회시 DB부하 및 용량 증가로 로딩 속도가 증가 할 수 있다는 문제점을 감안하여 이와 같이 구성함

### 커뮤니티를 통한 사용자 간 교류

![Untitled](https://user-images.githubusercontent.com/62577565/171778923-c14dcf76-0a9c-4e3b-bd3e-26023997c0df.jpg)
![Untitled](https://user-images.githubusercontent.com/62577565/171778981-6172b1f8-8a7f-43e7-b2d9-58c887dd66d2.jpg)

- 서버, 앱 간의 데이터를 즉시 반영하기 위해 Stream을 열어두어 사진 Post 기능 및 좋아요 댓글 달기 기능 구현

### 카카오톡 공유 서비스 제공

![Untitled](https://user-images.githubusercontent.com/62577565/171779022-d6837c94-b01f-4f07-bfff-5cf4f923b4ee.jpg)
![Untitled](https://user-images.githubusercontent.com/62577565/171779056-b80429c1-83a1-4a2f-9ba1-12c649fd2d58.jpg)

- 카카오톡 sns로 직접 공유할 수 있는 서비스를 제공

### 광고 삽입 및 캠페인 삽입

![Untitled](https://user-images.githubusercontent.com/62577565/171779181-680bf8dc-7239-4b87-bad5-79fc48080b6b.jpg)

## 기대효과

![Untitled](https://user-images.githubusercontent.com/62577565/171779108-2e16382a-f1aa-42b4-a8c3-ad64fc43edfe.jpg)

-  바이럴 마케팅, 배너 광고는 물론, 단일 코드 베이스인 flutter를 이용한다는 점에서 경제적 효과와 홍보효과를 기대함



## 데모영상
https://www.youtube.com/watch?v=3KBc8UICEtQ&feature=youtu.be
