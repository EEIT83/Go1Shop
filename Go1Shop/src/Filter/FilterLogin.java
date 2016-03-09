package Filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import g01_login.controller.MemberBean;

/**
 * Servlet Filter implementation class FilterLogin
 */
@WebFilter(

		urlPatterns = { "/*"}, 
		

		initParams = { 
		@WebInitParam(name = "url_checkDetail", value = "/g05_customer/checkout/checkDetail.jsp"),
		@WebInitParam(name = "url_success", value = "/g05_customer/checkout/success.jsp"),
		@WebInitParam(name = "url_buyProd", value = "/g05_customer/shoppingCar/controller/BuyProServlet.con")
		
		}
)
public class FilterLogin implements Filter {
	String contextPath;
	Collection<String> url = new ArrayList<>();
	public FilterLogin() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		//System.out.println(123);
		
		contextPath = req.getContextPath();
		//System.out.println("contextPath="+contextPath);
		String servletPath = req.getServletPath();
		//System.out.println("servletPath=" + servletPath);
		if (mustLogin(servletPath)) {
			if (checkLogin(req)) {
				chain.doFilter(request, response);
			} else {
				HttpSession session = req.getSession();
				session.setAttribute("target", servletPath);
				resp.sendRedirect(contextPath + "/g01_login/Login.jsp");
//				RequestDispatcher rd = req
//						.getRequestDispatcher("/_01_login/login.jsp");
//				rd.forward(request, response);

			}
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {				
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			//System.out.println("123");
			String name = e.nextElement();
			//System.out.println(fConfig.getInitParameter(name));
			url.add(fConfig.getInitParameter(name));
		}
	}
	
	private boolean mustLogin(String servletPath){
		boolean login = false;
		for(String sURL:url){
			//System.out.println("sURL="+sURL.endsWith("*"));
			if(sURL.endsWith("*")){
				sURL = sURL.substring(0,sURL.length()-1);
				if(servletPath.startsWith(sURL)){
					login = true;
					break;
				}
			}else{
				if(servletPath.equals(sURL)){
					login= true;
					break;
				}
			}
		}
		return login;
	}

	public boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberBean ch = (MemberBean)session.getAttribute("LoginOK");
		//System.out.println(ch);
		if (ch == null) {
			return false;
		} else {
			return true;
		}
	}

}
