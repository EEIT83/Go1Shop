package g01_login.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g01_login.controller.MemberBean;
import g01_login.model.MemberDAO;

@WebServlet(urlPatterns = "/Account/Register.controller")
public class RegisterServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1154239817005658436L;

	private MemberDAO dao;
	private MemberBean bean = new MemberBean();
	private String pageStatus = null;
	private int returnStatus;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			dao = new MemberDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		pageStatus = request.getParameter("pageStatus");
		try {
			if ("register".equals(pageStatus)) {
				request.getRequestDispatcher("/gb01_login/Register.jsp").forward(request, response);
			} else if ("save".equals(pageStatus)) {
				bean.setMail(request.getParameter("mail"));
				bean.setPwd(request.getParameter("pwd"));
				bean.setMem_name(request.getParameter("mem_name"));
				bean.setGender(request.getParameter("gender"));
				bean.setBdate(Date.valueOf(request.getParameter("bdate")));
				dao.insert(bean);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("<script>charset='UTF-8'; alert('Success!'); location.href='/Go1Shop/g01_login/Login.jsp';</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("exception", e.getMessage());
			// request.getRequestDispatcher("/account/Register.jsp").forward(request,
			// response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}


}
