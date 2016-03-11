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
					
					req.setAttribute("StoreVO", storeVO); // 資料庫取出的empVO物件,存入req					
					RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/addShopInfo.jsp");
					failureView.forward(req, resp);
					return;
				}

				// 2.開始新增資料
				//新增product
				StoreService_M storeSrv = new StoreService_M();
				int count1 = storeSrv.insert(storeVO);


				// 3.轉交資料
				HttpSession session = req.getSession();
				session.setAttribute("StoreVO", storeVO);
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
				memId = new Integer(req.getParameter("memId"));
			
				// 2.查詢資料(透過svc進行資料處理)
				StoreService_M storeSrv = new StoreService_M();
				StoreVO_M storeVO = storeSrv.getOneByMemId(memId);

				// 3.結果傳送到顯示的View
				HttpSession session = req.getSession();
				session.setAttribute("StoreVO", storeVO);
				String url="";
				if(storeVO==null){
					url="/g03_product/addShopInfo.jsp";
				}else{
					 url = "/g03_product/shopInfo.jsp";
				}
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_emp_input.jsp
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/shopInfo.jsp");
				failureView.forward(req, resp);

			}

		}
		
		/********************** updateProdByProdId ****************************/

		if ("update".equals(action)) { 
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
					
					req.setAttribute("StoreVO", storeVO); // 資料庫取出的empVO物件,存入req					
					RequestDispatcher failureView = req.getRequestDispatcher("/g03_product/addShopInfo.jsp");
					failureView.forward(req, resp);
					return;
				}

				// 2.開始新增資料
				//新增product
				StoreService_M storeSrv = new StoreService_M();
				int count1 = storeSrv.update(storeVO);


				// 3.轉交資料
				HttpSession session = req.getSession();
				session.setAttribute("StoreVO", storeVO);
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
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
