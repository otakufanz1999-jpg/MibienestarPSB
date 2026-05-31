-- Active: 1706052104901@@127.0.0.1@3306@sysrepjac
/* Populate tables */
insert into empresas (id_empresa, tipo, nombre,tipo_identificacion, num_identificacion, ciudad,departamento,direccion,email,logo,telefono,personeria_juridica,fec_per_juridica,norte_terr_limite,sur_terr_limite,oriente_terr_limite,occidente_terr_limite,licencia) values (1,'JUNTA DE ACCION COMUNAL','Junta de accion comunal de prueba', 'NIT', '830003566', 'Villavicencio','Meta','cra 13 Este No 28 - 48','junta@gmail.com','"C:/logo.jpg','4516788','NoPerJur1234','2023-01-01','Delimita por el norte','Delimita por el sur','Delimita por el oriente','Delimita por el occidente','1234567890');

INSERT INTO reuniones (id_Reunion,id_empresa,nombre,direccion,ciudad,departamento,fecha,fec_convocatoria,estado,tipo) VALUES (1,1,'Asamblea GENERAL','cra 80','Bogota D.C','Bogotá','2023-03-10','2023-01-15',1,1);
INSERT INTO reuniones (id_Reunion,id_empresa,nombre,direccion,ciudad,departamento,fecha,fec_convocatoria,estado,tipo) VALUES (2,1,'Primera Reunion','Bosques de Abajam3','Villavicencio','Meta','2023-03-10','2023-02-28',1,2);

INSERT INTO users (username, password, tipo_identificacion,num_identificacion,nombre,telefono,ciudad,departamento,direccion,email,enabled) VALUES ('reinaldo','$2a$10$HzEvEtFVyt78uRuCCIURKOBaKp0Hw.1/LvrHy4RMadQvNUPjdTfqe','CC','1030532668','Reinaldo Guarín Sierra','3124111204','Villavicencio','Meta','Cra 13 Este No 28-231 casa 109','reigs12@gmail.com',1);
INSERT INTO users (username, password, tipo_identificacion,num_identificacion,nombre,telefono,ciudad,departamento,direccion,email,enabled) VALUES ('admin','$2a$10$mo6R.4I.JfefMlby.Gud2OfqZ0kqErq.dbMTcf/g4eXx2KuVtX4OK','CC','1053724192','Nidia Amparo Garcia Molina','3203318849','Bogotá','Cundinamarca','Cra 80A No 54-43 Sur','nidiesita40814@hotmail.com',1);

INSERT INTO authorities (user_id, authority) VALUES (1,'ROLE_USER');
INSERT INTO authorities (user_id, authority) VALUES (2,'ROLE_ADMIN');
INSERT INTO authorities (user_id, authority) VALUES (2,'ROLE_USER');
INSERT INTO authorities (user_id, authority) VALUES (1,'ROLE_SECRETARIO');

INSERT INTO depuraciones (id_empresa,id_user,fecha) VALUES (1,1,'2023-03-10');
INSERT INTO depuraciones (id_empresa,id_user,fecha) VALUES (1,2,'2023-04-15');

INSERT INTO afiliados (id_afiliado,id_empresa,fec_afiliacion, tipo_identificacion, num_identificacion, nombre, telefono,ciudad, departamento, direccion, ocupacion, fec_nacimiento, edad, comision_trabajo, genero, email, estado, id_depuracion,discapacidad,lgt_biq,grupo_etnico, huella) VALUES(1,1,'2017-08-01','CC',1030532668, 'Reinaldo Guarin Sierra', '3124111204','Villavicencio','Meta', 'Cra 14A Este No 48-28','OFICIOS VARIOS', '1997-08-01', 27,'EMPRESARIAL', 'MASCULINO', 'reigs12@gmail.com', 0, 2, 'Fisica','si','Gitano','asgdvfje12365487d');
INSERT INTO afiliados (id_afiliado,id_empresa,fec_afiliacion, tipo_identificacion, num_identificacion, nombre, telefono,ciudad, departamento, direccion, ocupacion, fec_nacimiento, edad, comision_trabajo, genero, email, estado, id_depuracion,discapacidad,lgt_biq,grupo_etnico, huella) VALUES(2,1,'2017-08-01','CC',1053724192, 'Nidia Amparo garcia Molina', '3203318849','Bogotá','Cundinamarca', 'Cra 80A No 54-43 Sur','OFICIOS VARIOS', '1997-08-01', 27,'EMPRESARIAL', 'MASCULINO', 'reigs12@gmail.com', 0, 1,'Ninguna','No','Raizal', 'asgdvfje12365487d');
INSERT INTO afiliados (id_afiliado,id_empresa,fec_afiliacion, tipo_identificacion, num_identificacion, nombre, telefono,ciudad, departamento, direccion, ocupacion, fec_nacimiento, edad, comision_trabajo, genero, email, estado, id_depuracion,discapacidad,lgt_biq,grupo_etnico, huella) VALUES(3,1,'2017-08-01','CC',1053724100, 'Nidia Amparo garcia Molina', '3203318849','Bogotá','Cundinamarca', 'Cra 80A No 54-43 Sur','OFICIOS VARIOS', '1997-08-01', 27,'EMPRESARIAL', 'MASCULINO', 'reigs12@gmail.com', 0, 1,'Ninguna','No','Raizal', 'asgdvfje12365487d');

