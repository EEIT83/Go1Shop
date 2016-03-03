package gb02_member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gb01_login.controller.AdminService;

@WebServlet(urlPatterns = "/Admin/ChangePwd.controller")
public class ChangeAdPwdServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7882234995784010949L;
	private String pageName = "/g02_member/admin/ChangeAdPwd.jsp";
	private String pageStatus = null;
	private int returnStatus = 0;
	private String returnMessage = "";

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
				this.prompt();
			} else if ("Ad_available".equals(pageStatus)) {

				String mail = request.getSession().getAttribute("mail")
						.toString();
				String oldPwd = request.getParameter("oldPwd");
				String newPwd = request.getParameter("newPwd");

				this.available(mail, oldPwd, newPwd);
			} else {
				pageName = "/g01_login/Login.jsp";
			}
			request.setAttribute("pageStatus", "available");
		} catch (Exception e) {
			e.printStackTrace();
			returnMessage = e.getMessage();
		}
		request.setAttribute("status", returnStatus);
		request.setAttribute("message", returnMessage);
		request.getRequestDispatcher(pageName).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

	private void prompt() throws Exception {
		returnStatus = 0;
	}

	private void available(String mail, String oldPwd, String newPwd)
			throws Exception {
		try {
			new AdminService().ChangePwd(mail, oldPwd, newPwd);
			returnStatus = 0;
			returnMessage = "Success to changed password!";
		} catch (Exception e) {
			returnStatus = -1;
			returnMessage = e.getMessage();
		}
	}
}
