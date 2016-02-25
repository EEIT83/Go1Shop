package g07_msgboard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		//共用物件
		MessageService ms = new MessageService();
		List<MessageVO> messageList = ms.select();
		HttpSession session = request.getSession();
		
		
		
		//接收資料
		String message = request.getParameter("textarea");
		String username = request.getParameter("userName");
		System.out.println("userName=" + username);
		System.out.println("message=" + message);
		String message_id = request.getParameter("message_id");
		
		//轉換資料
		int bdmsg_id=0;
		if(message_id != null){
			bdmsg_id = Integer.parseInt(message_id);
		}
		
		//驗證資料
		
		//呼叫model
		if(message != null){
			ms.insert(message);
			
		}

		
		session.setAttribute("messageList", messageList);
		
		Map<String, String> msgState = new HashMap<>();
		if(bdmsg_id != 0){
			msgState.put("messageId", message_id);
			msgState.put("badMessage", "處理中...");
			session.setAttribute("msgState", msgState);
		}

		
		//根據model執行結果顯示view
		String location = "/Go1Shop/g07_msgboard/message.jsp";
		response.sendRedirect(location);
		
		
	}

}

















