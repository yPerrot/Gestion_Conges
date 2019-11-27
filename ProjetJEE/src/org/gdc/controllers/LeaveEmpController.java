package org.gdc.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.gdc.repositories.LeaveRepo;
import org.gdc.repositories.LeaveRepoImpl;

/**
 * Servlet implementation class LeaveEmpController
 */
@WebServlet("/LeaveEmpController")
public class LeaveEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, String> errors = new HashMap<String, String>();
	
	private LeaveRepo leaveRepo = new LeaveRepoImpl();
	private EmployeeRepo employeeRepo = new EmployeeRepoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveEmpController() {
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
			List<Leave> listLeavesToValid = leaveRepo.getLeavesByState(emp, "En attente");
			List<Leave> listLeavesValidated = leaveRepo.getLeavesByState(emp, "Valide");
			request.setAttribute("emp", emp);
			request.setAttribute("listLeavesToValid", listLeavesToValid);
			request.setAttribute("listLeavesValidated", listLeavesValidated);

			if (request.getParameter("action") != null) {
				switch (request.getParameter("action")) {
				case "accept":
					Date accBeginDate = null;
					try {
						accBeginDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("upBday"));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					Leave accLeave = leaveRepo.getLeave(request.getParameter("upLogin"), accBeginDate);
					accLeave.setState("Valide");
					accLeave.setValidDate(new Date());
					accLeave.setWording(request.getParameter("upWording"));
					leaveRepo.updateLeave(accLeave, accLeave.getBeginDate());
					Employee updateEmp = employeeRepo.getEmployee(accLeave.getLogin());
					employeeRepo.actualizeRemainingBalance(updateEmp, updateEmp.getNbLeaves() - accLeave.getDuration());
					break;

				case "decline":
					Date decBeginDate = null;
					try {
						decBeginDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("upBday"));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					Leave decLeave = leaveRepo.getLeave(request.getParameter("upLogin"), decBeginDate);
					decLeave.setState("Refuse");
					decLeave.setValidDate(new Date());
					decLeave.setWording(request.getParameter("upWording"));
					
					//check wording field filled
					try {
						if(request.getParameter("upWording").isEmpty()) {
							throw new Exception( "Le Commentaire est obligatoire en cas de refus de la demande" );
						} else {
							leaveRepo.updateLeave(decLeave, decLeave.getBeginDate());
						}
					} catch ( Exception e ) {
						errors.put("wording", e.getMessage());
						request.setAttribute("errors", errors);
						this.getServletContext().getRequestDispatcher("/LeaveEmpController").forward( request, response );
					}
					break;
				}
				response.sendRedirect(request.getContextPath() + "/LeaveEmpController");
			} else {
				this.getServletContext().getRequestDispatcher("/GestionCongesEmployes.jsp").forward( request, response );
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
