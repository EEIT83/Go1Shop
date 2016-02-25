package g03_product.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		/*********************** Insert *****************************/

		if ("insert".equals(action)) {
			System.out.println("insert");

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

				ProductVO productVO = new ProductVO();
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

				if (!errorMsgs.isEmpty()) {
					for (String s : errorMsgs) {
						System.out.println(s);
					}
					req.setAttribute("ProductVO", productVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/g03_product/addNewProduct.jsp");
					failureView.forward(req, resp);
					return;
				}

				// 2.開始新增資料

				ProductService prodsvc = new ProductService();
				int count1 = prodsvc.addProd(productVO);
				System.out.println(count1);

				// 3.轉交資料
				String url = "/g03_product/addNewProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, resp);

				// 其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/g03_product/addNewProduct.jsp");
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
					errorMsgs.add("�|���s��: �ж�Ʀr");
				}
				// 2.查詢資料(透過svc進行資料處理)
				ProductService srv = new ProductService();
				List<ProductVO> list = srv.getOneByMemId(memId);

				// 3.結果傳送到顯示的View
				req.setAttribute("productVOList", list);
				String url = "/g03_product/selectProductByMemId.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���
																				// update_emp_input.jsp
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/g03_product/selectProductByMemId.jsp");
				failureView.forward(req, resp);

			}

		}
		
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
					errorMsgs.add("�|���s��: �ж�Ʀr");
				}
				// 2.查詢資料(透過svc進行資料處理)		
				ProductService srv = new ProductService();
				srv.delete(prodId); //刪除
				List<ProductVO> list = srv.getOneByMemId(memId); //再次查詢該會員
				
				// 3.結果傳送到顯示的View
				req.setAttribute("productVOList", list);
				String url = "/g03_product/selectProductByMemId.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
																				// update_emp_input.jsp
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/g03_product/selectProductByMemId.jsp");
				failureView.forward(req, resp);

			}

		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
