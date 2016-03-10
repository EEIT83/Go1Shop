package gb01_login.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.lang3.StringUtils;

import g01_login.model.SQLserver;
import gb01_login.controller.AdminBean;
import gb01_login.controller.AdminFace;

public class AdminDAO implements AdminFace {

	private String SELECT_ID = "select * from admin where ad_mail=?";
	private String SELECT_ALL = "select * from admin WHERE competence > 1";
	private String INSERT = "insert into admin (ad_mail, ad_pwd, competence) values (?, ?, ?)";
	private String UPDATE = "update admin set ad_pwd=? where ad_mail=? ";
	private String DELETE = "DELETE FROM admin WHERE ad_mail=? ";

	SQLserver db;
	QueryRunner runner;

	public AdminDAO() throws Exception {
		db = new SQLserver();
		runner = new QueryRunner();
	}

	@Override
	public void insert(AdminBean AdVo) throws Exception {
		try {
			if (AdVo != null) {
				Object params[] = { AdVo.getAd_mail(), AdVo.getAd_pwd(),
						AdVo.getCompetence() };
				runner.update(db.getConn(), INSERT, params);
			}
		} catch (SQLException e) {
			throw new Exception("新增失敗");
		}
	}

	@Override
	public AdminBean selectById(String mail) throws Exception {
		try {
			ResultSetHandler<List<AdminBean>> rsh = new BeanListHandler<AdminBean>(
					AdminBean.class);
			Object params[] = { mail };
			List<AdminBean> result = runner.query(db.getConn(), SELECT_ID, rsh,
					params);
			if (result.size() <= 0) {
				System.out.println("result.size()=" + result.size());
				return null;
			} else {
				return result.get(0);
			}
		} catch (SQLException e) {
			return null;
		}
	}

	@Override
	public List<AdminBean> selectAll() throws Exception {
		try {
			ResultSetHandler<List<AdminBean>> rsh = new BeanListHandler<AdminBean>(
					AdminBean.class);
			List<AdminBean> result = runner
					.query(db.getConn(), SELECT_ALL, rsh);
			if (result.size() <= 0) {
				return null;
			} else {
				return result;
			}
		} catch (SQLException e) {
			throw new Exception("查不到此資料" + e.getMessage());
		}
	}

	@Override
	public int delete(String mail) throws Exception {

		Object[] params = { mail };
		return runner.update(db.getConn(), DELETE, params);
	}

	@Override
	public void update(String mail , String pwd) throws Exception {
		Object[] params = { pwd, mail };

		int count = runner.update(db.getConn(), UPDATE, params);
		if (count <= 0) {
			throw new Exception("Update error");
		}
	}

	// public List<AdminBean> getByProperty(AdminBean AdVo) throws Exception {
	// ResultSetHandler<List<AdminBean>> rsh = new BeanListHandler<AdminBean>(
	// AdminBean.class);
	// List<Object> params = new ArrayList<Object>();
	// StringBuilder sb = new
	// StringBuilder("select * from admin where competence > 1");
	// if (StringUtils.isNotEmpty(AdVo.getAd_mail())){
	// sb.append(" AND ad_mail=?");
	// params.add(AdVo.getAd_mail());
	// }
	// if (StringUtils.isNotEmpty(AdVo.getAd_name())) {
	// sb.append(" AND ad_name Like ?");
	// params.add("%" + AdVo.getAd_name() + "%");
	// }
	// try {
	// return runner.query(db.getConn(), sb.toString(), rsh,
	// params.toArray());
	// } catch (Exception e) {
	// e.printStackTrace();
	// throw new Exception("查尋失敗" + e.getMessage());
	// }
	// }

	public static void main(String[] args) throws Exception {
		AdminBean bean = new AdminBean();
		AdminDAO dao = new AdminDAO();
		//bean.setAd_mail("test@gmail.com");
		// bean.setAd_pwd("test@gmail.com");
		// bean.setAd_name("test");
		// bean.setCompetence(2);
//		dao.update("abc@gmail.com", "a");
//		System.out.println(bean);
		// dao.delete("");
		// dao.insert(bean);
		// List<AdminBean> results = dao.getByProperty(bean);
//		 for (AdminBean result : results) {
//		 System.out.println(result);
//		 }

	}

}
