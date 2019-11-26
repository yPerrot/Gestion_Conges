package org.gdc.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.gdc.models.Employee;
import org.gdc.models.Leave;
import org.testProject.DBManager;


public class EmployeeRepoImpl implements EmployeeRepo {

	@Override
	public Employee getEmployee(String username) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Employee emp = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("SELECT * FROM Employe WHERE login = ?"); 
				stmt.setString(1, username);
				rs = stmt.executeQuery();
				while (rs.next()) {
					emp = new Employee(rs.getString("login"), rs.getString("pnom"), rs.getString("nom"), rs.getString("adresse"), rs.getString("ville"), rs.getString("code_postal"), rs.getString("equipe"), rs.getString("fonction"), rs.getString("mail"), rs.getInt("solde_conges"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}
		return emp;
	}

	@Override
	public void actualizeRemainingBalance(Employee emp, int newRemainingBalance) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("UPDATE Employe SET solde_conges = ? WHERE login = ?");
				stmt.setInt(1, newRemainingBalance);
				stmt.setString(2, emp.getLogin());
				stmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}		
	}

}
