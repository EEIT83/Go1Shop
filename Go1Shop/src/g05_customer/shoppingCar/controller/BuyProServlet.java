package g05_customer.shoppingCar.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import g01_login.controller.MemberBean;

@WebServlet(urlPatterns = { "/g05_customer/shoppingCar/controller/BuyProServlet.con" })
public class BuyProServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse respone)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String product = request.getParameter("product");
		String brand = request.getParameter("brand");
		String price = request.getParameter("price");
		String count = request.getParameter("count");

		// System.out.println("id=" +id +"product=" + product + "price="+price
		// +"count="+count);
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		// System.out.println(mb);
		if (mb == null) {

			respone.sendRedirect(getServletContext().getContextPath() + "/g01_login/Login.jsp");
			// request.getRequestDispatcher("/_01_login/login.jsp").forward(request,
			// respone);
			return;
		}
		BuyProService service = new BuyProService();
		ShoppingCar car = (ShoppingCar) session.getAttribute("shopcar");
		if (car == null) {
			service.deleteCar(mb.getMem_id());
			car = new ShoppingCar();
			session.setAttribute("shopcar", car);
		}
		Map<String, String> error = new HashMap<>();
		request.setAttribute("error", error);
		ProductBean proBean = service.findPro(Integer.parseInt(id));
		if (Integer.parseInt(count) > proBean.getCount()) {
			error.put("count", "數量不足");
			request.getRequestDispatcher("/g05_customer/ShowProServlet.con?prod_id=2").forward(request,
					respone);
//			request.getRequestDispatcher("/g05_customer/ShowProServlet.con?prod_id=").forward(request,
//					respone);
			return;
		}

		ShoppingCarBean carBean = new ShoppingCarBean();
		MemberBean memBean = new MemberBean();
		memBean = (MemberBean) session.getAttribute("LoginOK");
		// int pk = 0;
		if (car.getCar().get(id) == null) {

			CarDetailBean carDetail = new CarDetailBean();
			// carDetail.setShoppingcart_Id(pk);
			carDetail.setMem_Id(memBean.getMem_id());
			carDetail.setSeller_Id(proBean.getMemId());
			carDetail.setProd_Id(proBean.getProdId());
			carDetail.setProd_Name(proBean.getProductName());
			carDetail.setOrd_Date(new java.util.Date());
			carDetail.setPrice(proBean.getPrice());
			carDetail.setCount(1);
			carDetail.setSubtotal(proBean.getPrice() * Integer.parseInt(count));
			carDetail.setShip("");
			carDetail.setOrd_Point(0);

			if (proBean != null) {

				carBean.setMem_Id(memBean.getMem_id());
				carBean.setOrd_Date(new java.util.Date());
				carBean.setTotal(proBean.getPrice() * Integer.parseInt(count));
				service.insertShopCar(carBean, car, carDetail, id);
			}

		} else {
			error.put("exist", "已加入購物車");
		}
		request.getRequestDispatcher("/g05_customer/ShowProServlet.con?prod_id=2").forward(request,
				respone);
//		request.getRequestDispatcher("/g05_customer/ShowProServlet.con?prod_id=").forward(request,
//				respone);
	}

}
