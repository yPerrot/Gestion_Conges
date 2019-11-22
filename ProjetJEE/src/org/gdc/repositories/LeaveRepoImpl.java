package org.gdc.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.gdc.models.Conge;
import org.testProject.DBManager;

public class LeaveRepoImpl implements LeaveRepo {

	@Override
	public List<Conge> getLeaves(String username) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Conge> listLeaves = new ArrayList<Conge>();
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT * FROM Authentification");
				while (rs.next()) {
					String login = rs.getString("login");
					String begin_date = rs.getString("date_debut");
					String end_date = rs.getString("date_fin");
					int duration = rs.getInt("date_debut");
					String reason = rs.getString("motif");
					String type_leave = rs.getString("type_conges");
					String state = rs.getString("etat");
					String valid_date = rs.getString("date_validation");
					String comment = rs.getString("commentaire");
					if(username.equals(login)) {
						Conge conge = Conge.builder()
						.login(login)
						.date_debut(begin_date)
						.date_fin(end_date)
						.duree(duration)
						.motif(reason)
						.type_conges(type_leave)
						.etat(state)
						.build();
						listLeaves.add(conge);
					}
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


}
