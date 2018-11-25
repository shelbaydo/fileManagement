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

import daoImpl.UserDao;
import entity.User;

public class AddNotesFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterchain) throws IOException, ServletException {
		 HttpServletRequest requ = (HttpServletRequest)request;
		  HttpServletResponse resp = (HttpServletResponse)response;
		  HttpSession session = requ.getSession(true);
		  User user = (User)session.getAttribute("currentUser");
		  UserDao userDao = new UserDao();
		  if(userDao.isCourseExsit(user.getUserId())){
		  	filterchain.doFilter(request,response);
		  }
		  else {
			  resp.sendRedirect("/fileManagement/index.jsp");
		  }
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
