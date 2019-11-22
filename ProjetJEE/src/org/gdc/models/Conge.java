package org.gdc.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * The persistent class for the Conge database table.
 * 
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
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
}