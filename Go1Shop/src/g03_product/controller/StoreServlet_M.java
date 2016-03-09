package g03_product.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import g03_product.model.ProductService_M;
import g03_product.model.ProductVO_M;
import g03_product.model.StoreService_M;
import g03_product.model.StoreVO_M;

@WebServlet("/StoreServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class StoreServlet_M extends HttpServlet {
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
				
				int memId = Integer.valueOf(req.getParameter("memId"));			
				
				String storeName = req.getParameter("storeName");
				if (storeName == null || storeName.trim().length() == 0) {
					errorMsgs.add("商店姓名: 請勿空白");
				}

				String note = req.getParameter("note");
				if (note == null || note.trim().length() == 0) {
					errorMsgs.add("商店描述: 請勿空白");
				}

				String storeAddress = req.getParameter("storeAddress");
				if (storeAddress == null || storeAddress.trim().length() == 0) {
					errorMsgs.add("商店地址: 請勿空白");
				}

				
				//商店物件
				StoreVO_M storeVO = new StoreVO_M();
				storeVO.setMemId(memId);
				storeVO.setStoreName(storeName);
				storeVO.setStoreAddress(storeAddress);
				storeVO.setNote(note);

				if (!errorMsgs.isEmpty()) {		
					HttpSession session = req.getSession();
					session.setAttribute("StoreVO", storeVO); // 資料庫取出的empVO物件,存入req					
					RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/addShopInfo.jsp");
					failureView.forward(req, resp);
					return;
				}

				// 2.開始新增資料
				//新增product
				StoreService_M storeSrv = new StoreService_M();
				int count1 = storeSrv.insert(storeVO);


				// 3.轉交資料
				String url = "/g03_product/shopInfo.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
																				// listAllEmp.jsp
				successView.forward(req, resp);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/addShopInfo.jsp");
				failureView.forward(req, resp);
			}
		}

		/********************** Get_One_By_Mem_Id ****************************/

		if ("getOneByMemId".equals(action)) {
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
		
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
