package g01_login.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.lang3.StringUtils;

import g01_login.controller.MemberBean;
import g01_login.controller.MemberFace;

public class MemberDAO implements MemberFace {
	private String SELECT_ID = "select * from member where mail=?";
	private String SELECT_ALL = "select * from member ";
	private String INSERT = "insert into member (mail, pwd, mem_name, gender, bdate) values (?, ?, ?, ?, ?)";
	private StringBuilder UPDATE;
	SQLserver db;
	QueryRunner runner;

	public MemberDAO() throws Exception {
		db = new SQLserver();
		runner = new QueryRunner();
	}

	public MemberBean selectId(String mail) throws Exception {
		try {
			ResultSetHandler<List<MemberBean>> rsh = new BeanListHandler<MemberBean>(
					MemberBean.class);
			Object params[] = { mail };
			List<MemberBean> result = runner.query(db.getConn(), SELECT_ID,
					rsh, params);
			if (result.size() <= 0) {
				return null;
			} else {
				return result.get(0);
			}
		} catch (SQLException e) {
			return null;
		}
	}

	public List<MemberBean> selectAll() throws Exception {
		try {
			ResultSetHandler<List<MemberBean>> rsh = new BeanListHandler<MemberBean>(
					MemberBean.class);
			List<MemberBean> result = runner.query(db.getConn(), SELECT_ALL,
					rsh);
			if (result.size() <= 0) {
				return null;
			} else {
				return result;
			}
		} catch (SQLException e) {
			throw new Exception("查詢資料錯誤");
		}
	}

	public void insert(MemberBean memVo) throws Exception {
		try {
			if (memVo != null) {
				Object params[] = { memVo.getMail(), memVo.getPwd(),
						memVo.getMem_name(),
						memVo.getGender(), memVo.getBdate() };
				runner.update(db.getConn(), INSERT, params);
			}
		} catch (SQLException e) {
			throw new Exception("新增資料有誤:" + e.getMessage());
		}
	}

	public void update(MemberBean memVo) throws Exception {
		UPDATE = new StringBuilder("update member set ");
		List<Object> pList = new ArrayList<Object>();

		if (StringUtils.isNoneEmpty(memVo.getMem_name())) {
			UPDATE.append("mem_name=?, ");
			pList.add(memVo.getMem_name());
		}
		if (StringUtils.isNoneEmpty(memVo.getPwd())) {
			UPDATE.append("pwd=?, ");
			pList.add(memVo.getPwd());
		}

		if (StringUtils.isNoneEmpty(memVo.getGender())) {
			UPDATE.append("gender=?, ");
			pList.add(memVo.getGender());
		}
		if (memVo.getBdate() != null) {
			UPDATE.append("bdate=?, ");
			pList.add(memVo.getBdate());
		}
		if (StringUtils.isNoneEmpty(memVo.getStatus())) {
			UPDATE.append("status=?, ");
			pList.add(memVo.getStatus());
		}
		UPDATE.delete(UPDATE.length() - 2, UPDATE.length());
		UPDATE.append(" where mail=? ");
		pList.add(memVo.getMail());

		int count = runner.update(db.getConn(), UPDATE.toString(),
				pList.toArray());
		if (count <= 0) {
			throw new Exception("Update 失敗");
		}

	}

	public int delete(MemberBean memVo) throws Exception {

		List<Object> params = new ArrayList<Object>();
		StringBuilder DEL_SQL = new StringBuilder(
				"delete from member where 1=1 ");
		if (memVo.getMem_id() > 0) {
			DEL_SQL.append(" AND mem_id = ?");
			params.add(memVo.getMem_id());
		}
		if (memVo.getMail() != null && !"".equals(memVo.getMail())) {
			DEL_SQL.append(" AND mail = ? ");
			params.add(memVo.getMail());
		}
		try {
			return runner.update(db.getConn(), DEL_SQL.toString(),
					params.toArray());
		} catch (SQLException e) {
			throw new Exception("刪除資料有誤:" + e.getMessage());
		}
	}

	public List<MemberBean> getByProperty(MemberBean memVo) throws Exception {
		ResultSetHandler<List<MemberBean>> rsh = new BeanListHandler<MemberBean>(
				MemberBean.class);
		List<Object> params = new ArrayList<Object>();
		StringBuilder sb = new StringBuilder("select * from member where 1=1");
		if (StringUtils.isNotEmpty(memVo.getMail())) {
			sb.append(" AND mail=?");
			params.add(memVo.getMail());
		}
		if (StringUtils.isNotEmpty(memVo.getMem_name())) {
			sb.append(" AND Mem_name Like ?");
			params.add("%" + memVo.getMem_name() + "%");
		}
		if (StringUtils.isNotEmpty(memVo.getGender())) {
			sb.append(" AND gender = ?");
			params.add(memVo.getGender());
		}
		if (StringUtils.isNotEmpty(memVo.getStatus())) {
			sb.append(" AND status = ?");
			params.add(memVo.getStatus());
		}
		try {
			return runner.query(db.getConn(), sb.toString(), rsh,
					params.toArray());
		} catch (SQLException e) {
			throw new Exception("查尋失敗" + e.getMessage());
		}
	}

	public static void main(String[] args) throws Exception {
		MemberDAO dao = new MemberDAO();
		MemberBean vo = new MemberBean();
		//vo.setBdate(java.sql.Date.valueOf("1992-08-08"));
		//vo.setGender("woman");
		//vo.setIdentification("C987654321");
		//vo.setMail("eeit000@gmail.com");
		//vo.setMem_name("Marry");
		//vo.setPwd("Marry123");
		vo.setStatus("S");
		// vo.setMem_id(7);
		// dao.update(vo);
		// dao.delete(vo);
		// dao.insert(vo);
		//List<MemberBean> results = dao.selectAll();
		List<MemberBean> results = dao.getByProperty(vo);
		for (MemberBean result : results) {
			System.out.println(result);
		}
	}

}
