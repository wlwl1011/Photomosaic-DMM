import "./Image_chan.css";
import { useEffect, useState, useImperativeHandle } from "react";
import axios from "axios";

interface Iprops {
  image_none: string;
  emptyImg: () => void;
  handleCount: () => void;
}

function Image_chan(props: Iprops) {
  const [proImage, setProImage] = useState<undefined | string>(
    "/signup/profile_defalut.png"
  );
  const [image, setImage] = useState<File | string | Blob>("");
  const [result, setResult] = useState<boolean>(false);
  const [empty, setEmpty] = useState<boolean>(false);

  useImperativeHandle(props.emptyImg, () => ({
    emptyImg() {
      setResult(false);
      setImage("");
      setProImage("/signup/profile_defalut.png");
      setEmpty(false);
    },
  }));

  const handleImg = (e: React.ChangeEvent<HTMLInputElement>) => {
    console.log("이미지 관리 체크");
    const target = e.target as HTMLInputElement;
    console.log((target.files as FileList)[0], (target.files as FileList)[1]);
    const file: File = (target.files as FileList)[0];
    if (file) {
      const imageUrl = URL.createObjectURL(file);
      console.log(file, typeof file);
      // 이래 찍힘 blob:http://localhost:3000/2091452d-c3e9-4d62-9a47-4b01e3069394
      setProImage(imageUrl);
    }

    if (target.files) {
      const uploadFile = target.files[0];
      //console.log(uploadFile);
      setImage(uploadFile);
    }
  };

  const handleChange = async () => {
    const formData = new FormData();
    formData.append("file", image);
    if (image) {
      await axios
        .patch("https://yummyseoulserver.tk/user/change-image", formData, {
          headers: { "Content-Type": "multipart/form-data" },
          withCredentials: true,
        })
        .then(() => {
          setResult(true);
          setEmpty(true);
          props.handleCount();
        })
        .catch((err) => {
          console.log("🚫 Not Found 🚫", err);
        });
    }
  };

  const handleDelete = async () => {
    await axios
      .delete("https://yummyseoulserver.tk/user/image", {
        headers: { "Content-Type": "multipart/form-data" },
        withCredentials: true,
      })
      .then(() => {
        setEmpty(true);
        setProImage("/signup/profile_defalut.png");
        setResult(false);
        props.handleCount();
      });
  };

  return (
    <>
      <div className={`${props.image_none}`}>
        <div className="image_chan-container">
          <div className="image_chan_img-container">
            <img className="image_chan-box" src={proImage}></img>
          </div>
          <form>
            <div className="image_chan-label-box">
              <label htmlFor="input_chan_img" className="image_chan_label">
                프로필 선택
              </label>
              <span className="image_chan_delete" onClick={handleDelete}>
                프로필 삭제
              </span>
            </div>
            <input
              type="file"
              id="input_chan_img"
              name="chooseFile"
              accept="image/*"
              onChange={handleImg}
            />
          </form>
        </div>
        <div className="image_chan_btn-box">
          <div className="image_chan_btn-text-box">
            {empty ? (
              result ? (
                <h3 className="image_chan_btn-text-success">
                  이미지 변경에 성공했습니다.
                </h3>
              ) : (
                <h3 className="image_chan_btn-text-success">
                  이미지를 삭제하였습니다.
                </h3>
              )
            ) : null}
          </div>
          <button className="image_chan_btn" onClick={handleChange}>
            변경하기
          </button>
        </div>
      </div>
    </>
  );
}

export default Image_chan;
