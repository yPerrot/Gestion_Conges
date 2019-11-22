package org.gdc.repositories;

import java.util.List;

import org.gdc.models.Conge;

public interface LeaveRepo {
	List<Conge> getLeaves(String username);
}
