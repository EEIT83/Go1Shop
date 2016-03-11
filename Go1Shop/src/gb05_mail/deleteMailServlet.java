package gb05_mail;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value={"/gb05_mail/deleteMail.do"})
public class deleteMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String ids = req.getParameter("id");
		String mail = req.getParameter("mail");
		
		List<Integer> prodIds = new ArrayList<Integer>() ;
		if (ids != null) {
			String[] idsArray = ids.split("-");
			for (String id : idsArray) {
				Integer i = Integer.parseInt(id);
				System.out.println(i);
				prodIds.add(i);
			}
		}
		
		//ProductService srv = new ProductService();
		MailDAO mdao = new MailDAO();
		/************************deleteAll*********************/

			for (Integer integer : prodIds) {
				try {
					Integer prodId = integer;
					//srv.delete(prodId); 
					mdao.delete(prodId);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			/*
			Integer memId = null;
			try {
				memId = new Integer(req.getParameter("memId"));
			} catch (NumberFormatException e) {
				memId = 0;
			}
			
			List<ProductVO> list = srv.getOneByMemId(memId); 
			req.setAttribute("productVOList", list);
			String url = "/ProductServlet?memId=1&action=getOneByMemId";
			
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
			*/
			
			/************************selectMails*********************/

			List<MailVO> list = mdao.select(mail);
			//System.out.println(list);
			
			HttpSession session = req.getSession();
			session.setAttribute("mails", list);
			
			
			
			/************************showView*********************/

			String location = "/Go1Shop/gb05_mail/mail.jsp";
			resp.sendRedirect(location);
			
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
}
