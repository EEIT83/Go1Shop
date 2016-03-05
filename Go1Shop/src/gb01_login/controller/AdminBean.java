package gb01_login.controller;

public class AdminBean {
	private String ad_mail;
	private String ad_pwd;
    private int competence;
	public String getAd_mail() {
		return ad_mail;
	}
	public void setAd_mail(String ad_mail) {
		this.ad_mail = ad_mail;
	}
	public String getAd_pwd() {
		return ad_pwd;
	}
	public void setAd_pwd(String ad_pwd) {
		this.ad_pwd = ad_pwd;
	}
	public int getCompetence() {
		return competence;
	}
	public void setCompetence(int competence) {
		this.competence = competence;
	}
	@Override
	public String toString() {
		return "AdminBean [ad_mail=" + ad_mail + ", ad_pwd=" + ad_pwd + ", competence=" + competence + "]";
	}

}
