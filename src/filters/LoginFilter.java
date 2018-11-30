package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response,
		FilterChain filterchain) throws IOException, ServletException {
		  HttpServletRequest requ = (HttpServletRequest)request;
		  HttpServletResponse resp = (HttpServletResponse)response;
		  HttpSession session = requ.getSession(true);
		  if (session.getAttribute("currentUser") == null){
			resp.sendRedirect("/fileManagement/home/login.jsp");
		  }else {
			filterchain.doFilter(request,response);
		  }
	}
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
