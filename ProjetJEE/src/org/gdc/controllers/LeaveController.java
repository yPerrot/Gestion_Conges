package org.gdc.controllers;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gdc.models.Conge;
import org.gdc.repositories.LeaveRepo;
import org.gdc.repositories.LeaveRepoImpl;

/**
 * Servlet implementation class LeaveManagerController
 */
@WebServlet("/LeaveController")
public class LeaveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private LeaveRepo leaveRepo = new LeaveRepoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LeaveController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session == null) {
			response.sendRedirect(request.getContextPath() + "/AuthController");
		} else {
			System.out.println("username " + (String) session.getAttribute("username"));
			List<Conge> listLeaves = leaveRepo.getLeaves((String) session.getAttribute("username"));
			request.setAttribute( "listLeaves", listLeaves);
			System.out.println("LiST" + listLeaves);
			this.getServletContext().getRequestDispatcher("/User.jsp").forward( request, response );
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
