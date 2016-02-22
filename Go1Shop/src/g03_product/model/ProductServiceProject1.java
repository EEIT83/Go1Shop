package g03_product.model;

import java.util.ArrayList;
import java.util.List;

import model.dao.ProductDAOJdbcProject1;

public class ProductServiceProject1 {
	private ProductDAOProject1 productDao = new ProductDAOJdbcProject1();

	// private List<ProductProject1Bean> result=null;
	// 單一select
	public List<ProductProject1Bean> select(ProductProject1Bean bean, String SQLprice,String SQLorder,String SQLgender) {//priceSQL的值會傳進query
		List<ProductProject1Bean> result = null;
		if (bean != null && bean.getProd_name() != null) {
			System.out.println(bean);
			List<ProductProject1Bean> temp = productDao.select(bean.getProd_name(), SQLprice, SQLorder,SQLgender);// 取得prod_name			
			if (temp != null) {
				result = new ArrayList<ProductProject1Bean>();
				result.addAll(temp);
			}
		} else {			
		 //result = productDao.selectAll(bean.getProd_name());
		}
		return result;// 把結果資料傳給servlet
	}

	// selectAll(prod_name)
	public List<ProductProject1Bean> selectAll(ProductProject1Bean bean, String x) {
		List<ProductProject1Bean> result = null;
		System.out.println(bean);
		if (bean != null && bean.getGender() != null) {
			List<ProductProject1Bean> temp = productDao.selectAll(bean.getGender(),x);// 取得prod_name
			if (temp != null) {
				result = new ArrayList<ProductProject1Bean>();
				result.addAll(temp);
			}
		} else {
			// result = productDao.select();
		}
		return result;// 把結果資料傳給servlet
	}

	

	public static void main(String[] args) {
		ProductServiceProject1 service = new ProductServiceProject1();
		ProductProject1Bean beantest = new ProductProject1Bean();
		beantest.setProd_name("jeans");
		// List<ProductProject1Bean> beans = service.select(beantest);
		// System.out.println("beans="+beans);

		// ProductProject1Bean beantest=new ProductProject1Bean();
		// beantest.setProd_name("j");
		// List<ProductProject1Bean> beans1 = service.selectAll(beantest);
		// System.out.println("beans="+ beans1);
	}
}
