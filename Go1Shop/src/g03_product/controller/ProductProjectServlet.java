package g03_product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g03_product.model.ProductProject1Bean;
import g03_product.model.ProductServiceProject1;

@WebServlet(
		urlPatterns={"/g03_product/productproject.controller"}
)
public class ProductProjectServlet extends HttpServlet {
	
	private ProductServiceProject1 productService = new ProductServiceProject1();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("有抓到servlet");
		
//接收資料

		String prod_name = request.getParameter("prod_name");//取得jsp欄位資料
		String gender = request.getParameter("gender");
		String prodaction = request.getParameter("prodaction");
		String selectorder = request.getParameter("selectorder");		
		String highprice = request.getParameter("highprice");
		String lowprice = request.getParameter("lowprice");
		
//轉換資料
//		Map<String, String> error = new HashMap<String, String>();
//		request.setAttribute("error", error);
//
//		int id = 0;
//		if(temp1!=null && temp1.length()!=0) {
//			try {
//				id = Integer.parseInt(temp1);
//			} catch (NumberFormatException e) {
//				e.printStackTrace();
//				error.put("id", "Id must be an integer");
//			}
//		}
//		double price = 0;
//		if(temp2!=null && temp2.length()!=0) {
//			try {
//				price = Double.parseDouble(temp2);
//			} catch (NumberFormatException e) {
//				e.printStackTrace();
//				error.put("price", "Price must be a number");
//			}
//		}
//		java.util.Date make = null;
//		if(temp3!=null && temp3.length()!=0) {
//			try {
//				make = sFormat.parse(temp3);
//			} catch (ParseException e) {
//				e.printStackTrace();
//				error.put("make", "Make must be a Date with yyyy-MM-dd");
//			}
//		}
//		int expire = 0;
//		if(temp4!=null && temp4.length()!=0) {
//			try {
//				expire = Integer.parseInt(temp4);
//			} catch (NumberFormatException e) {
//				e.printStackTrace();
//				error.put("expire", "Expire must be an integer");
//			}
//		}
		
//驗證資料
//		if("Insert".equals(prodaction) || "Update".equals(prodaction) || "Delete".equals(prodaction)) {
//			if(id==0) {
//				error.put("id", "Please enter Id for "+prodaction);
//			}
//		}
//		if(error!=null && !error.isEmpty()){
//			request.getRequestDispatcher(
//					"/pages/product.jsp").forward(request, response);
//			return;
//		}

		//呼叫model(DAO)
		
		ProductProject1Bean bean = new ProductProject1Bean();	
		bean.setProd_name(prod_name);
		bean.setGender(gender);
		
		String SQLorder="";
		String SQLprice="" ;
		String SQLgender="" ;
		String x="";
		
		
	
		System.out.println("lowprice="+lowprice);
		System.out.println("highprice="+highprice);
		//System.out.println(lowprice.trim().length() != 0);
		//and price 範圍		
//			if ((lowprice.length() != 0 && highprice.length() != 0)) {
//				SQLprice = " and price between " + lowprice + " and " + highprice;
//			} else if (highprice.trim().length() != 0) {
//				SQLprice = " and price < " + highprice;
//			} else if (lowprice.trim().length() != 0) {
//				SQLprice = " and price > " + lowprice;
//			}	
//		
		
		
		System.out.println("SQLprice="+SQLprice);
		
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
			//order by xxx
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
			request.getRequestDispatcher(
					"/g03_product/productproject.jsp").forward(request, response);
		} 
		
		
		System.out.println("gender: "+gender);
		
	
		if(gender!=null) {			
			result = productService.selectAll(bean, x);			   
			request.setAttribute("select", result);		
			request.getRequestDispatcher(
					"/g03_product/productproject.jsp").forward(request, response);
     
//		} else if("Update".equals(prodaction)) {
//			ProductBean result = productService.update(bean);
//			if(result==null) {
//				error.put("action", "Update failed");
//			} else {
//				request.setAttribute("update", result);
//			}
//			request.getRequestDispatcher(
//					"/pages/product.jsp").forward(request, response);
//		} else if("Delete".equals(prodaction)) {
//			boolean result = productService.delete(bean);
//			if(result) {
//				request.setAttribute("delete", result);
//			} else {
//				error.put("action", "Delete failed");
//			}
//			request.getRequestDispatcher(
//					"/pages/product.jsp").forward(request, response);
//		} else {
//			error.put("action", "Unknown action: "+prodaction);
//			request.getRequestDispatcher(
//					"/pages/product.jsp").forward(request, response);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
