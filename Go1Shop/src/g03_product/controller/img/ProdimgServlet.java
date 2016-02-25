package g03_product.controller.img;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ProdimgServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ProdimgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {	
		doPost(req, resp);		
	}

	protected void doPost(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("addImg".equals(action)){
			
		
			int prodId = Integer.parseInt(req.getParameter("prodId"));
			//int imgId =  Integer.parseInt(req.getParameter("imgId"));
			
			Part part = req.getPart("img");
			InputStream inputStream = part.getInputStream();
			byte[] data = new byte[inputStream.available()];
			inputStream.read(data);
			
			Prodimg prodimg = new Prodimg();
			prodimg.setProdId(prodId);
			//prodimg.setImgId(imgId);
			prodimg.setImg(data);		
			
			ProdimgService prodimgService = new ProdimgService();
			prodimgService.addImg(prodimg);
		}
	}

}
