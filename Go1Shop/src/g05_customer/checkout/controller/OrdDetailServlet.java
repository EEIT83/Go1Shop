package g05_customer.checkout.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g03_product.model.StoreVO_M;

@WebServlet(value={"/OrdDetail.do"})
public class OrdDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CheckDetailService cds = new CheckDetailService();
		String addressee = req.getParameter("addressee").trim();
		String sender = req.getParameter("sender").trim();
		String total = req.getParameter("total").trim();
		String memId = req.getParameter("memId").trim();
		String ordId = req.getParameter("ordId").trim();
		ProdOrderBean bean = new ProdOrderBean();
		bean.setOrd_id(Integer.parseInt(ordId));
		
		List<OrdDetailBean> list = cds.selectOrdDetailHis(Integer.parseInt(memId),bean);
		
		List<StoreVO_M> listStor = new ArrayList<>();
		for(OrdDetailBean a:list){
			System.out.println(a.getProd_id());
			listStor.add((cds.selectMem_id(a.getProd_id())));
			
		}
		
		req.setAttribute("detail", list);
		req.setAttribute("addressee", addressee);
		req.setAttribute("sender", sender);
		req.setAttribute("total", total);
		req.setAttribute("listStor",listStor);
		req.getRequestDispatcher("/g03_product/showHisOrdDte.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
	
}
