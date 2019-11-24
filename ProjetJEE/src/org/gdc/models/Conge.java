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

	//bi-directional many-to-one association to Employe
	@ManyToOne
	@JoinColumn(name="login")
	private Employe employe;

	//bi-directional many-to-one association to Ref_Type_Conge
	@ManyToOne
	@JoinColumn(name="type_conges")
	private Ref_Type_Conge refTypeConge;

	//bi-directional many-to-one association to Ref_Motif_Conge
	@ManyToOne
	@JoinColumn(name="motif")
	private Ref_Motif_Conge refMotifConge;

	//bi-directional many-to-one association to Ref_Etat_Conge
	@ManyToOne
	@JoinColumn(name="etat")
	private Ref_Etat_Conge refEtatConge;

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

	public Employe getEmploye() {
		return this.employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
	}

	public Ref_Type_Conge getRefTypeConge() {
		return this.refTypeConge;
	}

	public void setRefTypeConge(Ref_Type_Conge refTypeConge) {
		this.refTypeConge = refTypeConge;
	}

	public Ref_Motif_Conge getRefMotifConge() {
		return this.refMotifConge;
	}

	public void setRefMotifConge(Ref_Motif_Conge refMotifConge) {
		this.refMotifConge = refMotifConge;
	}

	public Ref_Etat_Conge getRefEtatConge() {
		return this.refEtatConge;
	}

	public void setRefEtatConge(Ref_Etat_Conge refEtatConge) {
		this.refEtatConge = refEtatConge;
	}

}