package g02_member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g01_login.controller.MemberService;
import gb01_login.controller.AdminService;

@WebServlet(urlPatterns = "/Account/ChangePwd.controller")
public class ChangeMemPwdServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7882234995784010949L;
	private String pageStatus = null;

	@Override
	public void init() throws ServletException {
		super.init();

	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {

			pageStatus = request.getParameter("pageStatus");

			if ("prompt".equals(pageStatus)) {
				//this.prompt();
				request.getRequestDispatcher("/g02_member/ChangeMemPwd.jsp").forward(request, response);
			} else if ("available".equals(pageStatus)) {

				String mail = request.getSession().getAttribute("mail")
						.toString();
				String oldPwd = request.getParameter("oldPwd");
				String newPwd = request.getParameter("newPwd");
				
				new MemberService().ChangePwd(mail, oldPwd, newPwd);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("<script>charset='UTF-8'; alert('Success!');parent.window.location.replace('/Go1Shop/index.jsp');</script>");
				//this.available(mail, oldPwd, newPwd);
			} else {
				request.getRequestDispatcher("/g01_login/Login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage().toString());
			request.setAttribute("message",e.getMessage());
			request.getRequestDispatcher("/g02_member/ChangeMemPwd.jsp").forward(request, response);
		}
//		request.setAttribute("status", returnStatus);
//		request.setAttribute("message", returnMessage);
//		request.getRequestDispatcher(pageName).forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

//	private void prompt() throws Exception {
//		returnStatus = 0;
//	}
//
	private void available(String mail, String oldPwd, String newPwd) throws Exception {
//		try {
			MemberService memberService = new MemberService();
			memberService.ChangePwd(mail, oldPwd, newPwd);
//			returnStatus = 0;
//			returnMessage = "Success to changed password!";
//		} catch (Exception e) {
//			returnStatus = -1;
//			returnMessage = e.getMessage();
//		}
	}
}