INSERT INTO ordendia (nombre,texto) VALUES ('INSTALACIÓN DE ASAMBLEA','El presidente del Organismo de Acción Comunal denominado %empresas.nombre% con personería jurídica No %empresas.personeria_juridica% del %empresas.fec_per_juridica%, instala la asamblea en %reuniones.direccion% del municipio de %reuniones.ciudad% Departamento de(del) %reuniones.departamento%, el día %reuniones.fecha% siendo las %reuniones.hora% en cumplimiento de la convocatoria publicada el día %reuniones.fec_convocatoria% y realizada por los señores(as) %empresas.presidente% y %empresas.secretario%, en calidad de presidente comité projunta y secretario comité projunta del OAC');
INSERT INTO ordendia (nombre,texto) VALUES ('LLAMADO A LISTA Y VERIFICACIÓN DEL QUÓRUM','El(la) secretario(a) del OAC procede al llamado de quienes asistieron, verificando la presencia física y contestan %actareuniones.quorum50Primero% afiliados o delegados de un total de %afiliados.cantidad% afiliados o delegados activos legalmente inscritos en el respectivo libro de afiliados que se encuentra registrado y sellado entidad que ejerce Inspección, Control y Vigilancia, en virtud de sus competencias sobre las organizaciones comunales de primer y segundo grado, conferidas por la Ley 52 de 1990 y  Ley 2166 de 2021 y que representan el %calcular.porcQuorum50PrimeroTexto% por ciento (%calcular.porcQuorum50PrimeroNumero% %), con este número de afiliados o delegados activos asistentes %actareuniones.inicia50Primero% damos cumplimiento al quórum decisorio y valido para tomar decisiones en este tipo de proceso organizativo de acuerdo con los estatutos y la ley.\r\nTranscurrida media (1/2) hora desde la instalación hasta la terminación del llamado a lista y verificar la conformación del quórum, siendo las %actareuniones.horaQuorum50Primero%, se inicia la asamblea general.');
INSERT INTO ordendia (nombre,texto) VALUES ('APROBACIÓN DEL ORDEN DEL DÍA','Se somete a consideración de la asamblea general el orden del día, máxima autoridad de decisión, órgano con la facultad de aprobarlo o solicitar su modificación.\r\n%front.ordendia%\r\nPuesto a consideración de la asamblea EL ORDEN DEL DÍA, es %actareuniones.aprobado% por %actareuniones.votosOrdenDia% votos de los %actareuniones.asistentes% afiliados o delegados activos asistentes.');
INSERT INTO ordendia (nombre,texto) VALUES ('PALABRAS DE QUIEN CONVOCA A LA ASAMBLEA GENERAL','Toma la palabra el(la) señor(a) %empresas.presidente%, en calidad de presidente comité projunta del OAC, solicita y agradece a los asistentes por atender el llamado, toda vez que, en esta asamblea general se tomaran decisiones importantes que afectaran positivamente el futuro del OAC');
INSERT INTO ordendia (nombre,texto) VALUES ('ELECCIÓN DE PRESIDENTE Y SECRETARIO(A) DE LA ASAMBLEA GENERAL','Como Presidente de la asamblea general, fue elegido(a):\r\nNombre: %actareuniones.nombrePresidente%\r\nC.C.No.: %actareuniones.identificacionPresidente%\r\nDirección: %actareuniones.DireccionPresidente%\r\nTeléfono: %actareuniones.telefonoPresidente%\r\nSe elige Presidente de la asamblea general, por %actareuniones.votosElegirPresidente% votos de los %actareuniones.asistentes% afiliados o delegados activos asistentes');


INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (1,1,1);
INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (2,1,2);
INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (3,1,3);
INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (4,1,4);
INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (5,1,5);


INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (3,2,1);
INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (1,2,2);
INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (2,2,3);
INSERT INTO reunionordendia (id_orden_dia,id_Reunion,orden) VALUES (4,2,4);


insert into actareuniones (afiliados, ano, asistentes, fec50mas1primero, id_afiliado_presidente, id_afiliado_secretario, id_reunion, inicia50mas1primero, numero_acta, quorum50mas1primero,aprobado_orden_dia) values (2, 2023, 2, '2023-03-10', 3, 1, 1, 1, 1, 2,0);
insert into actaordendia (id_acta_reunion,nombre,texto,orden) values (1,'INSTALACIÓN DE ASAMBLEA','El presidente del Organismo de Acción Comunal denominado Junta de accion comunal de prueba con personería jurídica No NoPerJur1234 del 01 de enero de 2023, instala la asamblea en cra 80 del municipio de Bogota D.C Departamento de(del) Bogotá, el día 10 de marzo de 2023 siendo las 12:00 a. m. en cumplimiento de la convocatoria publicada el día 15 de enero de 2023 y realizada por los señores(as) Nidia Amparo garcia Molina y Reinaldo Guarin Sierra, en calidad de presidente comité projunta y secretario comité projunta del OAC',1);

UPDATE empresas SET id_afiliado_presidente=2, id_afiliado_secretario=1 WHERE id_Empresa=1;
