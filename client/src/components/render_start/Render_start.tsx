import "./Render_start.css";
import Render_scroll from "./Render_scroll/Render_scroll";

function Render_start() {
  const animatedItem: any = Render_scroll();

  return (
    <>
      <section className="render_start-container">
        <div className="render_start_title-box">
          <h1>😜</h1>
          <h1 className="render_start_title">Let's Play</h1>
        </div>
        <div className="render_start_intro-box">
          <h1>지금 서비스를</h1>
          <h1>누려보세요!</h1>
        </div>
        <div className="render_start_img-box" {...animatedItem}>
          <img className="render_start_char-img" src="/render/char_2.png" />
          <div className="render_start_food-box">
            <img className="render_start_buger_img" src="/render/burger.png" />
            <img
              className="render_start_chicken_img"
              src="/render/chicken.png"
            />
            <img
              className="render_start_hot_dog_img"
              src="/render/hot_dog.png"
            />
          </div>
          <img className="render_start_char-img" src="/render/char_3.png" />
        </div>
        <div className="render_start_btn-box">
          <a href="/main">
            <button className="render_start_btn">메인으로 이동하기</button>
          </a>
        </div>
      </section>
    </>
  );
}

export default Render_start;
