package org.gdc.services;

import org.gdc.repositories.AuthRepo;
import org.gdc.repositories.AuthRepoImpl;

public class AuthServiceImpl implements AuthService {
	private AuthRepo authRepo = new AuthRepoImpl();

	@Override
	public String getPasswordByUser(String username) {
		return authRepo.getPasswordByUser(username);
	}  

}
