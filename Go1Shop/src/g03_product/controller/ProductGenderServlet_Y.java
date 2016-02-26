package g03_product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import g03_product.model.ProductBean_Y;
import g03_product.model.ProductService_Y;

@WebServlet(urlPatterns = { "/g03_product/ProductGenderServlet.controller" })
public class ProductGenderServlet_Y extends HttpServlet {

	private ProductService_Y productService = new ProductService_Y();
	
	private String a= "T-Shirt";
	private String b= "Polo衫";
	private String c= "背心";
	private String d= "襯衫";
	private String e= "長袖上衣";
	private String f= "帽T";
	private String g= "毛衣";

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		System.out.println("執行GenderServlet");

		// 接收資料

		String prod_name = request.getParameter("prod_name");// 取得jsp欄位資料
		String prodaction = request.getParameter("prodaction");
		String selectorder = request.getParameter("selectorder");
		String highprice = request.getParameter("highprice");
		String lowprice = request.getParameter("lowprice");
		String gender = request.getParameter("gender");
		String part = request.getParameter("part");
		
		
		// 呼叫model(DAO)

		ProductBean_Y bean = new ProductBean_Y();
		bean.setProd_name(prod_name);		
		bean.setGender(gender);
		bean.setPart(part);

		String SQLorder = "";
		String SQLprice = "";
		String SQLgender = " and gender = '" + gender + "'";//收到gender資料後直接輸入(只要是男女jsp送來的固定會有)
		String SQLpart = "";

		// 根據model執行結果顯示view

		List<ProductBean_Y> result;//new一個接收回傳結果資料的
		
		//如果已經先選了部位 就直接針對部位做篩選排序
		String sessionpart = (String) session.getAttribute("PART");
		if (sessionpart != null) {SQLpart = " and part = '" + sessionpart + "'";}
		System.out.println("session=" + session.getAttribute("PART"));
		
		
		//搜尋功能，搜尋前先確認有無輸入價格範圍，part已經先存入session且新增到SQLpart
		if ("Select".equals(prodaction)) {
			//判斷是否有輸入價格範圍
			if ((lowprice.length() != 0 && highprice.length() != 0)) {
				SQLprice = " and price between " + lowprice + " and " + highprice;
			} else if (highprice.trim().length() != 0) {
				SQLprice = " and price < " + highprice;
			} else if (lowprice.trim().length() != 0) {
				SQLprice = " and price > " + lowprice;
			}
			
			session.setAttribute("sessionSQLprice", SQLprice);
			
			
			result = productService.select(bean, SQLprice, SQLorder, SQLgender, SQLpart);// 把SQL傳入select做查詢
			request.setAttribute("select", result);
			if (gender.equals("M"))
				request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);
			if (gender.equals("F"))
				request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);
			return;
		}//結束
		

		
		//排序功能
		if (selectorder != null) {
			if (selectorder.equals("OrderByPrice"))
				SQLorder = " order by price ";
			if (selectorder.equals("OrderByPriceDesc"))
				SQLorder = " order by price desc ";
			if (selectorder.equals("OrderByDate"))
				SQLorder = " order by launch_date ";
			if (selectorder.equals("OrderByDateDesc"))
				SQLorder = " order by launch_date desc ";
		
			result = productService.select(bean, SQLprice, SQLorder, SQLgender, SQLpart);// 把SQL傳入select做查詢
			request.setAttribute("select", result);
			
			if (gender.equals("M"))
				request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);
			if (gender.equals("F"))
				request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);
			return;
		
		}//結束


//		if (gender.equals("M"))
//			request.getRequestDispatcher("/pages/selectmen.jsp").forward(request, response);
//		if (gender.equals("F"))
//			request.getRequestDispatcher("/pages/selectwomen.jsp").forward(request, response);
//		return;

		//}
		
		/*
		if ("Select".equals(prodaction)) {
			// price range
			if ((lowprice.length() != 0 && highprice.length() != 0)) {
				SQLprice = " and price between " + lowprice + " and " + highprice;
			} else if (highprice.trim().length() != 0) {
				SQLprice = " and price < " + highprice;
			} else if (lowprice.trim().length() != 0) {
				SQLprice = " and price > " + lowprice;
			}
			// order by date/price
			if (selectorder != null) {
				if (selectorder.equals("OrderByPrice"))
					SQLorder = " order by price ";
				if (selectorder.equals("OrderByPriceDesc"))
					SQLorder = " order by price desc ";
				if (selectorder.equals("OrderByDate"))
					SQLorder = " order by launch_date ";
				if (selectorder.equals("OrderByDateDesc"))
					SQLorder = " order by launch_date desc ";
			}
			
			//HttpSession session = request.getSession(false);
			
			
			
			String sessionpart=(String) session.getAttribute("PART");
			System.out.println("session="+session.getAttribute("PART"));
			if (sessionpart!=null){
				SQLpart = " and part = '" + sessionpart + "'";
			}

			result = productService.select(bean, SQLprice, SQLorder, SQLgender, SQLpart);// 把SQL傳入select做查詢
			request.setAttribute("select", result);
			//System.out.println("result="+result);
			if (gender.equals("M"))
				
				request.getRequestDispatcher("/pages/selectmen.jsp").forward(request, response);
			if (gender.equals("F"))
				request.getRequestDispatcher("/pages/selectwomen.jsp").forward(request, response);
			return;
			
		}
*/
		
		//選擇部位即跳轉的功能
		if (part != null) {//如果選了部位 就進來做這			
			
			session.setAttribute("PART", part);//先把部位存進session			
			
			if (part.equals(a))//判斷部位
				SQLpart = " and part = '" + a + "'";
			if (part.equals(b))
				SQLpart = " and part = '" + b + "'";
			if (part.equals(c))
				SQLpart = " and part = '" + c + "'";
			if (part.equals(d))
				SQLpart = " and part = '" + d + "'";
			if (part.equals(e))
				SQLpart = " and part = '" + e + "'";
			if (part.equals(f))
				SQLpart = " and part = '" + f + "'";
			if (part.equals(g))
				SQLpart = " and part = '" + g + "'";
	
			result = productService.select(bean, SQLprice, SQLorder, SQLgender, SQLpart);// 把SQL傳入select做查詢
			request.setAttribute("select", result);
			// System.out.println("result="+result);	
			
			if (gender.equals("M"))
				request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);
			if (gender.equals("F"))
				request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);
			
			System.out.println("SQLpart=" + SQLpart);
			System.out.println("gender=" + gender);
			System.out.println("result="+result);
			return;
		}//結束
		
		
		String change = request.getParameter("change");//如果換到另一個jsp頁面就消除剛剛存進的session part
		if(change!=null){
			session.removeAttribute("PART");
		}		
		
		
		
		//最後
		if (gender.equals("M"))
			request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);
		if (gender.equals("F"))
			request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);		
		
	}
	// if(gender!=null) {
	// result = productService.selectAll(bean, x);
	// request.setAttribute("select", result);
	// request.getRequestDispatcher(
	// "/pages/selectmen.jsp").forward(request, response);
	// }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
