package gb01_login.controller;

import java.util.List;

public interface AdminFace {
	public void insert(AdminBean AdVo)throws Exception;
	public AdminBean selectById(String mail)throws Exception;
	public List<AdminBean> selectAll()throws Exception;
	public int delete(String mail)throws Exception;
	public void update(String mail, String pwd)throws Exception;
}