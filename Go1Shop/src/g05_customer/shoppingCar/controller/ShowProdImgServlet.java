package g05_customer.shoppingCar.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/g05_customer/ShowProdImg.con" })
public class ShowProdImgServlet extends HttpServlet {
	private ShowProdImgService service = new ShowProdImgService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String imgId = request.getParameter("imgId").trim();
		//System.out.println("imgId="+imgId);
		InputStream in = null;
		OutputStream out = null;
		String imgType = "image/jpeg";
		response.setContentType(imgType);

		try {

			in = new ByteArrayInputStream(service.selectImg(Integer.parseInt(imgId)));
			
			out = response.getOutputStream();
			int count = 0;
			byte[] bytes = new byte[1024];
			while ((count = in.read(bytes)) != -1) {
				out.write(bytes, 0, count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

}
