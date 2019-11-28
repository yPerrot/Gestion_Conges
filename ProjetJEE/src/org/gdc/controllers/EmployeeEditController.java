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
import org.gdc.models.Leave;
import org.gdc.repositories.EmployeeRepo;
import org.gdc.repositories.EmployeeRepoImpl;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet("/EmployeeEditController")
public class EmployeeEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, String> errors = new HashMap<String, String>();
	
	private EmployeeRepo employeeRepo = new EmployeeRepoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeEditController() {
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
			
			Employee e = employeeRepo.getEmployee(request.getParameter("login"));
			request.setAttribute("e", e);
			session.setAttribute("e", e);
			
			this.getServletContext().getRequestDispatcher("/ModificationFiche.jsp").forward( request, response );
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee emp = employeeRepo.getEmployee((String) session.getAttribute("username"));
		request.setAttribute("emp", emp);
		
		Employee oldEmp = (Employee) session.getAttribute("e");
		Employee employee = employeeRepo.getEmployee(oldEmp.getLogin());
		employee.setLogin(request.getParameter("login"));
		employee.setFname(request.getParameter("name"));
		employee.setName(request.getParameter("familyName"));
		employee.setAddress(request.getParameter("address"));
		employee.setCity(request.getParameter("city"));
		employee.setZipCode(request.getParameter("zipCode"));
		employee.setMail(request.getParameter("mail"));
		employee.setTeam(request.getParameter("team"));
		employee.setRole(request.getParameter("role"));
		employee.setNbLeaves(Integer.parseInt(request.getParameter("nbLeaves")));
		employeeRepo.updateEmployee(employee, oldEmp.getLogin());
		session.setAttribute("e", employee);
		
		this.getServletContext().getRequestDispatcher("/EmployeeController").forward( request, response );
	}

}
