package g03_product.controller;

import java.util.List;

public class ProductService {
	
	private ProductDAO dao;
	
	public ProductService(){
		dao = new ProductDAOImpl();
	}

	public int addProd(Integer memId,String prodName,String size,String color,int count,int price,String brand,String gender,String part,String note){
		ProductVO productVO  = new ProductVO();
		
		productVO.setMemId(memId);		
		productVO.setProdName(prodName);
		productVO.setSize(size);		
		productVO.setColor(color);
		productVO.setCount(count);		
		productVO.setPrice(price);		
		productVO.setBrand(brand);
		productVO.setGender(gender);		
		productVO.setPart(part);		
		productVO.setNote(note);
		
		
		return dao.insert(productVO);
	}
	
	public int addProd(ProductVO productVO){		
		return dao.insert(productVO);
	}
	
	public List<ProductVO> getOneByMemId(Integer memId){
		return dao.getAllByMemId(memId);
	} 
	
	public int delete(Integer prodId){
		return dao.delete(prodId);
	}
	
	public int updateProdByProdId(Integer prodId,Integer memId,String prodName,String size,String color,int count,int price,String brand,String gender,String part,String note){
		ProductVO productVO  = new ProductVO();
		
		productVO.setMemId(memId);		
		productVO.setProdName(prodName);
		productVO.setSize(size);		
		productVO.setColor(color);
		productVO.setCount(count);		
		productVO.setPrice(price);		
		productVO.setBrand(brand);
		productVO.setGender(gender);		
		productVO.setPart(part);		
		productVO.setNote(note);
		
		
		return dao.update(productVO);  
	}
		
	public int update(ProductVO productVO){		
		return dao.update(productVO);
	}

	public  ProductVO getOne(Integer prodId) {
		// TODO Auto-generated method stub
		return dao.getOne(prodId);
	}

	
}
