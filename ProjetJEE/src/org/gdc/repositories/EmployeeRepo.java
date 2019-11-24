package org.gdc.repositories;

import org.gdc.models.Employee;

public interface EmployeeRepo {
	public Employee getEmployee(String username);
}
