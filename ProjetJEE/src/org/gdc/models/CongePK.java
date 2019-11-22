package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the Conge database table.
 * 
 */
@Embeddable
public class CongePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private String login;

	@Temporal(TemporalType.DATE)
	@Column(name="date_debut")
	private java.util.Date dateDebut;

	public CongePK() {
	}
	public String getLogin() {
		return this.login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public java.util.Date getDateDebut() {
		return this.dateDebut;
	}
	public void setDateDebut(java.util.Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof CongePK)) {
			return false;
		}
		CongePK castOther = (CongePK)other;
		return 
			this.login.equals(castOther.login)
			&& this.dateDebut.equals(castOther.dateDebut);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.login.hashCode();
		hash = hash * prime + this.dateDebut.hashCode();
		
		return hash;
	}
}