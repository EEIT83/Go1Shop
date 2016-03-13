package gb05_mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
@WebServlet(
		urlPatterns={"/ch07_mail/Mailcheck.do"}
		)
public class Mailcheck extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String  mailId = req.getParameter("mailId");
		MailDAO mdao = new MailDAO();
		mdao.updata(Integer.parseInt(mailId));
		Gson gson = new Gson();
		resp.getWriter().write(gson.toJson("1"));
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
