package gb05_mail;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import g01_login.controller.MemberBean;
@WebServlet(
		urlPatterns={"/MailStatus.do"}
		)
public class MailStatus extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberBean mb = (MemberBean)req.getSession().getAttribute("LoginOK");
		MailDAO mdao = new MailDAO();
		List<MailVO> list = mdao.select(mb.getMail());
		int Status=0;
		for(MailVO a:list){
			if(a.getStatus()==0){
				Status=1;
				
			}
		}
		
		if(Status==1){
			req.getSession().setAttribute("status", Status);
		}else{
			req.getSession().removeAttribute("status");
		}
		Gson gson = new Gson();
		resp.getWriter().write(gson.toJson("1"));
		
		
//		String contextPath = getServletContext().getContextPath();
//		String location = "/gb05_mail/mail.jsp";
//		resp.sendRedirect(contextPath + location);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
	
}
