package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Ref_Fonction database table.
 * 
 */
@Entity
@NamedQuery(name="Ref_Fonction.findAll", query="SELECT r FROM Ref_Fonction r")
public class Ref_Fonction implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="nom_fonction")
	private String nomFonction;

	//bi-directional many-to-one association to Employe
	@OneToMany(mappedBy="refFonction")
	private List<Employe> employes;

	public Ref_Fonction() {
	}

	public String getNomFonction() {
		return this.nomFonction;
	}

	public void setNomFonction(String nomFonction) {
		this.nomFonction = nomFonction;
	}

	public List<Employe> getEmployes() {
		return this.employes;
	}

	public void setEmployes(List<Employe> employes) {
		this.employes = employes;
	}

	public Employe addEmploye(Employe employe) {
		getEmployes().add(employe);
		employe.setRefFonction(this);

		return employe;
	}

	public Employe removeEmploye(Employe employe) {
		getEmployes().remove(employe);
		employe.setRefFonction(null);

		return employe;
	}

}