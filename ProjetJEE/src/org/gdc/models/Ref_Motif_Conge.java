package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Ref_Motif_Conges database table.
 * 
 */
@Entity
@Table(name="Ref_Motif_Conges")
@NamedQuery(name="Ref_Motif_Conge.findAll", query="SELECT r FROM Ref_Motif_Conge r")
public class Ref_Motif_Conge implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="motif_conges")
	private String motifConges;

	//bi-directional many-to-one association to Conge
	@OneToMany(mappedBy="refMotifConge")
	private List<Conge> conges;

	public Ref_Motif_Conge() {
	}

	public String getMotifConges() {
		return this.motifConges;
	}

	public void setMotifConges(String motifConges) {
		this.motifConges = motifConges;
	}

	public List<Conge> getConges() {
		return this.conges;
	}

	public void setConges(List<Conge> conges) {
		this.conges = conges;
	}

	public Conge addConge(Conge conge) {
		getConges().add(conge);
		conge.setRefMotifConge(this);

		return conge;
	}

	public Conge removeConge(Conge conge) {
		getConges().remove(conge);
		conge.setRefMotifConge(null);

		return conge;
	}

}