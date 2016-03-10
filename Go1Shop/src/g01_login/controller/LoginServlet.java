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

import g03_product.model.StoreService_M;
import g03_product.model.StoreVO_M;
import gb01_login.controller.AdminBean;
import gb01_login.controller.AdminService;

@WebServlet(urlPatterns = { "/Account/Login.controller" })
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8;");
		session = request.getSession();
		accountStatus = request.getParameter("accountStatus");

		if (StringUtils.isEmpty(accountStatus)) {
			request.getRequestDispatcher("/g01_login/Login.jsp").forward(
					request, response);
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
				if (accountStatus.equals("login")) {
					request.getRequestDispatcher("/g01_login/Login.jsp")
							.forward(request, response);
				}
				if (accountStatus.equals("backLogin")) {
					response.sendRedirect("/Go1Shop/backLogin.jsp");
					// request.getRequestDispatcher("/backLogin.jsp").forward(request,
					// response);
					return;
				}
			}
			try {
				MemberService memService = new MemberService();
				AdminService adService = new AdminService();

				StoreService_M storeSrv = new StoreService_M();
				
				if (memService.Login(mail, pwd) != null && accountStatus.equals("login")) {					
					memBean = memService.Login(mail, pwd);					
					StoreVO_M storeVO = storeSrv.getOneByMemId(memBean.getMem_id());
					session.setAttribute("StoreVO", storeVO);

					session.setAttribute("LoginOK", memBean);
					session.setAttribute("mail", memBean.getMail());

					response.getWriter()
							.write("<script>charset='UTF-8'; alert('Success!');parent.window.location.replace('/Go1Shop/index.jsp');</script>");
				} else if (adService.Login(mail, pwd) != null
						&& accountStatus.equals("backLogin")) {

					adBean = adService.Login(mail, pwd);
					session.setAttribute("bLoginOK", adBean);
					session.setAttribute("mail", adBean.getAd_mail());
					response.sendRedirect("/Go1Shop/gb04_marketing/backMarketing.jsp");

					// response.sendRedirect("/Go1Shop/backLogin.jsp");
					// request.getRequestDispatcher("/backLogin.jsp").forward(request,
					// response);
					return;
				} else {
					throw new Exception("1");
				}
			} catch (Exception e) {
				e.printStackTrace();
				if (accountStatus.equals("login")) {
					if ("1".equals(e.getMessage())) {
						response.getWriter()
								.write("<script>alert('無此帳號密碼!'); parent.window.location.replace('/Go1Shop/index.jsp');</script>");
						return;
					}
					if ("2".equals(e.getMessage())) {
						response.getWriter()
								.write("<script>alert('你已被停權!');parent.window.location.replace('/Go1Shop/index.jsp');</script>");
						return;
					}
				} else if (accountStatus.equals("backLogin")) {
					response.sendRedirect("/Go1Shop/backLogin.jsp");
					// request.getRequestDispatcher().forward(request,
					// response);
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
