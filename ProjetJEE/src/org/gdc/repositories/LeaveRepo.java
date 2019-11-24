package org.gdc.repositories;

import java.util.List;

import org.gdc.models.Leave;

public interface LeaveRepo {
	List<Leave> getLeaves(String username);
}
