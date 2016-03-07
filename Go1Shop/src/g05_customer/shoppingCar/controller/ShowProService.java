package g05_customer.shoppingCar.controller;

import java.util.ArrayList;
import java.util.List;

import g05_customer.shoppingCar.model.ShowProDAO;

public class ShowProService {
	private ShowProDAO DAO = new ShowProDAO();
	private List<ProductBean> result;
	public List<ProductBean> select(){
		result = new  ArrayList<>();
		result = DAO.select();
		return result;
	}
	public List<ProductBean> getResult() {
		return result;
	}

	public ProductBean selectById(int prod_id){
		return DAO.selectId(prod_id);
	}
	
	
}
