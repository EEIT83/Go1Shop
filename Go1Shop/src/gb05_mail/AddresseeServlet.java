package gb05_mail;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/mail.do"})
public class AddresseeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//receive data
		String addressee = req.getParameter("addressee");
		//System.out.println(addressee);
		
		//transform data
		//validate data
		//call model
		MailDAO mdao = new MailDAO();
		List<MailVO> list = mdao.select(addressee);
		//System.out.println(list);
		
		HttpSession session = req.getSession();
		session.setAttribute("mails", list);
		session.setAttribute("validate", "ok");
		
		//show view
		String contextPath = getServletContext().getContextPath();
		String location = "/gb05_mail/mail.jsp";
		resp.sendRedirect(contextPath + location);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
	
}
