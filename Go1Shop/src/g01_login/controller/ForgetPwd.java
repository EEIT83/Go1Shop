package g01_login.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g01_login.model.MemberDAO;

@WebServlet(urlPatterns = { "/Account/ForgetPwd.controller" })
public class ForgetPwd extends HttpServlet {
	private MemberBean bean;
	private Email Email = new Email();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String mail = request.getParameter("mail");
		System.out.println(mail);
		try {
			MemberDAO memberDAO = new MemberDAO();
			bean = memberDAO.selectId(mail);
			if (bean != null) {
				String random =  this.random();
				Email.sendEmail(mail, "你的新密碼", "登入後馬上更改密碼  你的密碼為"+random);
				bean.setPwd(random);
				memberDAO.update(bean);
				response.getWriter().write(
						"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '請去信箱查看密碼!',  type: 'success', confirmButtonClass: 'btn-primary', confirmButtonText: '確定!',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {parent.window.location.replace('/Go1Shop/index.jsp'); } });})}</script>");
			} else {
				response.getWriter().write(
						"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '無此帳號!',  type: 'error', confirmButtonClass: 'btn-primary', confirmButtonText: '確定!',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {parent.window.location.replace('/Go1Shop/index.jsp'); } });})}</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String random(){
		  
		  Random r = new Random();
		  
		  int i = r.nextInt(10000);
		  int upCase = r.nextInt(26)+65;//得到65-90的隨機數
		  int upCase2 = r.nextInt(26)+65;//得到65-90的隨機數
		  String up =String.valueOf((char)upCase);//得到A-Z
		  String up2 =String.valueOf((char)upCase2);//得到A-Z 

		  return up+""+up2+""+i;
		 }

}
