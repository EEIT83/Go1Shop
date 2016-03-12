package gb02_member.controller;

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
import gb01_login.model.AdminDAO;

@WebServlet(
		urlPatterns = { "/Admin/Register.controller" })
public class AdminRegisterServlet extends HttpServlet {
	private int returnStatus=0;
	private String returnMessage;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageStatus = request.getParameter("pageStatus");
		HttpSession session = request.getSession();
		try {
			AdminDAO adminDAO = new AdminDAO();
			if ((adminDAO.selectById((String) session.getAttribute("mail")).getCompetence()) == 1) {
				if ("insert".equals(pageStatus)) {
					String ad_mail = request.getParameter("ad_mail").trim();
					if (StringUtils.isNotEmpty(ad_mail)) {
						AdminBean bean = new AdminBean();
						bean.setAd_mail(ad_mail);
						bean.setAd_pwd(ad_mail);
						bean.setCompetence(2);
						adminDAO.insert(bean);
						//returnMessage = "新增成功";
					} else {
						StringBuilder sbBuilder = new StringBuilder("請輸入");
						if (StringUtils.isEmpty(ad_mail)) {
							sbBuilder.append(" Mail");
						}
						if (sbBuilder.length() > 0) {
							throw new Exception(sbBuilder.toString());
						}
					}
					returnStatus=1;
				}
			} else {
				response.sendRedirect("/account/Login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			returnStatus = -1;
			returnMessage = e.getMessage();
		}
		request.setAttribute("returnStatus", returnStatus);
		request.setAttribute("returnMessage", returnMessage);
		
		//jump Success!
		response.getWriter().write(
				"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '新增成功!',  type: 'success', confirmButtonClass: 'btn-primary', confirmButtonText: '確定',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {window.location.replace('/Go1Shop/gb02_member/Register.jsp'); } });})}</script>");

		
		//request.getRequestDispatcher("/gb02_member/Register.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
