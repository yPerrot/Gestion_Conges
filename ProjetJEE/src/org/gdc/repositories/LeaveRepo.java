package org.gdc.repositories;

import java.util.List;

import javax.ejb.Local;

import org.gdc.models.Conge;

@Local
public interface LeaveRepo {
	List<Conge> getLeaves(String username);
}
