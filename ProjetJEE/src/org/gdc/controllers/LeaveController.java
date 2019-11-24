package org.gdc.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gdc.models.Employee;
import org.gdc.models.Leave;
import org.gdc.repositories.EmployeeRepo;
import org.gdc.repositories.EmployeeRepoImpl;
import org.gdc.repositories.LeaveRepo;
import org.gdc.repositories.LeaveRepoImpl;

/**
 * Servlet implementation class LeaveManagerController
 */
@WebServlet("/LeaveController")
public class LeaveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private LeaveRepo leaveRepo = new LeaveRepoImpl();
	private EmployeeRepo employeeRepo = new EmployeeRepoImpl();

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
		if(session.getAttribute("username") == null) {
			response.sendRedirect(request.getContextPath() + "/AuthController");
		} else {
			System.out.println("username " + (String) session.getAttribute("username"));
			Employee emp = employeeRepo.getEmployee((String) session.getAttribute("username"));
			List<Leave> listLeaves = leaveRepo.getLeaves(emp);
			request.setAttribute("emp", emp);
			request.setAttribute("listLeaves", listLeaves);
			this.getServletContext().getRequestDispatcher("/GestionCongesPerso.jsp").forward( request, response );
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
