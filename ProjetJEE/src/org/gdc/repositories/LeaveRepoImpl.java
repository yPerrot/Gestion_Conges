package org.gdc.repositories;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.gdc.models.Conge;
import org.gdc.models.Employe;

@Stateless
public class LeaveRepoImpl {

	public List<Conge> getLeaves(String username) {
		EntityManagerFactory entityManagerFactory = null;
		EntityManager entityManager = null;
		List<Conge> listLeaves = new ArrayList<Conge>();
		try {
			entityManagerFactory = Persistence.createEntityManagerFactory("ProjetJEE");
			entityManager = entityManagerFactory.createEntityManager();
			
//			Query query = entityManager.createQuery("select c from Conge c where c.login = :username") ;
//			List<Employe> a = entityManager.createNamedQuery("Employe.findAll").getResultList();
			List<Employe> a = entityManager.createQuery("select c.login from Employe c").getResultList();
//			query.setParameter("username", username);
			System.out.println("a" + a);

			for (Conge article : listLeaves) {
				System.out.println( article );
			}
		} finally {
			if ( entityManager != null ) entityManager.close();
			if ( entityManagerFactory != null ) entityManagerFactory.close();
		}

/*
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Conge> listLeaves = new ArrayList<Conge>();
		try {
			conn = DBManager.getInstance().getConnection();
			if (conn != null) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT * FROM Authentification");
				for (Iterator i = ((SQLException) rs).iterator(); i.hasNext();) {
					Conge conge = (Conge) i.next();
					System.out.println("Conge " + conge.getMotif());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				DBManager.getInstance().cleanup(conn, stmt, rs);
			}
		}*/
		return listLeaves;
	}


}
