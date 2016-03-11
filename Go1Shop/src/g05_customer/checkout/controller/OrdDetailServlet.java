package g05_customer.checkout.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value={"/OrdDetail.do"})
public class OrdDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CheckDetailService cds = new CheckDetailService();
		String memId = req.getParameter("memId").trim();
		String ordId = req.getParameter("ordId").trim();
		List<OrdDetailBean> list = cds.selectOrdDetailHis(Integer.parseInt(memId),Integer.parseInt(ordId));
		req.setAttribute("detail", list);
		req.getRequestDispatcher("/g03_product/showHisOrdDte.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
	
}
