package g03_product.model;


import g03_product.controller.img.Prodimg;

import java.util.List;

public interface ProductDAO_M {
	public int insert(ProductVO_M productVO);
	
	public int insertWithImg(ProductVO_M productVO,List<Prodimg> prodimgList);

	public int update(ProductVO_M productVO);

	public int delete(Integer prodId);

	public ProductVO_M getOne(Integer prodId);

	public List<ProductVO_M> getAll();

	List<ProductVO_M> getAllByMemId(Integer memId);
	
	public int updateWithImg(ProductVO_M productVO,List<Prodimg> prodimgList);
	
}
