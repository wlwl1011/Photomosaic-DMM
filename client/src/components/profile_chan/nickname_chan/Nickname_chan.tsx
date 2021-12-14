import "./Nickname_chan.css";

interface Iprops {
  nickname_none: string;
}

function Nickname_chan(props: Iprops) {
  return (
    <>
      <div className={`nickname_chan ${props.nickname_none}`}>
        <div className="nickname_chan-container">
          <div className="nickname_chan-box ">
            <input
              className="nickname_chan_input"
              placeholder="닉네임"
              type="text"
            />
            <div className="nickname_chan-text-box">
              <h3 className="nickname_chan-text">
                ✅ 사용 가능한 닉네임입니다.
              </h3>
              <h4 className="nickname_chan-check">중복검사</h4>
            </div>
          </div>
        </div>
        <div className="nickname_chan_btn-box">
          <div className="nickname_chan_btn-text-box">
            <h3 className="nickname_chan_btn-text-success">
              변경에 성공했습니다.
            </h3>
          </div>
          <button className="nickname_chan_btn">변경하기</button>
        </div>
      </div>
    </>
  );
}

export default Nickname_chan;
