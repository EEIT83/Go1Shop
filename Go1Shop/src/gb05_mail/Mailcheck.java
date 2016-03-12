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
		urlPatterns={"/ch07_mail/Mailcheck.do"}
		)
public class Mailcheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String  mailId = req.getParameter("mailId");
		MailDAO mdao = new MailDAO();
		mdao.updata(Integer.parseInt(mailId));
		MemberBean mb = (MemberBean)req.getSession().getAttribute("LoginOK");
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
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
