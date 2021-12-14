import "./Image_chan.css";

interface Iprops {
  image_none: string;
}

function Image_chan(props: Iprops) {
  return (
    <>
      <div className={`${props.image_none}`}>
        <div className="image_chan-container">
          <div className="image_chan_img-container">
            <img className="image_chan-box" src={""}></img>
          </div>
          <form>
            <div className="image_chan-label-box">
              <label htmlFor="chooseFile" className="image_chan_label">
                프로필 선택
              </label>
            </div>
            <input
              type="file"
              id="chooseFile"
              name="chooseFile"
              accept="image/*"
            />
          </form>
        </div>
        <div className="image_chan_btn-box">
          <div className="image_chan_btn-text-box">
            <h3 className="image_chan_btn-text-success">
              변경에 성공했습니다.
            </h3>
          </div>
          <button className="image_chan_btn">변경하기</button>
        </div>
      </div>
    </>
  );
}

export default Image_chan;
