package g01_login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import gb01_login.controller.AdminBean;
import gb01_login.controller.AdminService;

@WebServlet(urlPatterns={"/Account/Login.controller"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = -595078994078999385L;

	private String accountStatus = null;
	private MemberBean memBean = new MemberBean();
	private AdminBean adBean = new AdminBean();
	private HttpSession session;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		session = request.getSession();
		accountStatus = request.getParameter("accountStatus");

		if (StringUtils.isEmpty(accountStatus)) {
			request.getRequestDispatcher("/g01_login/Login.jsp").forward(request,
					response);
		} else {
			String mail = request.getParameter("mail");
			String pwd = request.getParameter("pwd");

			Map<String, String> error = new HashMap<>();
			request.setAttribute("error", error);
			// Mail判斷是否空值
			if (StringUtils.isEmpty(mail)) {
				error.put("mail", "Mail connt Empty");
			}

			// PWD判斷是否空值
			if (StringUtils.isEmpty(pwd)) {
				error.put("pwd", "Password connt Empty");
			}
			if (error.size() > 0) {
				request.getRequestDispatcher("/g01_login/Login.jsp").forward(
						request, response);
			}
			try {
				MemberService memService = new MemberService();
				AdminService adService = new AdminService();
				if (memService.Login(mail, pwd) != null) {
					memBean = memService.Login(mail, pwd);
					session.setAttribute("mail", memBean.getMail());
					// request.setAttribute("account", memBean);
				} else if (adService.Login(mail, pwd) != null) {
					adBean = adService.Login(mail, pwd);
					session.setAttribute("mail", adBean.getAd_mail());
					// request.setAttribute("account", adBean);
				} else {
					throw new Exception("無此帳號密碼");
//					error.put("loginError", "無此帳號密碼");
//					request.getRequestDispatcher("/g01_login/Login.jsp").forward(request, response);
				}
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				error.put("loginError", e.getMessage());
				request.getRequestDispatcher("/g01_login/Login.jsp").forward(request, response);
			}
			request.getSession().setAttribute("LoginOK", memBean);
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
