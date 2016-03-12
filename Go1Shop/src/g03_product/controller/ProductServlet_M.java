package g03_product.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import g03_product.controller.img.Prodimg;
import g03_product.controller.img.ProdimgService;
import g03_product.model.ProductService_M;
import g03_product.model.ProductVO_M;
@WebServlet("/g03_product/ProductServlet.con")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ProductServlet_M extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		/*********************** Insert *****************************/

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接受請求參數
				Integer memId = null;
				try {
					memId = new Integer(req.getParameter("memId"));
				} catch (NumberFormatException e) {
					memId = 0;
					errorMsgs.add("會員編號: 請填數字");
				}
				String prodName = req.getParameter("prodName");
				if (prodName == null || prodName.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				}

				String size = req.getParameter("size");
				if (size == null || size.trim().length() == 0) {
					errorMsgs.add("size: 請勿空白");
				}

				String color = req.getParameter("color");
				if (color == null || color.trim().length() == 0) {
					errorMsgs.add("color: 請勿空白");
				}

				Integer count = null;
				try {
					count = new Integer(req.getParameter("count"));
				} catch (NumberFormatException e) {
					count = 0;
					errorMsgs.add("總數: 請填數字");
				}

				Integer price = null;
				try {
					price = new Integer(req.getParameter("price"));
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("價錢: 請填數字");
				}

				String brand = req.getParameter("brand");
				if (brand == null || brand.trim().length() == 0) {
					errorMsgs.add("品牌: 請勿空白");
				}

				String gender = req.getParameter("gender");
				if (gender == null || gender.trim().length() == 0) {
					errorMsgs.add("性別: 請勿空白");
				}

				String part = req.getParameter("part");
				if (part == null || size.trim().length() == 0) {
					errorMsgs.add("款式: 請勿空白");
				}

				String note = req.getParameter("note");
				if (note == null || note.trim().length() == 0) {
					errorMsgs.add("註解請勿空白");
				}
				
				Part imgPart = req.getPart("img");
				InputStream inputStream = imgPart.getInputStream();
				byte[] data = new byte[inputStream.available()];
				inputStream.read(data);
				if(data.length==0){
					errorMsgs.add("請上傳圖片");
				}

				//商品物件
				ProductVO_M productVO = new ProductVO_M();
				productVO.setMemId(memId);
				productVO.setProdName(prodName);
				productVO.setSize(size);
				productVO.setColor(color);
				productVO.setCount(count);
				productVO.setPrice(price);
				productVO.setBrand(brand);
				productVO.setGender(gender);
				productVO.setPart(part);
				productVO.setNote(note);
				
				//圖片物件
				List<Prodimg> prodimgList = new ArrayList<Prodimg>();
				Prodimg prodimg = new Prodimg();
				prodimg.setImg(data);
				prodimgList.add(prodimg);

				if (!errorMsgs.isEmpty()) {					
					req.setAttribute("ProductVO", productVO); // 資料庫取出的empVO物件,存入req					
					RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/addNewProduct_M.jsp");
					failureView.forward(req, resp);
					return;
				}

				// 2.開始新增資料
				//新增product
				ProductService_M prodsvc = new ProductService_M();
				int count1 = prodsvc.addProd(productVO, prodimgList);


				List<ProductVO_M> list = prodsvc.getOneByMemId(memId);

				// 3.結果傳送到顯示的View
				req.setAttribute("productVOList", list);
				String url = "/g03_product/selectProductByMemId_M.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);
				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/addNewProduct_M.jsp");
				failureView.forward(req, resp);
			}
		}

		/********************** Get_One_By_Mem_Id ****************************/

		if ("getOneByMemId".equals(action)) {
			System.out.println("test");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接受請求參數
				Integer memId = null;
				try {
					memId = new Integer(req.getParameter("memId"));
				} catch (NumberFormatException e) {
					memId = 0;
					errorMsgs.add("會員ID請勿空白");
				}
				// 2.查詢資料(透過svc進行資料處理)
				ProductService_M srv = new ProductService_M();
				List<ProductVO_M> list = srv.getOneByMemId(memId);

				// 3.結果傳送到顯示的View
				req.setAttribute("productVOList", list);
				String url = "/g03_product/selectProductByMemId_M.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_emp_input.jsp
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/selectProductByMemId_M.jsp");
				failureView.forward(req, resp);

			}

		}
		/********************** Delete_By_Product_ID ****************************/
		if ("deleteByProdId".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接受請求參數
				Integer prodId = null;

				prodId = new Integer(req.getParameter("prodId"));

				Integer memId = null;
				try {
					memId = new Integer(req.getParameter("memId"));
				} catch (NumberFormatException e) {
					memId = 0;
					errorMsgs.add("會員ID請勿空白");
				}
				// 2.查詢資料(透過svc進行資料處理)
				ProductService_M srv = new ProductService_M();
				srv.updateCtr(prodId, 0); // 刪除
				List<ProductVO_M> list = srv.getOneByMemId(memId); // 再次查詢該會員

				// 3.結果傳送到顯示的View
				req.setAttribute("productVOList", list);
				String url = "/g03_product/selectProductByMemId_M.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_emp_input.jsp
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/selectProductByMemId_M.jsp");
				failureView.forward(req, resp);

			}

		}
		/********************** goToUpdatePage ****************************/

		if ("goToUpdatePage".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數

				Integer prodId = null;
				try {
					prodId = new Integer(req.getParameter("prodId"));
				} catch (NumberFormatException e) {
					prodId = 0;
					errorMsgs.add("產品ID請勿空白");
				}
				
				// 2.開始查詢資料

				ProductService_M srv = new ProductService_M();
				ProductVO_M productVO = srv.getOne(prodId);

				// 3.查詢完成,準備轉交(Send the Success view)

				req.setAttribute("productVO", productVO); // 資料庫取出的empVO物件,存入req
				String url = "/g03_product/updateProductByProductId_M.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_emp_input.jsp
				successView.forward(req, resp);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/updateProductByProductId_M.jsp");
				failureView.forward(req, resp);
			}
		}
		
		if("updateProdByProdId".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接受請求參數
				Integer prodId = Integer.valueOf(req.getParameter("prodId"));
				Integer memId = Integer.valueOf(req.getParameter("memId"));
				
				String prodName = req.getParameter("prodName");
				if (prodName == null || prodName.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				}

				String size = req.getParameter("size");
				if (size == null || size.trim().length() == 0) {
					errorMsgs.add("size: 請勿空白");
				}

				String color = req.getParameter("color");
				if (color == null || color.trim().length() == 0) {
					errorMsgs.add("color: 請勿空白");
				}

				Integer count = null;
				try {
					count = new Integer(req.getParameter("count"));
				} catch (NumberFormatException e) {
					count = 0;
					errorMsgs.add("總數: 請填數字");
				}

				Integer price = null;
				try {
					price = new Integer(req.getParameter("price"));
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("價錢: 請填數字");
				}

				String brand = req.getParameter("brand");
				if (brand == null || brand.trim().length() == 0) {
					errorMsgs.add("品牌: 請勿空白");
				}

				String gender = req.getParameter("gender");
				if (gender == null || gender.trim().length() == 0) {
					errorMsgs.add("性別: 請勿空白");
				}

				String part = req.getParameter("part");
				if (part == null || size.trim().length() == 0) {
					errorMsgs.add("款式: 請勿空白");
				}

				String note = req.getParameter("note");
				if (note == null || note.trim().length() == 0) {
					errorMsgs.add("註解請勿空白");
				}
				
				Part imgPart = req.getPart("img");
				InputStream inputStream = imgPart.getInputStream();
				byte[] data = new byte[inputStream.available()];
				inputStream.read(data);
				

				ProductVO_M productVO = new ProductVO_M();
				productVO.setProdId(prodId);
				productVO.setMemId(memId);				
				productVO.setProdName(prodName);
				productVO.setSize(size);
				productVO.setColor(color);
				productVO.setCount(count);
				productVO.setPrice(price);
				productVO.setBrand(brand);
				productVO.setGender(gender);
				productVO.setPart(part);
				productVO.setNote(note);
				
				List<Prodimg> prodimgList = new ArrayList<Prodimg>();
				ProdimgService prodimgService = new ProdimgService();
				Prodimg prodimg =  prodimgService.getOneByProdId(prodId);
				if(data.length!=0){
					prodimg.setImg(data);			
				}				
				prodimgList.add(prodimg);

				if (!errorMsgs.isEmpty()) {					
					req.setAttribute("ProductVO", productVO); // 資料庫取出的empVO物件,存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/updateProductByProductId_M.jsp");
					failureView.forward(req, resp);
					return;
				}

				// 2.開始更新資料

				ProductService_M prodsvc = new ProductService_M();
				int count1 = prodsvc.update(productVO,prodimgList);
				
				
				List<ProductVO_M> list = prodsvc.getOneByMemId(memId);

				// 3.結果傳送到顯示的View
				req.setAttribute("productVOList", list);
				String url = "/g03_product/selectProductByMemId_M.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_emp_input.jsp
				successView.forward(req, resp);				
				
				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/updateProductByProductId_M.jsp");
				failureView.forward(req, resp);
			}
		}
		
		if("updateCtr".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try{
				
				int prodId = Integer.valueOf(req.getParameter("prodId"));
				int ctr = Integer.valueOf(req.getParameter("ctr"));
				int memId = Integer.valueOf(req.getParameter("memId"));
				ProductService_M prodsvc = new ProductService_M();
				if (!errorMsgs.isEmpty()) {	
					List<ProductVO_M> list = prodsvc.getOneByMemId(memId);
					req.setAttribute("productVOList", list);
					String url = "/g03_product/selectProductByMemId_M.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, resp);
					return;
				}
				
				
				if(ctr == 1 ){
					ctr = 2;
				}else if(ctr == 2){
					ctr = 1;
				}
				
				int count = prodsvc.updateCtr(prodId, ctr);

				// 3.結果傳送到顯示的View
				List<ProductVO_M> list = prodsvc.getOneByMemId(memId);
				req.setAttribute("productVOList", list);
				String url = "/g03_product/selectProductByMemId_M.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);
			}catch(Exception e){
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/selectProductByMemId_M.jsp");
				failureView.forward(req, resp);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
