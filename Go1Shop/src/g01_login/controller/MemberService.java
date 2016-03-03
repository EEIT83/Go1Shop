package g01_login.controller;

import g01_login.model.MemberDAO;

public class MemberService {

	private MemberFace memberDAO;

	public MemberService() throws Exception {
		memberDAO = new MemberDAO();
	}

	// Login
	public MemberBean Login(String mail, String pwd) throws Exception {
		MemberBean bean = memberDAO.selectId(mail);
		if (bean != null) {
			if (bean.getPwd().equals(pwd)) {
				if (bean.getStatus().equals("N")) {
					return bean;
				} else {
					throw new Exception("你已被停權");
				}
			}
		}
		return null;
	}

	// Change the password
	public void ChangePwd(String mail, String oldPwd, String newPwd)
			throws Exception {
		MemberBean bean = memberDAO.selectId(mail);
		if (bean.getPwd().equals(oldPwd)) {
			bean.setPwd(newPwd);
			memberDAO.update(bean);
		} else {
			throw new Exception("舊密碼錯誤");
		}
	}

	// Modify import DAO
	// Delete
	public int DeleteMember(MemberBean memVo) throws Exception {
		int count = memberDAO.delete(memVo);
		return count;
	}
}
