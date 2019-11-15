package org.testProject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Authentication extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// DEBUT TEST
		/*
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stat = conn.createStatement();
				rs = stat.executeQuery("SELECT host, user FROM mysql.user;");
				while (rs.next()) {
					String id = rs.getString("host");
					String title = rs.getString("user");
					
					System.out.println(id + " " + title );
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stat, rs);
			}
		}
		*/
		// FIN TEST
		
		
		
		// If there is no session set, don't create a new one
		HttpSession session = req.getSession(false);
//		HttpSession session = null;
		
		if (session == null) {
			
			System.out.println("GET SANS SESSION");
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Authen.jsp");
			try {
				rd.forward(req, resp);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			
			System.out.println("GET SESSION");
			
			// Change from request to session 
			String username = "Moi";
			req.setAttribute("UserName",username);
			resp.sendRedirect("/ProjetJEE/User");
		}

		System.out.println(session == null);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("POST");
		
		String userMail = (String) req.getParameter("inputEmail");
		String userPassword = (String) req.getParameter("inputPassword");
		
		if (userMail.equals("a@a.a") && userPassword.equals("a")) {
			// Si UserName MDP valide, créer un session et récupère les infos sur la BDD
			
			//TODO : Uncomment
			req.getSession();
			
			// TODO : Get User data from DataBase
			
			String username = "Moi";
			req.setAttribute("UserName", username);
			
			// Forward to User.jsp
			//rd = getServletContext().getRequestDispatcher("/User.jsp");
			resp.sendRedirect("/ProjetJEE/User");
			
		} else {
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Authen.jsp");
			req.setAttribute("BadAuthen", true);

			try {
				rd.forward(req, resp);
			} catch (Error e) {
				e.printStackTrace();
			}
			
		}
		
		
	}
	
}
