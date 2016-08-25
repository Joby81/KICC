package com.comprosoft.kicc.modules.sample.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.comprosoft.kicc.modules.sample.entities.LoginCredentials;

public interface LoginCredentialsRepository extends CrudRepository<LoginCredentials, Long> {

	List<LoginCredentials> findByUserName(String lastName);

}
