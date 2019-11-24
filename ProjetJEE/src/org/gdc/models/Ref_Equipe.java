package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Ref_Equipes database table.
 * 
 */
@Entity
@Table(name="Ref_Equipes")
@NamedQuery(name="Ref_Equipe.findAll", query="SELECT r FROM Ref_Equipe r")
public class Ref_Equipe implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="nom_equipe")
	private String nomEquipe;

	//bi-directional many-to-one association to Employe
	@OneToMany(mappedBy="refEquipe")
	private List<Employe> employes;

	public Ref_Equipe() {
	}

	public String getNomEquipe() {
		return this.nomEquipe;
	}

	public void setNomEquipe(String nomEquipe) {
		this.nomEquipe = nomEquipe;
	}

	public List<Employe> getEmployes() {
		return this.employes;
	}

	public void setEmployes(List<Employe> employes) {
		this.employes = employes;
	}

	public Employe addEmploye(Employe employe) {
		getEmployes().add(employe);
		employe.setRefEquipe(this);

		return employe;
	}

	public Employe removeEmploye(Employe employe) {
		getEmployes().remove(employe);
		employe.setRefEquipe(null);

		return employe;
	}

}