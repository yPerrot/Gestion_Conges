package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * The persistent class for the Rendez_vous database table.
 * 
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@NamedQuery(name="Rendez_vous.findAll", query="SELECT r FROM Rendez_vous r")
public class Rendez_vous implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private Rendez_vousPK id;

	//bi-directional many-to-one association to Employe
	@ManyToOne
	@JoinColumn(name="login")
	private Employe employe;
}