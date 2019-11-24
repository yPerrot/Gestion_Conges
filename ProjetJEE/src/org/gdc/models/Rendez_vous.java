package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Rendez_vous database table.
 * 
 */
@Entity
@NamedQuery(name="Rendez_vous.findAll", query="SELECT r FROM Rendez_vous r")
public class Rendez_vous implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private Rendez_vousPK id;

	//bi-directional many-to-one association to Employe
	@ManyToOne
	@JoinColumn(name="login")
	private Employe employe;

	public Rendez_vous() {
	}

	public Rendez_vousPK getId() {
		return this.id;
	}

	public void setId(Rendez_vousPK id) {
		this.id = id;
	}

	public Employe getEmploye() {
		return this.employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
	}

}