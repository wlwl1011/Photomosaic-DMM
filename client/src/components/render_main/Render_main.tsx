import "./Render_main.css";
import Render_deco from "./render_deco/Render_deco";
import Render_slide from "./render_slide/Render_slide";

function Render_main() {
  return (
    <>
      <section className="render_main_container">
        <div className="render_main_title-box">
          <Render_deco />
          <h1>서비스는,</h1>
          <h1>이렇게 준비했어요.</h1>
          <div className="render_main_dot-box">
            <h5 className="render_main_dot">.</h5>
            <h5 className="render_main_dot">.</h5>
            <h5 className="render_main_dot">.</h5>
          </div>
        </div>
        <div className="render_main_gif-box">
          <img className="render_main_imac" src="/render/imac.png" />
          <img className="render_main_ipad" src="/render/ipad.png" />
          <img className="render_main_iphone" src="/render/iphone.png" />

          <Render_slide />
        </div>
      </section>
    </>
  );
}

export default Render_main;
