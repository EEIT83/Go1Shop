package g05_customer.checkout.controller;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import g01_login.controller.MemberBean;
import g05_customer.shoppingCar.controller.ShoppingCar;

public class CheckDetailServlet extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	private ProdOrderBean orderBean;
	private String payment;
	private String address;
	private String sender_address;
	private int zip_code;
	private int zip_code_sen;
	
	
	public ProdOrderBean getOrderBean() {
		return orderBean;
	}
	public void setOrderBean(ProdOrderBean orderBean) {
		this.orderBean = orderBean;
	}
	
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getSender_address() {
		return sender_address;
	}
	public void setSender_address(String sender_address) {
		this.sender_address = sender_address;
	}
	
	public int getZip_code() {
		return zip_code;
	}
	public void setZip_code(int zip_code) {
		this.zip_code = zip_code;
	}
	public int getZip_code_sen() {
		return zip_code_sen;
	}
	public void setZip_code_sen(int zip_code_sen) {
		this.zip_code_sen = zip_code_sen;
	}
	@Override
	public void validate() {
	
		if(orderBean.getAddressee() == null || orderBean.getAddressee().trim().isEmpty()){
			this.addFieldError("addressee", this.getText("addressee.error"));
		}
		if(address == null || address.trim().isEmpty()){
			this.addFieldError("address", this.getText("address.error"));
		}
		if(orderBean.getPhone() == 0 ){
			this.addFieldError("phone", this.getText("phone.error"));
		}
		if(orderBean.getSender() == null || orderBean.getSender().trim().isEmpty()){
			this.addFieldError("sender", this.getText("sender.error"));
		}
		if(sender_address == null || sender_address.trim().isEmpty()){
			this.addFieldError("sender_address", this.getText("sender_address.error"));
		}
		if(orderBean.getSender_phone() == 0 ){
			this.addFieldError("sender_phone", this.getText("sender_phone.error"));
		}
		
		if(payment == null || payment.trim().length()==0){
			this.addFieldError("payment", this.getText("payment.error"));
		}
	}
	
	
	private Map<String,Object> session ;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	@Override
	public String execute() throws Exception {
		//System.out.println("asdsads=" + radio);
		//System.out.println("address=" + address);
		System.out.println(zip_code);
		System.out.println(zip_code_sen);
		CheckDetailService service = new CheckDetailService();
		MemberBean memBean = (MemberBean)session.get("LoginOK");
		ShoppingCar shopcar= (ShoppingCar)session.get("shopcar");
		orderBean.setPayment(payment);
		orderBean.setAddress(address);
		orderBean.setZip_code(zip_code);
		orderBean.setSender_address(sender_address);
		orderBean.setZip_code_sen(zip_code_sen);
		orderBean.setOrd_date(new java.util.Date());
		orderBean.setPayment_status("處理中");
		//System.out.println("CheckDetailServlet:before");
		service.insertOrder(memBean , shopcar , orderBean);
		session.remove("shopcar");
		//System.out.println("CheckDetailServlet:after");
		return "xxx";
	}

	
	
}
