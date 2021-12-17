import "./Render_slide.css";

function Render_slide() {
  return (
    <>
      <div className="render_main-slidebox">
        <input type="radio" name="slide" id="render-slide-01" checked />
        <input type="radio" name="slide" id="render-slide-02" />
        <input type="radio" name="slide" id="render-slide-03" />
        <input type="radio" name="slide" id="render-slide-04" />

        <ul className="render_main-slideList">
          <li className="render_main-item">
            <div>
              <label
                htmlFor="render-slide-04"
                className="render_main-label render_main-left"
              ></label>
              <label
                htmlFor="render-slide-02"
                className="render_main-label render_main-right"
              ></label>
              <a>
                <img
                  className="render_main-img"
                  src="/render/test.gif"
                  alt=""
                />
              </a>
            </div>
          </li>
          <li className="render_main-item">
            <div>
              <label
                htmlFor="render-slide-01"
                className="render_main-label render_main-left"
              ></label>
              <label
                htmlFor="render-slide-03"
                className="render_main-label render_main-right"
              ></label>
              <a>
                <img
                  className="render_main-img"
                  src="/render/test.gif"
                  alt=""
                />
              </a>
            </div>
          </li>
          <li className="render_main-item">
            <div>
              <label
                htmlFor="render-slide-02"
                className="render_main-label render_main-left"
              ></label>
              <label
                htmlFor="render-slide-04"
                className="render_main-label render_main-right"
              ></label>
              <a>
                <img
                  className="render_main-img"
                  src="/render/test.gif"
                  alt=""
                />
              </a>
            </div>
          </li>
          <li className="render_main-item">
            <div>
              <label
                htmlFor="render-slide-03"
                className="render_main-label render_main-left"
              ></label>
              <label
                htmlFor="render-slide-01"
                className="render_main-label render_main-right"
              ></label>
              <a>
                <img
                  className="render_main-img"
                  src="/render/test.gif"
                  alt=""
                />
              </a>
            </div>
          </li>
        </ul>
      </div>
    </>
  );
}

export default Render_slide;
