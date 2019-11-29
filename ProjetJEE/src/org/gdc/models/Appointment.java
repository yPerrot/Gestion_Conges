package org.gdc.models;

import java.util.Date;

public class Appointment {
	private Employee employe;
	private Date apptDate;
	private String wording;

	public Appointment() {
	}

	public Appointment(Employee employe, Date apptDate, String wording) {
		this.employe = employe;
		this.apptDate = apptDate;
		this.wording = wording;
	}

	public Employee getEmploye() {
		return employe;
	}

	public void setEmploye(Employee employe) {
		this.employe = employe;
	}

	public Date getApptDate() {
		return apptDate;
	}

	public void setApptDate(Date apptDate) {
		this.apptDate = apptDate;
	}

	public String getWording() {
		return wording;
	}

	public void setWording(String wording) {
		this.wording = wording;
	}

	@Override
	public String toString() {
		return "Rendez_vous [employe=" + employe + ", apptDate=" + apptDate + ", wording=" + wording + "]";
	}
}