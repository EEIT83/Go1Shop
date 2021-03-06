package g03_product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import g03_product.model.ProductBean_Y;
import g03_product.model.ProductService_Y;
import g03_product.model.StoreService_M;
import g03_product.model.StoreVO_M;
import g05_customer.shoppingCar.controller.ProductBean;

@WebServlet(urlPatterns = {"/g03_product/ProductGenderServlet.controller"})

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
		
		
		//System.out.println("執行GenderServlet");

		HttpSession session = request.getSession();
		
		
		// 接收資料

		String prod_name = request.getParameter("prod_name");// 取得jsp欄位資料
		String prodaction = request.getParameter("prodaction");
		String selectorder = request.getParameter("selectorder");
		String highprice = request.getParameter("highprice");
		String lowprice = request.getParameter("lowprice");
		String gender = request.getParameter("gender");
		String part = request.getParameter("part");

//		String index = request.getParameter("index").trim();
		//
//		System.out.println("index=" + index);
//		if("1".equals(index)){
//			request.getSession().setAttribute("index", "1");
//			highprice ="";
//			lowprice ="";
//			
//		}
		
		
		///////////////////////// MENG 抓出商店資訊///////////////////////////////
		// 2.查詢資料(透過svc進行資料處理)
		String memid = request.getParameter("memid");
		// System.out.println("MENG 抓出商店資訊memid"+memid);
		if (memid != null) {
			Integer memId = Integer.parseInt(memid);
			StoreService_M storeSrv = new StoreService_M();
			StoreVO_M storeVO = storeSrv.getOneByMemId(memId);
			// System.out.println("MENG 抓出商店資訊"+storeVO);
			// List<StoreVO_M> xxx= new ArrayList<StoreVO_M>();
			// xxx.add(storeVO);
			Gson gson = new Gson();
			System.out.println(gson.toJson(storeVO));
			// System.out.println(gson.toJson(xxx));
			response.getWriter().write(gson.toJson(storeVO));
			return;
		}

		///////////////////////// MENG///////////////////////////////
	

		
		// 呼叫model(DAO)

		ProductBean_Y bean = new ProductBean_Y();
		bean.setProd_name(prod_name);		
		bean.setGender(gender);
		bean.setPart(part);

		String SQLorder = "";
		String SQLprice = "";
		String SQLgender ="";
		if (gender != null) {
			SQLgender = " and gender = '" + gender + "'";
		}// 收到gender資料後直接輸入(只要是男女jsp送來的固定會有)
		String SQLpart = "";

		// 根據model執行結果顯示view

		List<ProductBean_Y> result;//new一個接收回傳結果資料的
		
		
		//如果已經先選了部位 就直接針對部位做篩選排序
		String sessionpart = (String) session.getAttribute("PART");
		//System.out.println("session=" + session.getAttribute("PART"));
		
		
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
			
			//搜尋時把使用者剛剛輸入的產品名稱條件和價格條件存入session，搜尋完後再點選排序會用到
			session.setAttribute("PROD_NAME", prod_name);
			session.setAttribute("PRICE_RANGE", SQLprice);	
			if (sessionpart != null) {SQLpart = " and part = '" + sessionpart + "'";}
			
			
			result = productService.select(bean, SQLprice, SQLorder, SQLgender, SQLpart);// 把SQL傳入select做查詢
			request.setAttribute("select", result);

		
			if (gender==null){
				request.getRequestDispatcher("/index.jsp").forward(request, response);}
			if(gender!=null){
			if (gender.equals("M")){
				request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);}
			if (gender.equals("F")){
				request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);}}
			return;
		}
			//結束
		

		
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
		
			//如果使用者剛剛有輸入搜尋條件 這裡會沿用
			if (sessionpart != null) {SQLpart = " and part = '" + sessionpart + "'";}
			
			String sessionprod_name = (String) session.getAttribute("PROD_NAME");
			if (sessionprod_name !=null ){
			bean.setProd_name(sessionprod_name);}
			String sessionprice_range = (String) session.getAttribute("PRICE_RANGE");
			if (sessionprice_range!=null){
			SQLprice = sessionprice_range;}

			result = productService.select(bean, SQLprice, SQLorder, SQLgender, SQLpart);// 把SQL傳入select做查詢
			request.setAttribute("select", result);

			if (gender==null){
				request.getRequestDispatcher("/index.jsp").forward(request, response);}
			if(gender!=null){
			if (gender.equals("M")){
				request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);}
			if (gender.equals("F")){
				request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);}}
			return;
		}

		//初始	
        
	

		
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
			
			if (gender==null){
				request.getRequestDispatcher("/index.jsp").forward(request, response);}
			if(gender!=null){
			if (gender.equals("M")){
				request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);}
			if (gender.equals("F")){
				request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);}}
			
//			System.out.println("SQLpart=" + SQLpart);
//			System.out.println("gender=" + gender);
			//System.out.println("result="+result);
			return;
		}//結束
	
		
		//跳轉頁面
		String change = request.getParameter("change");//如果換到另一個jsp頁面就消除剛剛存進的session part
		System.out.println("change="+change);
		if(change!=null){
			session.removeAttribute("PART");
			session.removeAttribute("PROD_NAME");
			session.removeAttribute("PRICE_RANGE");
			
			result = productService.select(bean, SQLprice, SQLorder, SQLgender, SQLpart);// 把SQL傳入select做查詢
			request.setAttribute("select", result);
		}		
		
		if (gender==null){
			request.getRequestDispatcher("/index.jsp").forward(request, response);}
		if(gender!=null){
		if (gender.equals("M")){
			request.getRequestDispatcher("/g03_product/selectmen_Y.jsp").forward(request, response);}
		if (gender.equals("F")){
			request.getRequestDispatcher("/g03_product/selectwomen_Y.jsp").forward(request, response);}}
		
		
		
		
		
		
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
