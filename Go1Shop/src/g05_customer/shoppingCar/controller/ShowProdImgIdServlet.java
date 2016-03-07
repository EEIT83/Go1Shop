package g05_customer.shoppingCar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
@WebServlet(urlPatterns={"/showProdImg.con"})
public class ShowProdImgIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ShowProdImgIdService service = new ShowProdImgIdService();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodId = request.getParameter("prodId").trim();
		//System.out.println("prodId=" + prodId);
		Collection<Integer> imgId = new ArrayList<>();
		imgId = service.selectImgId(Integer.parseInt(prodId));
		
		
		JSONObject json = new JSONObject();
		json.put("imgid", imgId);
		//System.out.println(json.toJSONString());
		response.getWriter().write(json.toJSONString());
		/*request.setAttribute("imgId", imgId);*/
		//request.getRequestDispatcher("/g05_customer/shoppingCar/show.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
}
