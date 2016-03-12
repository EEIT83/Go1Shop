package g03_product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;



@WebServlet(urlPatterns="/ProductUtil",loadOnStartup=1)
public class ProductUtil extends HttpServlet {	

	@Override
	public void init() throws ServletException {
		ServletContext ctx = getServletContext();
		
		Map<Integer,String> productCtrMap = new HashMap<Integer,String>();
		productCtrMap.put(0, "刪除");
		productCtrMap.put(1, "下架");
		productCtrMap.put(2, "上架");		
		
		ctx.setAttribute("ProductCtrMap", productCtrMap);
		System.out.println("我啟動了");
	}
	
}
