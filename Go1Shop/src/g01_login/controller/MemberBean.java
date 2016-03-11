package g01_login.controller;

public class MemberBean {

	private int mem_id;
	private String nickName;
	private String mail;
	private String pwd;
	private String mem_name;
	private String gender;
	private java.sql.Date bdate;
	private String point;
	private java.sql.Date join_date;
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMem_id() {
		return mem_id;
	}

	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}

	public java.sql.Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(java.sql.Date join_date) {
		this.join_date = join_date;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public java.sql.Date getBdate() {
		return bdate;
	}

	public void setBdate(java.sql.Date bdate) {
		this.bdate = bdate;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "LoginVO [mail=" + mail + ", pwd=" + pwd + ", mem_name="
				+ mem_name  + ", gender="
				+ gender + ", bdate=" + bdate + ", point=" + point + "]";
	}

}
