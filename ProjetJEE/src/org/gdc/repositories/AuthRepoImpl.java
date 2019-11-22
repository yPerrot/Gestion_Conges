package org.gdc.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.testProject.DBManager;

public class AuthRepoImpl implements AuthRepo {

	@Override
	public String getPasswordByUser(String username) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String realPass = null;
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT * FROM Authentification");
				while (rs.next()) {
					String login = rs.getString("login");
					String password = rs.getString("password");
					if(username.equals(login)) {
						realPass = password;
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
		return realPass;
	}


}
