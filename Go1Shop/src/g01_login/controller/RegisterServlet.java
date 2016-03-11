package g01_login.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	private Email Email = new Email();

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
		response.setCharacterEncoding("UTF-8");
		pageStatus = request.getParameter("pageStatus");
		try {
			if ("register".equals(pageStatus)) {
				request.getRequestDispatcher("/g01_login/Register.jsp").forward(request, response);
			} else if ("save".equals(pageStatus)) {
				bean.setMail(request.getParameter("mail"));
				bean.setPwd(request.getParameter("pwd"));
				bean.setMem_name(request.getParameter("mem_name"));
				bean.setNickName(request.getParameter("nickName"));
				bean.setGender(request.getParameter("gender"));
				bean.setBdate(Date.valueOf(request.getParameter("bdate")));
				dao.insert(bean);
				Email.sendEmail("eeit83eeit83@gmail.com", "註冊成功", "恭喜註冊成功");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(
						"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '註冊成功!',  type: 'success', confirmButtonClass: 'btn-primary', confirmButtonText: '確定!',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {parent.window.location.replace('/Go1Shop/index.jsp'); } });})}</script>");
				}
		} catch (Exception e) {
			e.printStackTrace();
			if("1".equals(e.getMessage())){
				response.getWriter().write(
						"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '註冊失敗!',  type: 'error', confirmButtonClass: 'btn-primary', confirmButtonText: '確定!',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {parent.window.location.replace('/Go1Shop/index.jsp'); } });})}</script>");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}


}
