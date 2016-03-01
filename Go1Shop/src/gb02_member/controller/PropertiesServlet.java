package gb02_member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import g01_login.controller.MemberBean;
import g01_login.model.MemberDAO;
import gb01_login.controller.AdminBean;
import gb01_login.model.AdminDAO;

@WebServlet(urlPatterns = "/Admin/Properties.controller")
public class PropertiesServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String Admin = (String) session.getAttribute("mail");
		int cheakAdmin = 1;
		AdminDAO adminDAO;
		AdminBean adBean;
		try {
			adminDAO = new AdminDAO();
			adBean = adminDAO.selectById(Admin);
			if (adBean == null) {
				cheakAdmin = 0;
			}
		} catch (Exception e) {
			cheakAdmin = 0;
		}

		if (cheakAdmin == 0) {
			request.getRequestDispatcher("/g01_login/Login.jsp").forward(request,
					response);
		} else {
			String pageStatus = request.getParameter("pageStatus");
			if ("prompt".equals(pageStatus)) {
				this.prompt(request, response);
			} else {
				String changeMail = request.getParameter("changeMail");

				String mail = request.getParameter("mail").trim();
				String name = request.getParameter("mem_name").trim();
				String nickName = request.getParameter("nickName").trim();
				String gender = request.getParameter("gender").trim();
				String status = request.getParameter("status").trim();

				MemberBean bean = new MemberBean();
				bean.setMail(mail);
				bean.setMem_name(name);
				bean.setNickName(nickName);
				bean.setGender(gender);
				bean.setStatus(status);
				if ("change".equals(pageStatus)) {
					this.change(changeMail);
				}
				this.query(bean, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

	@SuppressWarnings("unchecked")
	private void query(MemberBean bean, HttpServletResponse response)
			throws IOException {
		List<MemberBean> results;
		String returnMessage;
		int returnStatus;
		JSONObject returnJSON = new JSONObject();
		JSONArray JSONResults = new JSONArray();
		try {
			MemberDAO memberDAO = new MemberDAO();
			if (StringUtils.isEmpty(bean.getMail())
					&& StringUtils.isEmpty(bean.getMem_name())
					&& StringUtils.isEmpty(bean.getNickName())
					&& StringUtils.isEmpty(bean.getGender())
					&& StringUtils.isEmpty(bean.getStatus())) {
				results = memberDAO.selectAll();
			} else {
				results = memberDAO.getByProperty(bean);
			}
			if (results.isEmpty()) {
				returnMessage = "查無此資料";
			} else {
				for (MemberBean result : results) {
					JSONObject json = new JSONObject();
					json.put("mail", result.getMail().toString());
					json.put("name", result.getMem_name().toString());
					json.put("nickName",result.getNickName().toString());
					json.put("gender", result.getGender().toString());
					json.put("status", result.getStatus().toString());
					JSONResults.add(json);
				}
				returnMessage = "查詢成功";
			}
			returnStatus = 0;
		} catch (Exception e) {
			returnMessage = e.getMessage();
			e.printStackTrace();
			returnStatus = -1;
		}
		returnJSON.put("result", JSONResults);
		returnJSON.put("returnMessage", returnMessage);
		returnJSON.put("returnStatus", returnStatus);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(returnJSON.toString());
	}

	private void change(String changeMail) {
		try {
			MemberDAO memberDAO = new MemberDAO();
			MemberBean bean = memberDAO.selectId(changeMail);
			if (bean.getStatus().equals("S")) {
				bean.setStatus("N");
			} else {
				bean.setStatus("S");
			}
			memberDAO.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void prompt(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/gb01_login/Properties.jsp").forward(
				request, response);
	}
}
