package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Ref_Type_Conges database table.
 * 
 */
@Entity
@Table(name="Ref_Type_Conges")
@NamedQuery(name="Ref_Type_Conge.findAll", query="SELECT r FROM Ref_Type_Conge r")
public class Ref_Type_Conge implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="type_conges")
	private String typeConges;

	//bi-directional many-to-one association to Conge
	@OneToMany(mappedBy="refTypeConge")
	private List<Conge> conges;

	public Ref_Type_Conge() {
	}

	public String getTypeConges() {
		return this.typeConges;
	}

	public void setTypeConges(String typeConges) {
		this.typeConges = typeConges;
	}

	public List<Conge> getConges() {
		return this.conges;
	}

	public void setConges(List<Conge> conges) {
		this.conges = conges;
	}

	public Conge addConge(Conge conge) {
		getConges().add(conge);
		conge.setRefTypeConge(this);

		return conge;
	}

	public Conge removeConge(Conge conge) {
		getConges().remove(conge);
		conge.setRefTypeConge(null);

		return conge;
	}

}