package org.gdc.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.gdc.models.Employee;
import org.gdc.repositories.EmployeeRepo;
import org.gdc.repositories.EmployeeRepoImpl;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet("/EmployeeCreateController")
public class EmployeeCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, String> errors = new HashMap<String, String>();
	
	private EmployeeRepo employeeRepo = new EmployeeRepoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeCreateController() {
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
			Employee emp = employeeRepo.getEmployee((String) session.getAttribute("username"));
			request.setAttribute("emp", emp);

			this.getServletContext().getRequestDispatcher("/NouvelleFiche.jsp").forward( request, response );
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee emp = employeeRepo.getEmployee((String) session.getAttribute("username"));
		request.setAttribute("emp", emp);
		
		String login = request.getParameter("login");
		String name = request.getParameter("name");
		String familyName = request.getParameter("familyName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipCode");
		String mail = request.getParameter("mail");
		String team = request.getParameter("team");
		String role = request.getParameter("role");
		int nbLeaves = Integer.parseInt(request.getParameter("nbLeaves"));

		Employee newEmp = new Employee(login, name, familyName, address, city, zipCode, team, role, mail, nbLeaves);
		employeeRepo.addEmployee(newEmp);
		
		this.getServletContext().getRequestDispatcher("/EmployeeController").forward( request, response );
	}

}
