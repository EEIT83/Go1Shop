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
	//private int windonStatus = 0;
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
			
			session.setAttribute("bmail", mail);
			session.setAttribute("bpwd", pwd);
			
			
			Map<String, String> error = new HashMap<>();
			session.setAttribute("error", error);
			// Mail判斷是否空值
			if (StringUtils.isEmpty(mail)) {
				error.put("mail", "Mail connt Empty");
			}

			// PWD判斷是否空值
			if (StringUtils.isEmpty(pwd)) {
				error.put("pwd", "Password connt Empty");
			}
			if (error.size() > 0) {
				if(accountStatus.equals("login")){
					request.getRequestDispatcher("/g01_login/Login.jsp").forward(
						request, response);
				}
				if(accountStatus.equals("backLogin")){
					response.sendRedirect("/Go1Shop/backLogin.jsp");
					//request.getRequestDispatcher("/backLogin.jsp").forward(request, response);
					return;
				}
				
				
			
			}
			try {
				MemberService memService = new MemberService();
				AdminService adService = new AdminService();
				if (memService.Login(mail, pwd) != null && accountStatus.equals("login")) {
					memBean = memService.Login(mail, pwd);
					session.setAttribute("LoginOK", memBean);
					session.setAttribute("mail", memBean.getMail());
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				} else if (adService.Login(mail, pwd) != null && accountStatus.equals("backLogin")) {
					adBean = adService.Login(mail, pwd);
					session.setAttribute("LoginOK", adBean);
					session.setAttribute("mail", adBean.getAd_mail());
					response.sendRedirect("/Go1Shop/gb04_marketing/backMarketing.jsp");
					
					//response.sendRedirect("/Go1Shop/backLogin.jsp");
					//request.getRequestDispatcher("/backLogin.jsp").forward(request, response);
					return;
				} else {
					throw new Exception("無此帳號密碼");
				}			
			} catch (Exception e) {
				e.printStackTrace();
				error.put("loginError", e.getMessage());
				
				if(accountStatus.equals("login")){
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}else if(accountStatus.equals("backLogin")){
					response.sendRedirect("/Go1Shop/backLogin.jsp");
					//request.getRequestDispatcher().forward(request, response);
				}
				
			}
			
			return;
		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
