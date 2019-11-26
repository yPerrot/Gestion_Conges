package org.gdc.repositories;

import org.gdc.models.Employee;

public interface EmployeeRepo {
	public Employee getEmployee(String username);
	public void actualizeRemainingBalance(Employee emp, int newRemainingBalance);
}
