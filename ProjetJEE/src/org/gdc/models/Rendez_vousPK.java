package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the Rendez_vous database table.
 * 
 */
@Embeddable
public class Rendez_vousPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private String login;

	@Temporal(TemporalType.DATE)
	@Column(name="date_rdv")
	private java.util.Date dateRdv;

	private String libelle;

	public Rendez_vousPK() {
	}
	public String getLogin() {
		return this.login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public java.util.Date getDateRdv() {
		return this.dateRdv;
	}
	public void setDateRdv(java.util.Date dateRdv) {
		this.dateRdv = dateRdv;
	}
	public String getLibelle() {
		return this.libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof Rendez_vousPK)) {
			return false;
		}
		Rendez_vousPK castOther = (Rendez_vousPK)other;
		return 
			this.login.equals(castOther.login)
			&& this.dateRdv.equals(castOther.dateRdv)
			&& this.libelle.equals(castOther.libelle);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.login.hashCode();
		hash = hash * prime + this.dateRdv.hashCode();
		hash = hash * prime + this.libelle.hashCode();
		
		return hash;
	}
}