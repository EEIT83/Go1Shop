package g07_msgboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import g07_msgboard.model.MessageService;
import g07_msgboard.model.MessageVO;



@WebServlet("/g07_msgboard/message.do")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Controller
		//接收資料
		String message = request.getParameter("textarea");
		//System.out.println(message.toString());
		
		//轉換資料
		
		//驗證資料
		
		//呼叫model
		MessageService ms = new MessageService();
		if(message != null){
			ms.insert(message);
			
		}

		
		List<MessageVO> messageList = ms.select();
		//System.out.println(messageList);
		HttpSession session = request.getSession();
		session.setAttribute("messageList", messageList);
		
		String location = "/GoEshop/ch04_message/message.jsp";
		response.sendRedirect(location);
		/*
		*/
		
		
		//根據model執行結果顯示view
		
		
		
		
		
		
	}

}

















