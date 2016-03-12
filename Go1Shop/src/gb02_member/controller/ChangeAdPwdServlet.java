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
				System.out.println("Start");
			} else if ("Ad_available".equals(pageStatus)) {

				String mail = request.getSession().getAttribute("bmail")
						.toString();
				String oldPwd = request.getParameter("oldPwd");
				String newPwd = request.getParameter("newPwd");
				new AdminService().ChangePwd(mail, oldPwd, newPwd);
				
				//response.getWriter().write("<script>charset='UTF-8'; alert('修改成功!');location.href('/gb02_member/ChangeAdPwd.jsp');</script>");
				
				response.getWriter().write(
						"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '修改成功!',  type: 'success', confirmButtonClass: 'btn-primary', confirmButtonText: '確定',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {window.location.replace('/Go1Shop/gb02_member/ChangeAdPwd.jsp'); } });})}</script>");			
			} else {
				request.getRequestDispatcher("/g01_login/Login.jsp").forward(request, response);
			}		
		} catch (Exception e) {
			e.printStackTrace();
			if("2".equals(e.getMessage())){
				
				response.getWriter().write(
						"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '舊密碼錯誤!',  type: 'error', confirmButtonClass: 'btn-primary', confirmButtonText: '確定',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {window.location.replace('/Go1Shop/gb02_member/ChangeAdPwd.jsp'); } });})}</script>");			
		
				
				//response.getWriter().write("<script>charset='UTF-8'; alert('舊密碼錯誤!');parent.window.location.replace('/Go1Shop/gb02_member/ChangeAdPwd.jsp');</script>");
			
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

	
}
