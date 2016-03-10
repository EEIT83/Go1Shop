package gb01_login.controller;

import gb01_login.model.AdminDAO;

public class AdminService {

	private AdminFace dao;

	public AdminService() throws Exception {
		dao = new AdminDAO();
	}

	public AdminBean Login(String mail, String pwd) throws Exception {
		AdminBean bean = dao.selectById(mail);
		if (bean != null) {
			if (pwd.equals(bean.getAd_pwd())) {
				return bean;
			}
		}
		return null;
	}

	public void ChangePwd(String mail,String oldPwd,String newPwd) throws Exception{
		AdminBean bean = dao.selectById(mail);
		if(oldPwd.equals(bean.getAd_pwd())){
			bean.setAd_pwd(newPwd);
		}else {
			throw new Exception("2");
		}

	}
}
