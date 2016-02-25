package g02_member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g01_login.model.MemberDAO;
import g02_member.utils.admin.EmailUtils;

@WebServlet(
		urlPatterns = { "/Account/ForgetPwd.controller" })
public class ForgetPwdServlet extends HttpServlet {
	private String title = "新密碼";
	private String content = "登入後請馬上更改密碼";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("mail");
		MemberDAO dao;
		try {
			dao = new MemberDAO();
			if (dao.selectId(mail) == null) {
				request.setAttribute("errorMsg", mail + "，不存在！");
				request.getRequestDispatcher("/g02_member/ForgetPwd.jsp").forward(request, response);
			}
			EmailUtils emailUtils = new EmailUtils();
			// 发送重新设置密码的链接
			emailUtils.sendSingleMail(mail, content, title);
			request.getRequestDispatcher("/g01_login/Login.jsp").forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
