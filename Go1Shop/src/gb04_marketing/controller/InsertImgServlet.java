package gb04_marketing.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import gb04_marketing.model.ImgDAO;

@WebServlet(urlPatterns={"/gb04_marketing/xxx.do"})
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
public class InsertImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//System.out.println(123);
		
		String fileName = "";
		String picId="";
		long sizeInBytes = 0;
		InputStream is = null;
		
		Collection<Part> parts = req.getParts();
		if (parts != null) {   // 如果這是一個上傳資料的表單				
			for (Part p : parts) {
				
					fileName = GlobalService.getFileName(p); // 此為圖片檔的檔名
					//System.out.println(fileName);
					
					picId = p.getName();
					//System.out.println(picId);
					
					int id = 0;
					if("1".equals(picId) || "2".equals(picId) || "3".equals(picId) ){
						id = Integer.parseInt(picId);
					}
					
					if (fileName != null && fileName.trim().length() > 0 && id != 0) {
						sizeInBytes = p.getSize();
						is = p.getInputStream();
						
						ImgDAO idao = new ImgDAO();
						ImgVO ivo = idao.select(id);
						if(ivo==null){
							idao.insertImg(is, sizeInBytes, id);
						}else{
							idao.updateImg(is, sizeInBytes, id);
						}
					} 
					
			}
		} 
		
		
		String location ="/Go1Shop/gb04_marketing/backMarketing.jsp";
		resp.sendRedirect(location);
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
}
