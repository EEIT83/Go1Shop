package g03_product.model;

import java.util.ArrayList;
import java.util.List;

import g03_product.controller.dao.ProductDAO_Y;

public class ProductService_Y {
	
	public ProductDAOI_Y productDao = new ProductDAO_Y();
	//private ProductDAOI_Y productDao = new ProductDAO_Y();
	
	// private List<ProductProject1Bean> result=null;
	// 單一select
	public List<ProductBean_Y> select(ProductBean_Y bean, String SQLprice, String SQLorder,
			String SQLgender, String SQLpart) {// priceSQL的值會傳進query
		List<ProductBean_Y> result = null;		
		if (bean != null && bean.getProd_name() != null) {			
			List<ProductBean_Y> temp = productDao.select(bean.getProd_name(), SQLprice, SQLorder, SQLgender,
					SQLpart);// 取得prod_name			
			if (temp != null) {
				result = new ArrayList<ProductBean_Y>();
				result.addAll(temp);
								
			}
		} else if(SQLpart!=null){			
			List<ProductBean_Y> temp = productDao.select(bean.getProd_name(), SQLprice, SQLorder, SQLgender,
					SQLpart);			
			if (temp != null) {
				result = new ArrayList<ProductBean_Y>();
				result.addAll(temp);
				System.out.println("temp="+temp.toString());
			
			}
		}
		return result;// 把結果資料傳給servlet
	}

	// selectAll(prod_name)
	public List<ProductBean_Y> selectimg(ProductBean_Y bean, String SQLprice, String SQLorder, String SQLgender,
			String SQLpart) {
		List<ProductBean_Y> result = null;
		//System.out.println(bean);
		if (bean != null && bean.getGender() != null) {
			List<ProductBean_Y> temp = productDao.selectimg(bean.getProd_name(), SQLprice, SQLorder, SQLgender,
					SQLpart);// 取得prod_name
			if (temp != null) {
				result = new ArrayList<ProductBean_Y>();
				result.addAll(temp);
			}
		} else {
			// result = productDao.select();
		}
		return result;// 把結果資料傳給servlet
	}

	public static void main(String[] args) {
		ProductService_Y service = new ProductService_Y();
		ProductBean_Y beantest = new ProductBean_Y();
		beantest.setProd_name("jeans");
		//service.productDao.select(bean, 212, 2, SQLgender, SQLpart);
		// List<ProductProject1Bean> beans = service.select(beantest);
		// System.out.println("beans="+beans);

		// ProductProject1Bean beantest=new ProductProject1Bean();
		// beantest.setProd_name("j");
		// List<ProductProject1Bean> beans1 = service.selectAll(beantest);
		// System.out.println("beans="+ beans1);
	}
}
