package gb04_marketing.controller;

import java.sql.Blob;

public class ImgVO {
	private Blob img;
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Blob getImg() {
		return img;
	}
	public void setImg(Blob img) {
		this.img = img;
	}
}
