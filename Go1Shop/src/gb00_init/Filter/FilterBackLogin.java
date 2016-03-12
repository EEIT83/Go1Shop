package gb00_init.Filter;

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
import gb01_login.controller.AdminBean;

/**
 * Servlet Filter implementation class FilterLogin
 */
@WebFilter(

		urlPatterns = { "/*"}, 
		

		initParams = { 
		@WebInitParam(name = "url_backMarketing", value = "/gb04_marketing/backMarketing.jsp"),
		@WebInitParam(name = "url_backCommentsManage", value = "/gb03_msgboard/backCommentsManage.jsp"),
		@WebInitParam(name = "url_backMember", value = "/gb02_member/backMember.jsp"),
//		@WebInitParam(name = "url_backChangePwd", value = "/Admin/ChangePwd.controller?pageStatus=prompt"),
		@WebInitParam(name = "url_backChangePwd", value = "/gb02_member/ChangeAdPwd.jsp"),
		
		
		}
)
public class FilterBackLogin implements Filter {
	String contextPath;
	Collection<String> url = new ArrayList<>();
	public FilterBackLogin() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//request.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		//req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8;");

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
				
				//resp.getWriter().write("<script>charset='UTF-8'; alert('請先登入!') ; location.href='/Go1Shop/backLogin.jsp'; </script>");
				
				resp.setCharacterEncoding("UTF-8");
				
				//jQuery jump
				resp.getWriter().write(
						"<script src='//code.jquery.com/jquery-1.12.0.min.js'></script><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'></script><script src='/Go1Shop/_js/sweet-alert.js'></script><link href='/Go1Shop/_css/sweet-alert.css' rel='stylesheet'><script>charset='UTF-8';window.onload=function(){$(function() {	swal({ title: '請先登入!',  type: 'error', confirmButtonClass: 'btn-primary', confirmButtonText: '確定',  closeOnConfirm: false,},function(isConfirm) {  if (isConfirm) {window.location.replace('/Go1Shop/backLogin.jsp'); } });})}</script>");

				
				//alert
				//resp.getWriter().write("<script>charset='UTF-8'; alert('請先登入!') ; location.href='/Go1Shop/backLogin.jsp'; </script>");

				
//				resp.sendRedirect(contextPath + "/backLogin.jsp");
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
			System.out.println("123");
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
		AdminBean ch = (AdminBean)session.getAttribute("bLoginOK");
		//System.out.println(ch);
		if (ch == null) {
			return false;
		} else {
			return true;
		}
	}

}
