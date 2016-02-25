package g02_member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import g01_login.controller.MemberBean;
import g01_login.model.MemberDAO;

@WebServlet(urlPatterns = "/Account/Modify.controller")
public class ModifyServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1154239817005658436L;

	private MemberDAO dao;
	private MemberBean bean = new MemberBean();
	private String pageStatus = null;

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
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("mail");
		pageStatus = request.getParameter("pageStatus");
		try {
			if (StringUtils.isNotEmpty(mail) && mail != null) {
				if ("save".equals(pageStatus)) {
					bean.setMail(request.getParameter("mail"));
					bean.setMem_name(request.getParameter("mem_name"));
					bean.setGender(request.getParameter("gender"));
					bean.setBdate(Date.valueOf(request.getParameter("bdate")));
					dao.update(bean);
				} else {
					bean = dao.selectId(mail);
				}
				request.setAttribute("account", bean);
				request.getRequestDispatcher("/g02_member/Modify.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/g01_login/Login.jsp").forward(request,
						response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("exception", e.getMessage());
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
