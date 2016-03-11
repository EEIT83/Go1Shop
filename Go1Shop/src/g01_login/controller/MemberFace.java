package g01_login.controller;

import java.util.List;

public interface MemberFace {
	public MemberBean selectId(String mail)throws Exception;
	public List<MemberBean> getByProperty(MemberBean memVo)throws Exception;
	public void insert(MemberBean memVo) throws Exception;
	public void update(MemberBean memVo)throws Exception;
	public int delete(MemberBean memVo) throws Exception;
}
