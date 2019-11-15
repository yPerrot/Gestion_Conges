package org.testProject;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HelloWorld extends HttpServlet {

	private Map<String, Boolean> auth;
	
	public HelloWorld() {
		super();
		auth = new HashMap<>();
		System.out.println("Création Servlet");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		HttpSession session = request.getSession();
		System.out.println("Session id : " + session.getId());
		
		// Set JSP attributes
		request.setAttribute("UserName", "Moi");
		   
		// Redirect to jsp page
		String pageName;
		
		if ( auth.get(session.getId()) != null && auth.get(session.getId()) ) {
			pageName = "/user.jsp";
		} else {
			pageName = "/authen.jsp";
		}
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(pageName);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		auth.put(request.getSession().getId(), true);
		doGet(request, response) ;
	}
}