package gb05_mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g01_login.controller.MemberBean;
import g01_login.model.MemberDAO;

@WebServlet(urlPatterns={"/ch07_mail/send.do"})
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//receive data
//		String id = "1";
//		String sender = req.getParameter("sender");
		String addressee = req.getParameter("addressee");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//System.out.println(id+sender+addressee+title+content);
		
		//transform data
//		int Id = Integer.parseInt(id);
		
		//validate data
		
		
		//call model
		MemberBean member = null;
		try {
			MemberDAO dao = new MemberDAO();
			member = dao.selectId(addressee);
			
			//System.out.println(member.getMail());
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		MailDAO mdao = new MailDAO();
		MemberBean mb = (MemberBean)req.getSession().getAttribute("LoginOK");
		
		//mdao.insert(mb.getMail(), "kkk" , title, content);
		mdao.insert(mb.getMail(),member.getMail() , title, content);
		
		//System.out.println(i);
		//show view
		//String location = "/GoEshop/gb05_mail/sendSuccess.jsp";
		resp.getWriter().write(
				"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '信件已成功寄出!',  type: 'success', confirmButtonClass: 'btn-primary', confirmButtonText: '確定',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {window.location.replace('/Go1Shop/gb05_mail/send.jsp'); } });})}</script>");

		//resp.sendRedirect(req.getContextPath()+"/gb05_mail/sendSuccess.jsp");
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
}
