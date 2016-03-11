package g07_msgboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import g07_msgboard.model.CommentsService;
import g07_msgboard.model.CommentsVO;

@WebServlet(urlPatterns={"/g07_msgboard/comments.do"})
public class CommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//測試
		
		//接收資料
		String userName = req.getParameter("userName");
		String comment = req.getParameter("comment");
		String commentId = req.getParameter("commentId");
		String reportId = req.getParameter("reportId");
		String manage = req.getParameter("manage");
		String hideId = req.getParameter("hideId");
		String recoverId = req.getParameter("recoverId");
		//轉換資料
		int id=0;
		if(commentId!=null){
			id = Integer.parseInt(commentId);
		}
		
		int reportid=0;
		if(reportId!=null){
			reportid = Integer.parseInt(reportId);
		}
		int manageid=0;
		if(manage!=null){
			manageid = Integer.parseInt(manage);
		}
		int hideid=0;
		if(hideId!=null){
			hideid=Integer.parseInt(hideId);
		}
		int recoverid=0;
		if(recoverId!=null){
			recoverid=Integer.parseInt(recoverId);
		}
		//驗證資料
		boolean b = false;
		if(userName!=null && comment!=null){
			b=true;
		}
		//呼叫model
		//1.insert comment
		CommentsService cs = new CommentsService();
		if(b){
			int i = cs.insert(userName, comment);
		}
		
		//2.delete comment
		if(id!=0){
			cs.delete(id);
		}
		
		//3.report id
		if(reportid!=0){
			cs.update(reportid);
		}
		//4.hide comment
		if(hideid!=0){
			cs.hide(hideid);
		}
		//5.recover comment
		if(recoverid!=0){
			cs.recover(recoverid);
		}
		
		//5.select comments
		List<CommentsVO> list = cs.select();
		HttpSession session = req.getSession();
		session.setAttribute("comments", list);
		
		
		//根據執行結果顯示view
		
		String location="/Go1Shop/g07_msgboard/comments.jsp";
		String mlocation="/Go1Shop/gb03_msgboard/backCommentsManage.jsp";
							
		if(manageid!=0){
			resp.sendRedirect(mlocation);
		}else{
			resp.sendRedirect(location);
		}
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
}
