package g03_product.model;

import java.util.List;

public interface ProductDAOProject1 {

	List<ProductProject1Bean> select(String prod_name, String SQLprice, String SQLorder,String SQLgender);	

	List<ProductProject1Bean> selectAll(String gender, String genders);
	

}