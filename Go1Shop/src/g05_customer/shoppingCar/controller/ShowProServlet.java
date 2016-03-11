package g05_customer.shoppingCar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet(
		urlPatterns=("/g05_customer/ShowProServlet.con")
		)
public class ShowProServlet extends HttpServlet {

	private ShowProService service = new ShowProService();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse respone)
			throws ServletException, IOException {
		respone.setCharacterEncoding("UTF-8");
		//System.out.println("prodId=" + prodId);
		if(request.getParameter("prod_id").trim()==null || request.getParameter("prod_id").trim()==""){
			List<ProductBean> result= new ArrayList<ProductBean>();
			result = service.select();
			request.setAttribute("result", result);	
			request.getRequestDispatcher("/g05_customer/shoppingCar/show2.jsp").forward(request, respone);			
		}else{
			String prodId =  request.getParameter("prod_id").trim();
			ProductBean bean = new ProductBean();
			bean = service.selectById(Integer.parseInt(prodId));
			Gson gson = new Gson();
			//System.out.println(gson.toJson(bean));
			respone.getWriter().write(gson.toJson(bean));
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

}
