package gb05_mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/ch07_mail/send.do"})
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//receive data
		String id = "1";
		String sender = req.getParameter("sender");
		String addressee = req.getParameter("addressee");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//System.out.println(id+sender+addressee+title+content);
		
		//transform data
		int Id = Integer.parseInt(id);
		
		//validate data
		
		
		//call model
		MailDAO mdao = new MailDAO();
		int i = mdao.insert(Id, sender, addressee, title, content);
		//System.out.println(i);
		
		//show view
		String location = "/GoEshop/ch07_mail/sendSuccess.jsp";
		resp.sendRedirect(location);
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
}
