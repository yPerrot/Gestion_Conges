package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Ref_Etat_Conges database table.
 * 
 */
@Entity
@Table(name="Ref_Etat_Conges")
@NamedQuery(name="Ref_Etat_Conge.findAll", query="SELECT r FROM Ref_Etat_Conge r")
public class Ref_Etat_Conge implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String etat;

	//bi-directional many-to-one association to Conge
	@OneToMany(mappedBy="refEtatConge")
	private List<Conge> conges;

	public Ref_Etat_Conge() {
	}

	public String getEtat() {
		return this.etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public List<Conge> getConges() {
		return this.conges;
	}

	public void setConges(List<Conge> conges) {
		this.conges = conges;
	}

	public Conge addConge(Conge conge) {
		getConges().add(conge);
		conge.setRefEtatConge(this);

		return conge;
	}

	public Conge removeConge(Conge conge) {
		getConges().remove(conge);
		conge.setRefEtatConge(null);

		return conge;
	}

}