package com.bolsadeideas.springboot.app.model.dao;

import org.springframework.data.repository.CrudRepository;

import com.bolsadeideas.springboot.app.model.entity.Registro;

public interface IRegistroDao extends CrudRepository<Registro, Long> {
	
	public Registro findByUsuario(String usuario);
	

}
