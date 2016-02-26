package g03_product.model;


import java.util.List;

public interface ProductDAO {
	public int insert(ProductVO productVO);

	public int update(ProductVO productVO);

	public int delete(Integer prodId);

	public ProductVO getOne(Integer prodId);

	public List<ProductVO> getAll();

	List<ProductVO> getAllByMemId(Integer memId);
	
}
