package com.bolsadeideas.springboot.app.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import com.bolsadeideas.springboot.app.model.dao.IRegistroDao;
import com.bolsadeideas.springboot.app.model.dto.LoginDTO;
import com.bolsadeideas.springboot.app.model.dto.LoginRespuestaDTO;
import com.bolsadeideas.springboot.app.model.dto.RegistroDTO;
import com.bolsadeideas.springboot.app.model.entity.Registro;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping ("/v0")
@CrossOrigin()
public class LoginRestController {
	@Autowired
	private IRegistroDao registroDao;
	
	@PostMapping("/login")
	public LoginRespuestaDTO login (HttpServletRequest request, HttpServletResponse responses, SessionStatus status) {
		Registro registro;
		//System.out.println("pasa por aqui");
		LoginDTO logindto;
		LoginRespuestaDTO loginRespuestadto=new LoginRespuestaDTO();
		try {
			
			logindto= new ObjectMapper().readValue(request.getInputStream(),LoginDTO.class);
			registro=registroDao.findByUsuario(logindto.getUsuario());
			
			if (registro==null) {				
				loginRespuestadto.setRespuesta(false);		
			}
			else if (logindto.getContrasena().equals(registro.getContrasena()) ) {
				System.out.println("Usuario="+logindto.getUsuario()+"   Contraseña="+logindto.getContrasena());
				System.out.println("Contraseña BD:" + registro.getContrasena());
				loginRespuestadto.setRespuesta(true);
			}
			else {
				loginRespuestadto.setRespuesta(false);				
			}
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return loginRespuestadto;
	}
	
	@PostMapping("/registro")
	public void registro (HttpServletRequest request, HttpServletResponse responses, SessionStatus status) {
		Registro registro=new Registro();
		Registro registroRta;
		System.out.println("pasa por aqui");
		RegistroDTO registroDTO;
		//RegistroRespuestaDTO registroRespuestaDTO=new RegistroRespuestaDTO();
		
		try {			
			registroDTO= new ObjectMapper().readValue(request.getInputStream(),RegistroDTO.class);
			registro.setNombre(registroDTO.getNombre());
			registro.setApellido(registroDTO.getApellido());
			registro.setCorreo(registroDTO.getCorreo());
			registro.setTelefono(registroDTO.getTelefono());
			registro.setUsuario(registroDTO.getUsuario());
			registro.setContrasena(registroDTO.getContrasena());
			registro.setTipoDocumento(registroDTO.getTipoDocumento());
			registro.setNumDocumento(registroDTO.getNumDocumento());
			registro.setCarrera_cursada(registroDTO.getCarreraCursada());
			registroRta=registroDao.save(registro);
			System.out.println("id del registro " + registroRta.getId());
			//registro=registroDao.findByUsuario(registroDao.getUsuario());
			
			//if (registro==null) {				
				//registroRespuestaDTO.setRespuesta(false);		
			//}
			//else if (logindto.getContrasena().equals(registro.getContrasena()) ) {
				System.out.println("Nombre="+registroDTO.getNombre()+"   Apellido="+registroDTO.getApellido());
				//System.out.println("Contraseña BD:" + registro.getContrasena());
				//loginRespuestadto.setRespuesta(true);
			//}
			//else {
				//loginRespuestadto.setRespuesta(false);				
			//}
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return loginRespuestadto;
		
		
	}

}
