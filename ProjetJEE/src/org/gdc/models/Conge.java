package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Conge database table.
 * 
 */
@Entity
@NamedQuery(name="Conge.findAll", query="SELECT c FROM Conge c")
public class Conge implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private CongePK id;

	private String commentaire;

	@Temporal(TemporalType.DATE)
	@Column(name="date_fin")
	private Date dateFin;

	@Temporal(TemporalType.DATE)
	@Column(name="date_validation")
	private Date dateValidation;

	private int duree;

	private String etat;

	private String motif;

	@Column(name="type_conges")
	private String typeConges;

	//bi-directional many-to-one association to Employe
	@ManyToOne
	@JoinColumn(name="login")
	private Employe employe;

	public Conge() {
	}

	public CongePK getId() {
		return this.id;
	}

	public void setId(CongePK id) {
		this.id = id;
	}

	public String getCommentaire() {
		return this.commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public Date getDateFin() {
		return this.dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	public Date getDateValidation() {
		return this.dateValidation;
	}

	public void setDateValidation(Date dateValidation) {
		this.dateValidation = dateValidation;
	}

	public int getDuree() {
		return this.duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public String getEtat() {
		return this.etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public String getMotif() {
		return this.motif;
	}

	public void setMotif(String motif) {
		this.motif = motif;
	}

	public String getTypeConges() {
		return this.typeConges;
	}

	public void setTypeConges(String typeConges) {
		this.typeConges = typeConges;
	}

	public Employe getEmploye() {
		return this.employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
	}

}