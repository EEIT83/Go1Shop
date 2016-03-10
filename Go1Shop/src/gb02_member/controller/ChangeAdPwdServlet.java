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

	private static final long serialVersionUID = -7882234995784010949L;
	private String pageName = "/gb02_member/ChangeAdPwd.jsp";
	private String pageStatus = null;
	private String returnMessage = "";

	@Override
	public void init() throws ServletException {
		super.init();

	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println(7777);
		
		request.setCharacterEncoding("UTF-8");
		try {

			pageStatus = request.getParameter("pageStatus");
			if ("prompt".equals(pageStatus)) {
			} else if ("Ad_available".equals(pageStatus)) {

				String mail = request.getSession().getAttribute("bmail")
						.toString();
				String oldPwd = request.getParameter("oldPwd");
				String newPwd = request.getParameter("newPwd");
				
				this.available(mail, oldPwd, newPwd);
				response.getWriter().write("<script>charset='UTF-8'; alert('修改成功!');parent.window.location.replace('/Go1Shop/index.jsp');</script>");
			} else {
				pageName = "/g01_login/Login.jsp";
			}		
			request.getRequestDispatcher(pageName).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			if("2".equals(returnMessage)){
				response.getWriter().write("<script>charset='UTF-8'; alert('舊密碼錯誤!');parent.window.location.replace('/gb02_member/ChangeAdPwd.jsp');</script>");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

	private void available(String mail, String oldPwd, String newPwd)
			throws Exception {
		try {
			new AdminService().ChangePwd(mail, oldPwd, newPwd);
		} catch (Exception e) {
			returnMessage = e.getMessage();
		}
	}
}
