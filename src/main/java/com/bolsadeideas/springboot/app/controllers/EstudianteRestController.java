package com.bolsadeideas.springboot.app.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import com.bolsadeideas.springboot.app.model.dao.IEstudianteDao;
import com.bolsadeideas.springboot.app.model.dao.IRegistroDao;
import com.bolsadeideas.springboot.app.model.dto.EstudianteDTO;
import com.bolsadeideas.springboot.app.model.dto.ServiceErrorDto;
import com.bolsadeideas.springboot.app.model.entity.Estudiante;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/v0")
@CrossOrigin
public class EstudianteRestController {

    @Autowired
    private IEstudianteDao estudianteDao;

    @PostMapping("/estudiante")
    public EstudianteDTO crearEstudiante(HttpServletRequest request, HttpServletResponse response, SessionStatus status) {
    	ServiceErrorDto serviceError=new ServiceErrorDto();
        try {
            // Leer el JSON del body
            EstudianteDTO dto = new ObjectMapper().readValue(request.getInputStream(), EstudianteDTO.class);

            // Mapear DTO -> Entidad
            Estudiante estudiante = new Estudiante();
            estudiante.setNombre(dto.getNombre());
            estudiante.setApellido(dto.getApellido());
            estudiante.setCorreo(dto.getCorreo());
            estudiante.setTelefono(dto.getTelefono());
            estudiante.setUsuario(dto.getUsuario());
            estudiante.setContrasena(dto.getContrasena());
            estudiante.setTipoDocumento(dto.getTipoDocumento());
            estudiante.setNumDocumento(dto.getNumDocumento());
            estudiante.setCarrera_cursada(dto.getCarreraCursada());

            // Guardar en la base de datos
            estudianteDao.save(estudiante);

            // Responder con el mismo DTO o uno con datos extra
            status.setComplete();
            return dto;

        } catch (Exception ex) {
        	serviceError= new ServiceErrorDto();
	        serviceError.setMessage("jjkj");
	        serviceError.setError(ex.getMessage());
	        serviceError.setPath(request.getServletPath());
			serviceError.setStatus(409);
			response.setStatus(409);            
            //response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return null;
        }
        
    }
}

