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

import gb01_login.controller.AdminBean;
import gb01_login.model.AdminDAO;

@WebServlet(urlPatterns = "/Admin/SelectAdmin.controller")
public class SelectAdminServlet extends HttpServlet {
	private AdminBean adBean=new AdminBean();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String Admin = (String) session.getAttribute("mail");
		int cheakAdmin = 1;
		AdminDAO adminDAO;
		try {
			adminDAO = new AdminDAO();
			if ((adminDAO.selectById(Admin)) == null && adminDAO.selectById(Admin).getCompetence() != 1) {
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
				String deleteMail = request.getParameter("deleteMail");
				String mail = request.getParameter("ad_mail").trim();
				if (pageStatus.equals("delete")) {
					this.delete(deleteMail);
				}
				this.query(mail, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

	@SuppressWarnings("unchecked")
	private void query(String mail, HttpServletResponse response)
			throws IOException {
		List<AdminBean> results=null;
		String returnMessage="查詢成功";
		int returnStatus;
		JSONObject returnJSON = new JSONObject();
		JSONArray JSONResults = new JSONArray();
		try {
			AdminDAO adminDAO = new AdminDAO();
			if (StringUtils.isEmpty(mail)) {
				results = adminDAO.selectAll();
				if (results==null || results.isEmpty()) {
					returnMessage = "查無資料";
				}else {
					for (AdminBean result : results) {
						JSONObject json = new JSONObject();
						json.put("mail", result.getAd_mail().toString());
						JSONResults.add(json);
					}
				}
			} else {
				adBean = adminDAO.selectById(mail);
				if(adBean==null){
					returnMessage = "查無資料";
				}else{
					JSONObject json = new JSONObject();
					json.put("mail", adBean.getAd_mail().toString());
					JSONResults.add(json);
				}
			}
			returnStatus = 0;
		} catch (Exception e) {
			e.printStackTrace();
			returnMessage = e.getMessage();
			returnStatus = -1;
		}
		returnJSON.put("result", JSONResults);
		returnJSON.put("returnMessage", returnMessage);
		returnJSON.put("returnStatus", returnStatus);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(returnJSON.toString());
	}

	private void delete(String deleteMail) {
		try {
			AdminDAO adminDAO = new AdminDAO();
			adminDAO.delete(deleteMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void prompt(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/gb02_member/SelectAdmin.jsp").forward(
				request, response);
	}
}
