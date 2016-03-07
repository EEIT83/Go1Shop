package g07_msgboard.model;

import java.util.List;

public class MessageService {
	
	MessageDAO mdao = new MessageDAO();
	
	public MessageVO insert(String message){
		
		MessageVO mvo = new MessageVO();
		mvo.setMem_id(3);
		mvo.setProd_id(3);
		mvo.setMessage(message);		
		mvo.setMessage_date(new java.util.Date());
		mvo.setMessage_state("ok");
		
		mdao.insert(mvo);
		
		return null;
	}
	
	public int update(int msgId){
		return mdao.update(msgId);
	}
	
	public List<MessageVO> select(){
		return mdao.select();
	}
	
}
