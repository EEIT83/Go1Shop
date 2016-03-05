package g03_product.model;

import java.util.List;

public interface ProductDAOI_Y {

	List<ProductBean_Y> select(String prod_name, String SQLprice, String SQLorder,String SQLgender,String SQLpart);	

	List<ProductBean_Y> selectAll(String gender);
	

}