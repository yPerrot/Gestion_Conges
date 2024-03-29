package org.gdc.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.gdc.models.Employee;
import org.gdc.models.Leave;
import org.testProject.DBManager;

public class LeaveRepoImpl implements LeaveRepo {

	public List<Leave> getLeaves(Employee employee) {
		List<Leave> listLeaves = new ArrayList<Leave>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("SELECT * FROM Conge WHERE login = ?");
				stmt.setString(1, employee.getLogin());
				rs = stmt.executeQuery();
				while (rs.next()) {
					listLeaves.add(new Leave(employee.getLogin(), rs.getDate("date_debut"), rs.getDate("date_fin"), rs.getInt("duree"), rs.getString("motif"), rs.getString("type_conges"), rs.getString("etat"), rs.getDate("date_validation"), rs.getString("commentaire")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}
		return listLeaves;
	}

	@Override
	public void addLeave(Leave leave) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("INSERT INTO Conge(login, date_debut, date_fin, duree, motif, type_conges, etat) VALUES(?,?,?,?,?,?,?)");
				stmt.setString(1, leave.getLogin());
				stmt.setDate(2, new java.sql.Date(leave.getBeginDate().getTime()));
				stmt.setDate(3, new java.sql.Date(leave.getEndDate().getTime()));
				stmt.setInt(4, leave.getDuration());
				stmt.setString(5, leave.getReason());
				stmt.setString(6, leave.getType());
				stmt.setString(7, leave.getState());
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

	@Override
	public Leave getLeave(String login, Date beginDate) {
		Leave leave = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("SELECT * FROM Conge WHERE login = ? and date_debut = ?");
				stmt.setString(1, login);
				stmt.setDate(2, new java.sql.Date(beginDate.getTime()));
				rs = stmt.executeQuery();
				while (rs.next()) {
					leave = new Leave(rs.getString("login"), rs.getDate("date_debut"), rs.getDate("date_fin"), rs.getInt("duree"), rs.getString("motif"), rs.getString("type_conges"), rs.getString("etat"), rs.getDate("date_validation"), rs.getString("commentaire"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}
		return leave;
	}

	@Override
	public void deleteLeave(Leave leaveToDelete) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("DELETE FROM Conge WHERE login = ? and date_debut = ?"); 
				stmt.setString(1, leaveToDelete.getLogin());
				stmt.setDate(2, new java.sql.Date(leaveToDelete.getBeginDate().getTime()));
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

	@Override
	public List<Leave> getLeavesByState(Employee employee, String state) {
		List<Leave> listLeaves = new ArrayList<Leave>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("SELECT * FROM Conge WHERE login != ? AND etat = ?");
				stmt.setString(1, employee.getLogin());
				stmt.setString(2, state);
				rs = stmt.executeQuery();
				while (rs.next()) {
					listLeaves.add(new Leave(rs.getString("login"), rs.getDate("date_debut"), rs.getDate("date_fin"), rs.getInt("duree"), rs.getString("motif"), rs.getString("type_conges"), rs.getString("etat"), rs.getDate("date_validation"), rs.getString("commentaire")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}
		return listLeaves;
	}

	@Override
	public void updateLeave(Leave leave, Date oldBeginDate) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("UPDATE Conge SET date_debut = ?, date_fin = ?, duree = ?, motif = ?, type_conges = ?, etat = ?, date_validation = ?, commentaire = ? WHERE login = ? AND date_debut = ?");
				stmt.setDate(1, new java.sql.Date(leave.getBeginDate().getTime()));
				stmt.setDate(2, new java.sql.Date(leave.getEndDate().getTime()));
				stmt.setInt(3, leave.getDuration());
				stmt.setString(4, leave.getReason());
				stmt.setString(5, leave.getType());
				stmt.setString(6, leave.getState());
				stmt.setObject(7, leave.getValidDate() != null ? new java.sql.Date(leave.getValidDate().getTime()) : null, java.sql.Types.DATE);
				stmt.setString(8, leave.getWording());
				stmt.setString(9, leave.getLogin());
				stmt.setDate(10, new java.sql.Date(oldBeginDate.getTime()));
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

	@Override
	public Integer countLeavesByState(String state) {
		int nbLeaves = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("SELECT count(*) as total FROM Conge WHERE etat = ?");
				stmt.setString(1, state);
				rs = stmt.executeQuery();
				while (rs.next()) {
					nbLeaves = rs.getInt("total");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}
		return nbLeaves;
	}

	@Override
	public Integer countLeavesByMonth(int month) {
		int nbLeaves = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.prepareStatement("SELECT count(*) as total FROM Conge WHERE MONTH(date_debut) = ?");
				stmt.setInt(1, month);
				rs = stmt.executeQuery();
				while (rs.next()) {
					nbLeaves = rs.getInt("total");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}
		return nbLeaves;
	}
}
