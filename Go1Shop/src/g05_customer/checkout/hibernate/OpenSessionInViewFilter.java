package g05_customer.checkout.hibernate;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;


//@WebFilter(
//		urlPatterns={"/_07_checkout/*"}
//) 

public class OpenSessionInViewFilter implements Filter {
	private FilterConfig filterConfig;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		try {
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			//System.out.println("11111");
			chain.doFilter(request, response);
			//System.out.println("22222");
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			//System.out.println("33333");
		} catch (HibernateException e) {
			e.printStackTrace();
			//System.out.println("44444");
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			chain.doFilter(request, response);
		}
	}
	@Override
	public void destroy() {

	}
}
