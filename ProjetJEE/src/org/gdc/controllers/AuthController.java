package org.gdc.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gdc.repositories.AuthRepo;
import org.gdc.repositories.AuthRepoImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/AuthController")
public class AuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AuthRepo authRepo = new AuthRepoImpl();
       
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
		this.getServletContext().getRequestDispatcher("/Authentification.jsp").forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // read form fields
        String username = request.getParameter("inputUser");
        String password = request.getParameter("inputPassword");
        
        String realPass = authRepo.getPassword(username);
        if(password.equals(realPass)) {
            HttpSession session = request.getSession();
            session.setAttribute("session", "on");
            session.setAttribute("username", username);
        	response.sendRedirect(request.getContextPath() + "/LeaveController");
        } else {
        	System.out.println("Erreur de mot de passe");
        	response.sendRedirect(request.getContextPath() + "/Authentification.jsp");
        }
	}

}
