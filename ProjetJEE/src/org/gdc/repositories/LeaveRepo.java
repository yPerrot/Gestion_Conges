package org.gdc.repositories;

import java.util.Date;
import java.util.List;

import org.gdc.models.Employee;
import org.gdc.models.Leave;

public interface LeaveRepo {
	List<Leave> getLeaves(Employee employee);
	void addLeave(Leave leave);
	Leave getLeave(String login, Date beginDate);
	void deleteLeave(Leave leaveToDelete);
	List<Leave> getLeavesByState(Employee employee, String state);
	void updateLeave(Leave leave, Date oldBeginDate);
	Integer countLeavesByState(String state);
	Integer countLeavesByMonth(int month);
}
