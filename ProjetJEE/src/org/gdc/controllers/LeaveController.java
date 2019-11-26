package org.gdc.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

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
			Employee emp = employeeRepo.getEmployee((String) session.getAttribute("username"));
			List<Leave> listLeaves = leaveRepo.getLeaves(emp);
			request.setAttribute("emp", emp);
			request.setAttribute("listLeaves", listLeaves);

			//DISPATCHER
			if(request.getParameter("page") != null) {
				this.getServletContext().getRequestDispatcher("/" + request.getParameter("page") + ".jsp").forward( request, response );
			} else {

				//delete leave
				if(request.getParameter("rowToDelete") != null) {
					Date beginDate = null;
					try {
						beginDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("rowToDelete"));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					Leave leaveToDelete = leaveRepo.getLeave(emp.getLogin(), beginDate);
					leaveRepo.deleteLeave(leaveToDelete);
					response.sendRedirect(request.getContextPath() + "/LeaveController");
				} else {
					this.getServletContext().getRequestDispatcher("/GestionCongesPerso.jsp").forward( request, response );

				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee emp = employeeRepo.getEmployee((String) session.getAttribute("username"));
		Map<String, String> errors = new HashMap<String, String>();

		//create leave
		Date beginDate = null, endDate = null;
		int duration = 0;
		try {
			beginDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("bday"));
			endDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("eday"));
			long diff = endDate.getTime() - beginDate.getTime();
			duration = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String motif = request.getParameter("motif");
		String type = request.getParameter("type");

		try {
			if(emp.getNbLeaves() - duration < 0) {
				throw new Exception( "Votre solde actuel ne vous permet pas de poser de nouveaux congés" );
			} else {
				Leave leave = new Leave(emp.getLogin(), beginDate, endDate, duration, motif, type, "En attente", null, null);
				leaveRepo.addLeave(leave);
				employeeRepo.actualizeRemainingBalance(emp, emp.getNbLeaves() - duration);
			}
		} catch ( Exception e ) {
			errors.put("remainingBalance", e.getMessage());
			request.setAttribute("errors", errors);
			this.getServletContext().getRequestDispatcher("/DemandeConge.jsp").forward( request, response );
		}
		doGet(request, response);
	}

}
