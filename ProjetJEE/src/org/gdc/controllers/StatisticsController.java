package org.gdc.controllers;

import java.io.IOException;
import java.util.ArrayList;
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
import org.gdc.repositories.LeaveRepo;
import org.gdc.repositories.LeaveRepoImpl;

/**
 * Servlet implementation class StatisticsController
 */
@WebServlet("/StatisticsController")
public class StatisticsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, String> errors = new HashMap<String, String>();
	
	private LeaveRepo leaveRepo = new LeaveRepoImpl();
	private EmployeeRepo employeeRepo = new EmployeeRepoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticsController() {
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
			
			List<Integer> data1 = new ArrayList<Integer>();
			data1.add(leaveRepo.countLeavesByState("Valide"));
			data1.add(leaveRepo.countLeavesByState("Refuse"));
			data1.add(leaveRepo.countLeavesByState("En attente"));
			List<Integer> data2 = new ArrayList<Integer>();
			data2.add(leaveRepo.countLeavesByMonth(1));
			data2.add(leaveRepo.countLeavesByMonth(2));
			data2.add(leaveRepo.countLeavesByMonth(3));
			data2.add(leaveRepo.countLeavesByMonth(4));
			data2.add(leaveRepo.countLeavesByMonth(5));
			data2.add(leaveRepo.countLeavesByMonth(6));
			data2.add(leaveRepo.countLeavesByMonth(7));
			data2.add(leaveRepo.countLeavesByMonth(8));
			data2.add(leaveRepo.countLeavesByMonth(9));
			data2.add(leaveRepo.countLeavesByMonth(10));
			data2.add(leaveRepo.countLeavesByMonth(11));
			data2.add(leaveRepo.countLeavesByMonth(12));
			List<Integer> data3 = new ArrayList<Integer>();
			data3.add(employeeRepo.countEmployeesByTeam("Comptabilite"));
			data3.add(employeeRepo.countEmployeesByTeam("Informatique"));
			data3.add(employeeRepo.countEmployeesByTeam("RH"));
			request.setAttribute("data1", data1);
			request.setAttribute("data2", data2);
			request.setAttribute("data3", data3);

			this.getServletContext().getRequestDispatcher("/Statistiques.jsp").forward( request, response );
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
