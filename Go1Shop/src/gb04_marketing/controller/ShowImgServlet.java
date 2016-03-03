package gb04_marketing.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet(urlPatterns={"/gb04_marketing/showImg.do"})
public class ShowImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//String id = req.getParameter("id");
		//System.out.println(id);
		
		Connection conn = null;
		OutputStream os = null;
		InputStream is = null;
		try {
			// 讀取瀏覽器傳送來的書籍代號(BookID)
			String id = req.getParameter("id");
			// 分辨讀取哪個表格的圖片欄位
			//String type = req.getParameter("type"); 
			// 取得能夠執行JNDI的Context物件
			Context context = new InitialContext();
			// 透過JNDI取得DataSource物件
			DataSource ds = (DataSource) context
					.lookup("java:comp/env/jdbc/Go1ShopDB");
			conn = ds.getConnection();
			PreparedStatement pstmt = null;
			//System.out.println("GetImageFromDB, Type==>" + type);
			//System.out.println("GetImageFromDB, ID==>" + id);
			/*
			if (type.equalsIgnoreCase("BOOK")) {  // 讀取eBook表格
				pstmt = conn.prepareStatement(
						"SELECT fileName, CoverImage from eBook where bookID = ?");
			} else if (type.equalsIgnoreCase("MEMBER")) {  // 讀取eMember表格
				pstmt = conn.prepareStatement(
						"SELECT fileName, MemberImage from eMember where memberID = ?");
			}
			*/
			
			pstmt = conn.prepareStatement(
					"select img from image where id = ?");
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				// Image欄位可以取出InputStream物件
				is = rs.getBinaryStream(1);
				
				//String mimeType = getServletContext().getMimeType(fileName);
				String mimeType = "image/jpeg";
				
				// 設定輸出資料的型態
				resp.setContentType(mimeType);
				// 取得能寫出非文字資料的OutputStream物件
				os = resp.getOutputStream();				
				/*
				if (is == null) {
					is = getServletContext().getResourceAsStream(
							"/images/NoImage.jpg");
				}
				*/
				int count = 0;
				byte[] bytes = new byte[1024];
				while ((count = is.read(bytes)) != -1) {
					os.write(bytes, 0, count);
				}
			}
		} catch (NamingException e) {
			throw new ServletException(e);
		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close(); // 一定要註解此行來執行本程式五次
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (os != null) {
				os.close();
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
}
