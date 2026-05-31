package com.bolsadeideas.springboot.app.model.dao;

import org.springframework.data.repository.CrudRepository;

import com.bolsadeideas.springboot.app.model.entity.Estudiante;

public interface IEstudianteDao  extends CrudRepository<Estudiante, Long> {
	
	public Estudiante findByUsuario(String usuario);
	

}
