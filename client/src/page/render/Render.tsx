import "./Render.css";
import Render_intro from "../../components/render_intro/Render_intro";
import Render_start from "../../components/render_start/Render_start";
function Render() {
  return (
    <>
      <div className="render_container">
        <Render_intro />
        <Render_start />
      </div>
    </>
  );
}

export default Render;
