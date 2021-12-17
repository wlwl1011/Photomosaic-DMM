import "./Render.css";
import Render_intro from "../../components/render_intro/Render_intro";
import Render_start from "../../components/render_start/Render_start";
import Render_main from "../../components/render_main/Render_main";

function Render() {
  return (
    <>
      <div className="render_container">
        <Render_intro />
        <Render_main />
        <Render_start />
      </div>
    </>
  );
}

export default Render;
