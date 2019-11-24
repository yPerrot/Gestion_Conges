package org.gdc.models;

public class Employee {
	private String login;
	private String fname;
	private String name;
	private String address;
	private String city;
	private String zipCode;
	private String team;
	private String role;
	private String mail;
	private int nbLeaves;

	public Employee() {
	}

	public Employee(String login, String fname, String name, String address, String city, String zipCode, String team,
			String role, String mail, int nbLeaves) {
		this.login = login;
		this.fname = fname;
		this.name = name;
		this.address = address;
		this.city = city;
		this.zipCode = zipCode;
		this.team = team;
		this.role = role;
		this.mail = mail;
		this.nbLeaves = nbLeaves;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public int getNbLeaves() {
		return nbLeaves;
	}

	public void setNbLeaves(int nbLeaves) {
		this.nbLeaves = nbLeaves;
	}

	@Override
	public String toString() {
		return "Employee [login=" + login + ", fname=" + fname + ", name=" + name + ", address=" + address + ", city="
				+ city + ", zipCode=" + zipCode + ", team=" + team + ", role=" + role + ", mail=" + mail + ", leaves="
				+ nbLeaves + "]";
	}
}