package org.gdc.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gdc.services.AuthService;
import org.gdc.services.AuthServiceImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AuthService authService = new AuthServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // read form fields
        String username = request.getParameter("inputUser");
        String password = request.getParameter("inputPassword");
        
        // TODO : INCLURE ICI LE CODE DE Authentification.java
        
        String realPass = authService.getPasswordByUser(username);
        if(password.equals(realPass)) {
            HttpSession session = request.getSession();
            session.setAttribute("session", "on");
        	response.sendRedirect(request.getContextPath() + "/User");
        } else {
        	System.out.println("Erreur de mot de passe");
        	response.sendRedirect(request.getContextPath() + "/Authen.jsp");
        }
	}

}
