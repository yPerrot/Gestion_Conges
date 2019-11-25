package org.gdc.models;

import java.util.Date;

public class Leave {
	private String login;
	private Date beginDate;
	private Date endDate;
	private int duration;
	private String reason;
	private String type;
	private String state;
	private Date validDate;
	private String wording;
	
	public Leave() {
	}

	public Leave(String login, Date beginDate, Date endDate, int duration, String reason, String type,
			String state, Date validDate, String wording) {
		this.login = login;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.duration = duration;
		this.reason = reason;
		this.type = type;
		this.state = state;
		this.validDate = validDate;
		this.wording = wording;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getValidDate() {
		return validDate;
	}

	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}

	public String getWording() {
		return wording;
	}

	public void setWording(String wording) {
		this.wording = wording;
	}

	@Override
	public String toString() {
		return "Leave [login=" + login + ", beginDate=" + beginDate + ", endDate=" + endDate + ", duration="
				+ duration + ", reason=" + reason + ", type=" + type + ", state=" + state + ", validDate=" + validDate
				+ ", wording=" + wording + "]";
	}
}