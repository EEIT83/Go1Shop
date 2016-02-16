package g05_customer.checkout.controller;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import g05_customer.shoppingCar.controller.ShoppingCar;

public class CheckDetailServlet extends ActionSupport implements SessionAware{
	private ProdOrderBean orderBean;
	private String payment;
	private String address;
	
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
		if(orderBean.getSender_address() == null || orderBean.getSender_address().trim().isEmpty()){
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
//	@Override
//	public String execute() throws Exception {
//		//System.out.println("asdsads=" + radio);
//		//System.out.println("address=" + address);
//		CheckDetailService service = new CheckDetailService();
//		MemberBean memBean = (MemberBean)session.get("LoginOK");
//		ShoppingCar shopcar= (ShoppingCar)session.get("shopcar");
//		orderBean.setPayment(payment);
//		orderBean.setAddress(address);
//		//System.out.println("CheckDetailServlet:before");
//		service.insertOrder(memBean , shopcar , orderBean);
//		//System.out.println("CheckDetailServlet:after");
//		return "xxx";
//	}

	
	
}
