package g05_customer.checkout.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(
		urlPatterns={"/g05_customer/ProdOrderHis.do"}
		)
public class ProdOrderHisServlet extends HttpServlet {
	private CheckDetailService service = new CheckDetailService();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("memId").trim();
		List<ProdOrderBean> list = service.selectOrdHis(Integer.parseInt(memId));
		request.setAttribute("order", list);
		request.getRequestDispatcher("/g03_product/showHisOrd.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
	
}
