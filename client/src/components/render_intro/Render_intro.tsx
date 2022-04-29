import "./Render_intro.css";
import { useState } from "react";

function Render_intro() {
  const [balloon1, setBalloon1] = useState<boolean>(false);
  const [balloon2, setBalloon2] = useState<boolean>(false);
  const [balloon3, setBalloon3] = useState<boolean>(false);
  const [balloon4, setBalloon4] = useState<boolean>(false);

  setTimeout(() => {
    setBalloon1(true);
  }, 1000);
  setTimeout(() => {
    setBalloon2(true);
  }, 2500);
  setTimeout(() => {
    setBalloon3(true);
  }, 3500);
  setTimeout(() => {
    setBalloon4(true);
  }, 4500);
  return (
    <>
      <section className="render_intro_container">
        <div className="render_intro_title-box">
          <h1 className="render_intro_title">야미서울은</h1>
          <h1 className="render_intro_title">이런 분들을 위해 만들어졌어요!</h1>
        </div>
        <div className="render_intro_box">
          {balloon1 ? (
            <div className="render_intro_balloon_01">
              <div className="render_intro_word-box-1">
                <h3>서울 각 지역구의</h3>
                <h3 className="render_intro_word-box2">
                  <div className="render_intro_word-main">대표 음식</div>은
                  뭘까?
                </h3>
              </div>
            </div>
          ) : null}
          {balloon2 ? (
            <div className="render_intro_balloon_02">
              <div className="render_intro_word-box-2">
                <h3 className="render_intro_word-box2">
                  <div className="render_intro_word-main">맛집</div>은 또,
                </h3>
                <h3>어디에 있을까?</h3>
              </div>
            </div>
          ) : null}
          {balloon3 ? (
            <div className="render_intro_balloon_03">
              <div className="render_intro_word-box-3">
                <h3 className="render_intro_word-box2">
                  <div className="render_intro_word-main">위치</div>와&nbsp;
                  <div className="render_intro_word-main"> 대중교통</div>을
                </h3>
                <h3>한번에 알수 있을까?</h3>
              </div>
            </div>
          ) : null}
          {balloon4 ? (
            <div className="render_intro_balloon_04">
              <div className="render_intro_word-box-4">
                <h3 className="render_intro_word-box2">
                  정답은&nbsp;
                  <div className="render_intro_word-yummy">야미서울!!</div>
                </h3>
                <a href="/main">
                  <h3 className="render_intro_access-main">
                    야미서울 서비스 이용하기
                  </h3>
                </a>
              </div>
            </div>
          ) : null}

          <img className="render_intro_title_img" src="/render/char_1.png" />
        </div>
      </section>
    </>
  );
}

export default Render_intro;
