package g03_product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g03_product.model.ProductProject1Bean;

@WebServlet(
		urlPatterns={"/g03_product/ProductGenderServlet.controller"}
)
public class ProductGenderServlet extends HttpServlet {
	
	private g03_product.model.ProductServiceProject1 productService = new g03_product.model.ProductServiceProject1();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("執行GenderServlet");
		
//接收資料

		String prod_name = request.getParameter("prod_name");//取得jsp欄位資料		
		String prodaction = request.getParameter("prodaction");
		String selectorder = request.getParameter("selectorder");		
		String highprice = request.getParameter("highprice");
		String lowprice = request.getParameter("lowprice");
		
		String gender=request.getParameter("gender");

//呼叫model(DAO)
		
		ProductProject1Bean bean = new ProductProject1Bean();	
		bean.setProd_name(prod_name);
		bean.setGender(gender);		
		String SQLgender=" and gender = '"+gender+"'";
		//String SQLgender=" and gender = 'M' " ;//固定查詢男裝產品
		String SQLorder="";
		String SQLprice="" ;
		String x="";
		
//根據model執行結果顯示view
		
		List<ProductProject1Bean> result;
		
		if("Select".equals(prodaction)) {			
			//price range
			if ((lowprice.length() != 0 && highprice.length() != 0)) {
				SQLprice = " and price between " + lowprice + " and " + highprice;
			} else if (highprice.trim().length() != 0) {
				SQLprice = " and price < " + highprice;
			} else if (lowprice.trim().length() != 0) {
				SQLprice = " and price > " + lowprice;
			}
			//order by date/price
			if(selectorder!=null){
				if(selectorder.equals("OrderByPrice"))
					SQLorder=" order by price ";
				if(selectorder.equals("OrderByPriceDesc"))
					SQLorder=" order by price desc ";
				if(selectorder.equals("OrderByDate"))
					SQLorder=" order by launch_date ";
				if(selectorder.equals("OrderByDateDesc"))
					SQLorder=" order by launch_date desc ";
			}
			result = productService.select(bean,SQLprice,SQLorder,SQLgender);//把SQL傳入select做查詢
			request.setAttribute("select", result);
			
			if(gender.equals("M")){
			request.getRequestDispatcher(
					"/pages/selectmen.jsp").forward(request, response);
			}
			if(gender.equals("F"))
			request.getRequestDispatcher(
					"/pages/selectwomen.jsp").forward(request, response);
		} 
		
		
//		if(gender!=null) {			
//			result = productService.selectAll(bean, x);			   
//			request.setAttribute("select", result);		
//			request.getRequestDispatcher(
//					"/pages/selectmen.jsp").forward(request, response);
//		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
