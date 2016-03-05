package g07_msgboard.model;

import java.util.Date;

public class MessageVO {
	private int message_id;
	private int mem_id;
	private int prod_id;
	private String message;
	private java.util.Date message_date;
	private String message_state;
	
	
	public MessageVO(){}


	public MessageVO(int message_id, int mem_id, int prod_id, String message, Date message_date, String message_state) {
		super();
		this.message_id = message_id;
		this.mem_id = mem_id;
		this.prod_id = prod_id;
		this.message = message;
		this.message_date = message_date;
		this.message_state = message_state;
	}

	
	
	

	@Override
	public String toString() {
		return "MessageVO [message_id=" + message_id + ", mem_id=" + mem_id + ", prod_id=" + prod_id + ", message="
				+ message + ", message_date=" + message_date + ", message_state=" + message_state + "]";
	}


	public int getMessage_id() {
		return message_id;
	}


	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}


	public int getMem_id() {
		return mem_id;
	}


	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}


	public int getProd_id() {
		return prod_id;
	}


	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public java.util.Date getMessage_date() {
		return message_date;
	}


	public void setMessage_date(java.util.Date message_date) {
		this.message_date = message_date;
	}


	public String getMessage_state() {
		return message_state;
	}


	public void setMessage_state(String message_state) {
		this.message_state = message_state;
	};

}
