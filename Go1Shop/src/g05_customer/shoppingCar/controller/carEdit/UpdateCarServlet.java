package g05_customer.shoppingCar.controller.carEdit;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import g05_customer.shoppingCar.controller.CarDetailBean;
import g05_customer.shoppingCar.controller.ShoppingCar;

//@WebServlet("/g05_customer/shoppingCar/controller/carEdit/UpdateCarServlet.do")
//public class UpdateCarServlet extends HttpServlet {
//
//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse respone)
//			throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//
//		String id = request.getParameter("id");
//		String status = request.getParameter("status");
//		HttpSession session = request.getSession();
//		ShoppingCar shopcar = (ShoppingCar) session.getAttribute("shopcar");
//		MemberBean mb = (MemberBean)session.getAttribute("LoginOK");
//		if(shopcar==null){
//			request.getRequestDispatcher("/g05_customer/shoppingCar/controller/BuyProServlet.con").forward(request, respone);
//			return;
//		}
//		Map<String , CarDetailBean> carMap = shopcar.getCar();
//		UpdateCarService service = new UpdateCarService();
//		if(status.equals("刪除")){
//			service.delete(carMap.get(id));
//			carMap.remove(id);
//		}
//		else if (status.equals("+")) {
//			CarDetailBean carBean = carMap.get(id);
//			int x = carMap.get(id).getCount();
//			carBean.setCount(x + 1);
//			carBean.setSubtotal(carBean.getPrice()*carBean.getCount());
//			
//			service.update(carBean);
//			
//		} else {
//			CarDetailBean carBean = carMap.get(id);
//			int x = carMap.get(id).getCount();
//			if(x==1){
//				Map<String , String> countError = new HashMap<>();
//				request.setAttribute("countError", countError);
//				countError.put("count", "請使用刪除按鈕");
//			}else{
//				carBean.setCount(x - 1);
//				carBean.setSubtotal(carBean.getPrice()*carBean.getCount());
//				service.update(carBean);
//			}
//		}
//		request.getRequestDispatcher("/g05_customer/shoppingCar/car.jsp").forward(
//				request, respone);
//
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//
//		doGet(req, resp);
//	}
//
//}
