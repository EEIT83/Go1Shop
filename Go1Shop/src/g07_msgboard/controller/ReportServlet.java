package g07_msgboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g07_msgboard.model.MessageDAO;
import g07_msgboard.model.MessageService;

@WebServlet(value={"/gb03_msgboard/report.do"})
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//共用
		//接收資料
		String message_id = req.getParameter("message_id");
		
		//轉換資料
		int msgId=0;
		if(message_id != null){
			msgId = Integer.parseInt(message_id);
		}
		
		
		//驗證資料
		//呼叫model
		MessageService ms = new MessageService();
		ms.update(msgId);
		
		//根據model執行結果顯示view
		String location="/Go1Shop/g07_msgboard/message.jsp";
		resp.sendRedirect(location);
		
		
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
}
