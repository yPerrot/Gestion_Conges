package org.gdc.repositories;

import java.util.List;

import org.gdc.models.Employee;

public interface EmployeeRepo {
	public Employee getEmployee(String username);
	public void actualizeRemainingBalance(Employee emp, int newRemainingBalance);
	public List<Employee> getEmployees();
	public void addEmployee(Employee newEmp);
	public void updateEmployee(Employee employee, String login);
}
