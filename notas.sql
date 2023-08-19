CREATE DATABASE notas;
USE notas

CREATE TABLE alumno (
	idAlumno INT PRIMARY KEY IDENTITY,
	nombreAlumno VARCHAR(50) not null,
	apellidoAlumno VARCHAR(50) not null,
	correoAlumno VARCHAR(50) not null,
	nacimientoAlumno DATE not null,
	direccionAlumno VARCHAR(50) not null,
);

CREATE TABLE maestro (
	idMaestro INT PRIMARY KEY IDENTITY,
	nombreMaestro VARCHAR(50) not null,
	apellidMaestro VARCHAR(50) not null,
	correoMaestro VARCHAR(50) not null,
	telefonoMaestro VARCHAR(50) not null,
);

create table director (
	idDirector INT PRIMARY KEY IDENTITY,
	nombreDirector VARCHAR(50) not null,
	apellidoDirector VARCHAR(50) not null,
	dpi VARCHAR(20) not null,
	telefonoDirector VARCHAR(50) not null,
	correoDirector VARCHAR(50) not null,
	direccionDirector VARCHAR(50) not null
);

create table tutor (
	idTutor INT PRIMARY KEY IDENTITY,
	nombreTutor VARCHAR(50) not null,
	apellidoTutor VARCHAR(50) not null,
	direccionTutor VARCHAR(50) not null,
	telefonoTutor VARCHAR(50) not null,
	tipoParentesco VARCHAR(6) not null,
);

create table instituto (
	idInstituto INT PRIMARY KEY IDENTITY,
	nombreInstituto VARCHAR(50) not null,
	telefonoInstituto NUMERIC(15) not null,
	direccionInstituto VARCHAR(650) not null,
);

create table inscripcion (
	idInscripcion INT PRIMARY KEY IDENTITY,
	fechaInscripcion DATE not null,
);

CREATE TABLE colegiatura (
	idColegiatura INT PRIMARY KEY IDENTITY,
	fechaPago DATE not null
);

CREATE TABLE cuota (
	idCuota INT PRIMARY KEY IDENTITY,
	montoCuota VARCHAR(50) not null
);

CREATE TABLE estadoSolvencia (
	idEstadoSolvencia INT PRIMARY KEY IDENTITY,
	estado VARCHAR(50) not null
);

CREATE TABLE planEstudio (
	idPlanEstudio INT PRIMARY KEY IDENTITY,
	descripcion VARCHAR(60) not null,
);

CREATE TABLE planDiario (
	idPlanDiario INT PRIMARY KEY IDENTITY,
);

CREATE TABLE planFinSemana (
	idPlanFinSemana INT PRIMARY KEY IDENTITY,	
);

CREATE TABLE planMadurez (
	idPlanMadurez INT PRIMARY KEY IDENTITY,
);

CREATE TABLE jornada (
	idJornada INT PRIMARY KEY IDENTITY,
	nombreJornada VARCHAR(50) not null,
);

CREATE TABLE grado (
	idGrado INT PRIMARY KEY IDENTITY,
	nombreGrado VARCHAR(50) not null,
);

CREATE TABLE seccion (
	idSeccion INT PRIMARY KEY IDENTITY,
	nombreSeccion VARCHAR(1) not null
);

CREATE TABLE curso (
	idCurso INT PRIMARY KEY IDENTITY,
	nombreCurso VARCHAR(200) not null,
);

CREATE TABLE bimestre (
	idBimestre INT PRIMARY KEY IDENTITY,
	nombreBimestre VARCHAR(50) not null,
);

CREATE TABLE pensum (
	idPensum INT PRIMARY KEY IDENTITY,
	listaCursos VARCHAR(120) not null
);

CREATE TABLE nivelAcademico (
	idNivelAcademico INT PRIMARY KEY IDENTITY,
);

CREATE TABLE genero (
	idGenero INT PRIMARY KEY IDENTITY,
	descripcion VARCHAR(10) not null,
);

CREATE TABLE asignaturaExtra (
	idAsignaturaExtra INT PRIMARY KEY IDENTITY,
	nombreAsignatura VARCHAR(50) not null,
);

CREATE TABLE tarea (
	idTarea INT PRIMARY KEY IDENTITY,
	notaTarea INT not null,
	fechaTarea DATE not null,
);

CREATE TABLE asistencia (
	idAsistencia INT PRIMARY KEY IDENTITY,
	notaAsistencia INT not null,
);

CREATE TABLE evaluacion (
	idEvaluacion INT PRIMARY KEY IDENTITY,
	fechaEvaluacion DATE not null,
	notaEvaluacion INT not null,
);

CREATE TABLE calificacionBimestral (
	idCalificacionBimestral INT PRIMARY KEY IDENTITY,	
	notaBimestral INT not null,
);

CREATE TABLE calificacionFinalAnual (
	idCalificacionFinalAnual INT PRIMARY KEY IDENTITY,
	notaFinalAnual INT not null
);

ALTER TABLE alumno ADD idGenero INT;
ALTER TABLE alumno ADD idTutor INT;
ALTER TABLE alumno ADD idGrado INT;
ALTER TABLE alumno
ADD FOREIGN KEY (idGenero) REFERENCES genero(idGenero);
ALTER TABLE alumno
ADD FOREIGN KEY (idTutor) REFERENCES tutor(idTutor);
ALTER TABLE alumno
ADD FOREIGN KEY (idGrado) REFERENCES grado(idGrado);

ALTER TABLE maestro ADD idCurso INT;
ALTER TABLE maestro ADD idJornada INT;
ALTER TABLE maestro ADD idGrado INT;
ALTER TABLE maestro
ADD FOREIGN KEY (idCurso) REFERENCES curso(idCurso);
ALTER TABLE maestro
ADD FOREIGN KEY (idJornada) REFERENCES jornada(idJornada);
ALTER TABLE maestro
ADD FOREIGN KEY (idGrado) REFERENCES grado(idGrado);

ALTER TABLE tutor ADD idAlumno INT;
ALTER TABLE tutor
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);

ALTER TABLE instituto ADD idDirector INT;
ALTER TABLE instituto
ADD FOREIGN KEY (idDirector) REFERENCES director(idDirector);

ALTER TABLE inscripcion ADD idAlumno INT;
ALTER TABLE inscripcion ADD idNivelAcademico INT;
ALTER TABLE inscripcion
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);
ALTER TABLE inscripcion
ADD FOREIGN KEY (idNivelAcademico) REFERENCES nivelAcademico(idNivelAcademico);

ALTER TABLE colegiatura ADD idCuota INT;
ALTER TABLE colegiatura ADD idEstadoSolvencia INT;
ALTER TABLE colegiatura ADD idAlumno INT;
ALTER TABLE colegiatura
ADD FOREIGN KEY (idCuota) REFERENCES cuota(idCuota);
ALTER TABLE colegiatura
ADD FOREIGN KEY (idEstadoSolvencia) REFERENCES estadoSolvencia(idEstadoSolvencia);
ALTER TABLE colegiatura
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);

ALTER TABLE planEstudio ADD idColegiatura INT;
ALTER TABLE planEstudio ADD idNivelAcademico INT;
ALTER TABLE planEstudio
ADD FOREIGN KEY (idColegiatura) REFERENCES colegiatura(idColegiatura);
ALTER TABLE planEstudio
ADD FOREIGN KEY (idNivelAcademico) REFERENCES nivelAcademico(idNivelAcademico);

ALTER TABLE planDiario ADD idDirector INT;
ALTER TABLE planDiario
ADD FOREIGN KEY (idDirector) REFERENCES director(idDirector);

ALTER TABLE planFinSemana ADD idDirector INT;
ALTER TABLE planFinSemana
ADD FOREIGN KEY (idDirector) REFERENCES director(idDirector);

ALTER TABLE planMadurez ADD idDirector INT;
ALTER TABLE planMadurez
ADD FOREIGN KEY (idDirector) REFERENCES director(idDirector);

ALTER TABLE jornada ADD idPlanEstudio INT;
ALTER TABLE jornada
ADD FOREIGN KEY (idPlanEstudio) REFERENCES planEstudio(idPlanEstudio);

ALTER TABLE grado ADD idSeccion INT;
ALTER TABLE grado
ADD FOREIGN KEY (idSeccion) REFERENCES seccion(idSeccion);

ALTER TABLE curso ADD idBimestre INT;
ALTER TABLE curso ADD idMaestro INT;
ALTER TABLE curso ADD idPensum INT;
ALTER TABLE curso
ADD FOREIGN KEY (idBimestre) REFERENCES bimestre(idBimestre);
ALTER TABLE curso
ADD FOREIGN KEY (idMaestro) REFERENCES maestro(idMaestro);
ALTER TABLE curso
ADD FOREIGN KEY (idPensum) REFERENCES pensum(idPensum);

ALTER TABLE pensum ADD idGrado INT;
ALTER TABLE pensum
ADD FOREIGN KEY (idGrado) REFERENCES grado(idGrado);

ALTER TABLE nivelAcademico ADD idJornada INT;
ALTER TABLE nivelAcademico ADD idPensum INT;
ALTER TABLE nivelAcademico
ADD FOREIGN KEY (idJornada) REFERENCES jornada(idJornada);
ALTER TABLE nivelAcademico
ADD FOREIGN KEY (idPensum) REFERENCES pensum(idPensum);

ALTER TABLE tarea ADD idCurso INT;
ALTER TABLE tarea ADD idAlumno INT;
ALTER TABLE tarea
ADD FOREIGN KEY (idCurso) REFERENCES curso(idCurso);
ALTER TABLE tarea
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);

ALTER TABLE asistencia ADD idCurso INT;
ALTER TABLE asistencia ADD idAlumno INT;
ALTER TABLE asistencia
ADD FOREIGN KEY (idCurso) REFERENCES curso(idCurso);
ALTER TABLE asistencia
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);

ALTER TABLE evaluacion ADD idCurso INT;
ALTER TABLE evaluacion ADD idAlumno INT;
ALTER TABLE evaluacion ADD idGrado INT;
ALTER TABLE evaluacion ADD idSeccion INT;
ALTER TABLE evaluacion
ADD FOREIGN KEY (idCurso) REFERENCES curso(idCurso);
ALTER TABLE evaluacion
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);
ALTER TABLE evaluacion
ADD FOREIGN KEY (idGrado) REFERENCES grado(idGrado);
ALTER TABLE evaluacion
ADD FOREIGN KEY (idSeccion) REFERENCES seccion(idSeccion);

ALTER TABLE calificacionBimestral ADD idAsistencia INT;
ALTER TABLE calificacionBimestral ADD idTarea INT;
ALTER TABLE calificacionBimestral ADD idEvaluacion INT;
ALTER TABLE calificacionBimestral ADD idAlumno INT;
ALTER TABLE calificacionBimestral ADD idMaestro INT;
ALTER TABLE calificacionBimestral
ADD FOREIGN KEY (idAsistencia) REFERENCES asistencia(idAsistencia);
ALTER TABLE calificacionBimestral
ADD FOREIGN KEY (idTarea) REFERENCES tarea(idTarea);
ALTER TABLE calificacionBimestral
ADD FOREIGN KEY (idEvaluacion) REFERENCES evaluacion(idEvaluacion);
ALTER TABLE calificacionBimestral
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);
ALTER TABLE calificacionBimestral
ADD FOREIGN KEY (idMaestro) REFERENCES maestro(idMaestro);

ALTER TABLE calificacionFinalAnual ADD idCalificacionBimestral INT;
ALTER TABLE calificacionFinalAnual ADD idAlumno INT;
ALTER TABLE calificacionFinalAnual ADD idMaestro INT;
ALTER TABLE calificacionFinalAnual
ADD FOREIGN KEY (idCalificacionBimestral) REFERENCES calificacionBimestral(idCalificacionBimestral);
ALTER TABLE calificacionFinalAnual
ADD FOREIGN KEY (idAlumno) REFERENCES alumno(idAlumno);
ALTER TABLE calificacionFinalAnual
ADD FOREIGN KEY (idMaestro) REFERENCES maestro(idMaestro);

insert into alumno values ( 'Gustavus', 'Maryet', 'gmaryet0@facebook.com', '10/11/2007','569 Sutherland Parkway');
insert into alumno values ( 'Tildy', 'Upsale', 'tupsale1@businesswire.com', '8/1/2009', '4821 Lighthouse Bay Park');
insert into alumno values ( 'Wynne', 'Bartoszewski', 'wbartoszewski2@samsung.com', '1/1/2003', '1 Walton Park');
insert into alumno values ( 'Lanette', 'Casey', 'lcasey3@behance.net', '10/20/2011', '1 Corscot Lane');
insert into alumno values ( 'Vinnie', 'Stollery', 'vstollery4@nhs.uk', '12/15/2006', '2608 Golf View Terrace');
insert into alumno values ( 'Timmie', 'Kelsell', 'tkelsell5@webnode.com', '10/9/2011', '71735 Dawn Pass');
insert into alumno values ( 'Rosemary', 'Kennet', 'rkennet6@cam.ac.uk', '11/28/2012', '650 Coolidge Court');
insert into alumno values ( 'Flossi', 'Hawlgarth', 'fhawlgarth7@trellian.com', '12/9/2007', '67 Mandrake Junction');
insert into alumno values ( 'Rozalie', 'Blankley', 'rblankley8@newsvine.com', '8/20/2009', '5 5th Hill');
insert into alumno values ( 'Lindy', 'Ollet', 'lollet9@dropbox.com', '4/13/2011', '84177 Stephen Park');
insert into alumno values ( 'Rudolf', 'Burren', 'rburrena@slate.com', '4/13/2008', '20559 Thierer Place');
insert into alumno values ( 'Alice', 'Orteau', 'aorteaub@cpanel.net', '8/22/2006', '6 Sutteridge Place');
insert into alumno values ( 'Eula', 'Spare', 'esparec@usda.gov', '4/8/2007', '2 Stephen Road');
insert into alumno values ( 'Shirlene', 'Cavendish', 'scavendishd@yandex.ru', '8/2/2007', '23002 Sunfield Crossing');
insert into alumno values ( 'Danni', 'Kytter', 'dkyttere@npr.org', '10/6/2004', '63982 8th Alley');
insert into alumno values ( 'Kerby', 'Coggings', 'kcoggingsf@vimeo.com', '10/21/2009', '27345 Bowman Way');
insert into alumno values ( 'Tanya', 'Tongs', 'ttongsg@nature.com', '5/4/2004', '6 Forster Hill');
insert into alumno values ( 'Gabrielle', 'Henryson', 'ghenrysonh@nydailynews.com', '9/3/2006', '34 Namekagon Junction');
insert into alumno values ( 'Tobin', 'Trinbey', 'ttrinbeyi@histats.com', '8/6/2013', '0 Bobwhite Pass');
insert into alumno values ( 'Patti', 'Keast', 'pkeastj@wsj.com', '2/26/2005', '89 Express Terrace');
insert into alumno values ( 'Hinda', 'Ionnidis', 'hionnidisk@smh.com.au', '1/30/2008', '2 Golf Course Road');
insert into alumno values ( 'Dorene', 'Tremoulet', 'dtremouletl@scribd.com', '1/12/2012', '231 Myrtle Circle');
insert into alumno values ( 'Kleon', 'Mucklo', 'kmucklom@weather.com', '2/27/2005', '8 Southridge Pass');
insert into alumno values ( 'Ofella', 'Gant', 'ogantn@archive.org', '12/21/2008', '5 Chive Hill');
insert into alumno values ( 'Farand', 'Tregiddo', 'ftregiddoo@rediff.com', '6/15/2013', '6407 Kingsford Drive');

insert into maestro values ('Nesta', 'Cristofolo', 'ncristofolo0@123-reg.co.uk', '6248105996');
insert into maestro values ('Bibi', 'Greenhouse', 'bgreenhouse1@themeforest.net', '9106739852');
insert into maestro values ('Mathian', 'Waind', 'mwaind2@illinois.edu', '6146733718');
insert into maestro values ('Gussy', 'Normandale', 'gnormandale3@sphinn.com', '2028463052');
insert into maestro values ('Travis', 'Charlick', 'tcharlick4@lycos.com', '8603608850');
insert into maestro values ('Torrance', 'Charteris', 'tcharteris5@posterous.com', '3227248790');
insert into maestro values ('Cymbre', 'Bevington', 'cbevington6@instagram.com', '2177530480');
insert into maestro values ('Kristan', 'Domone', 'kdomone7@biglobe.ne.jp', '3037521545');
insert into maestro values ('Jo ann', 'Mellanby', 'jmellanby8@blogspot.com', '6703169145');
insert into maestro values ('Flor', 'Habershon', 'fhabershon9@va.gov', '5941537020');
insert into maestro values ('Pandora', 'Lightwing', 'plightwinga@studiopress.com', '7137780191');
insert into maestro values ('Vaughan', 'Braiden', 'vbraidenb@army.mil', '2064403511');
insert into maestro values ('Didi', 'Tidman', 'dtidmanc@marketwatch.com', '3407099891');
insert into maestro values ('Linnea', 'Bakhrushin', 'lbakhrushind@wiley.com', '2151246591');
insert into maestro values ('Gardner', 'Baseley', 'gbaseleye@dell.com', '1685725992');
insert into maestro values ('Binnie', 'Coffelt', 'bcoffeltf@pagesperso-orange.fr', '3803158626');
insert into maestro values ('Willem', 'Bedo', 'wbedog@pagesperso-orange.fr', '6519706497');
insert into maestro values ('Ode', 'Lackeye', 'olackeyeh@samsung.com', '6289503661');
insert into maestro values ('Bartholomew', 'Coulthurst', 'bcoulthursti@last.fm', '8547145626');
insert into maestro values ('Barth', 'Dowson', 'bdowsonj@list-manage.com', '8987525977');
insert into maestro values ('Marcello', 'Jeduch', 'mjeduchk@tripadvisor.com', '7663568414');
insert into maestro values ('Jordana', 'Ber', 'jberl@tmall.com', '9611097555');
insert into maestro values ('Lem', 'Berryann', 'lberryannm@lulu.com', '6244546367');
insert into maestro values ('Gae', 'Copson', 'gcopsonn@miitbeian.gov.cn', '7081094307');
insert into maestro values ('Idalina', 'Qusklay', 'iqusklayo@newyorker.com', '9005562483');

insert into director values ('Callie', 'Shieber', '24237648234', '1741673680', 'cshieber0@cyberchimps.com', '14254 John Wall Drive');
insert into director values ('Joeann', 'Goodrum', '72348234627', '7995268878', 'jgoodrum1@bandcamp.com', '6 Valley Edge Lane');
insert into director values ('Jacobo', 'Tanswill', '98443894388', '3273294857', 'jtanswill2@xinhuanet.com', '835 Lerdahl Pass');

insert into tutor values ('Leela', 'Woolforde', '049 Dakota Parkway', '7419536194', 'Papa');
insert into tutor values ('Kiele', 'Ziehms', '6761 Namekagon Circle', '8789804958', 'Mama');
insert into tutor values ('Liza', 'Trevna', '39951 Gulseth Way', '2916875221', 'Papa');
insert into tutor values ('Bax', 'Hartfield', '9 Corscot Drive', '2068517387', 'Abuela');
insert into tutor values ('Oby', 'Scotney', '99 Anthes Parkway', '8161839569', 'Mama');
insert into tutor values ('Timmie', 'Kollatsch', '320 Johnson Lane', '9641612240', 'Abuela');
insert into tutor values ('Moise', 'Alphege', '18517 Mandrake Street', '6259304749', 'Abuelo');
insert into tutor values ('Adiana', 'Aldritt', '8 Del Mar Crossing', '7481409118', 'Abuela');
insert into tutor values ('Sula', 'Bunce', '75 Miller Junction', '4512773489', 'Abuelo');
insert into tutor values ('Kelcie', 'Stanning', '2 Kings Drive', '1744981669', 'Mama');
insert into tutor values ('Arlen', 'Olive', '37506 Oak Valley Drive', '8917992272', 'Abuelo');
insert into tutor values ('Maxim', 'Dyble', '82221 Village Green Terrace', '2134205776', 'Mama');
insert into tutor values ('Pattie', 'McClinton', '38 Oriole Center', '4151824978', 'Abuelo');
insert into tutor values ('Neilla', 'Pizer', '423 Stephen Alley', '4137960234', 'Mama');
insert into tutor values ('Olivier', 'Tomblin', '6774 Glendale Plaza', '4737009156', 'Papa');
insert into tutor values ('Billie', 'Learoyd', '1 Blue Bill Park Avenue', '1488359599', 'Mama');
insert into tutor values ('Laurice', 'Harkin', '332 Prentice Crossing', '4703761413', 'Abuela');
insert into tutor values ('Winifred', 'Tollerton', '0 Oakridge Plaza', '7338730402', 'Abuela');
insert into tutor values ('Florentia', 'Warwicker', '08 Cottonwood Parkway', '1439826107', 'Mama');
insert into tutor values ('Nolana', 'Cheers', '38092 Rieder Street', '3282563476', 'Papa');
insert into tutor values ('Harlan', 'Rayer', '74434 Browning Alley', '4805669780', 'Abuelo');
insert into tutor values ('Wallis', 'Ragbourn', '360 Spohn Road', '3604722490', 'Abuela');
insert into tutor values ('Wanids', 'Geall', '231 Chinook Center', '5031650895', 'Abuela');
insert into tutor values ('Delcine', 'Wooton', '31 Sheridan Circle', '1429066859', 'Papa');
insert into tutor values ('Stavro', 'Sergison', '6 Grasskamp Point', '4562343208', 'Abuela');

insert into instituto values ('Instituto Mega', '78715555', '1 Corscot Lane');

insert into inscripcion values ('11/27/2021');
insert into inscripcion values ('11/9/2021');
insert into inscripcion values ('11/15/2021');
insert into inscripcion values ('11/30/2021');
insert into inscripcion values ('1/17/2022');
insert into inscripcion values ('1/2/2022');
insert into inscripcion values ('1/29/2022');
insert into inscripcion values ('11/4/2021');
insert into inscripcion values ('11/30/2021');
insert into inscripcion values ('12/20/2021');
insert into inscripcion values ('1/2/2022');
insert into inscripcion values ('12/25/2021');
insert into inscripcion values ('11/25/2021');
insert into inscripcion values ('11/16/2021');
insert into inscripcion values ('1/3/2022');
insert into inscripcion values ('11/2/2021');
insert into inscripcion values ('12/13/2021');
insert into inscripcion values ('12/29/2021');
insert into inscripcion values ('1/8/2022');
insert into inscripcion values ('1/29/2022');
insert into inscripcion values ('11/20/2021');
insert into inscripcion values ('11/15/2021');
insert into inscripcion values ('11/22/2021');
insert into inscripcion values ('12/17/2021');
insert into inscripcion values ('11/21/2021');

insert into colegiatura values ('9/23/2022');
insert into colegiatura values ('1/24/2022');
insert into colegiatura values ('7/2/2022');
insert into colegiatura values ('9/11/2022');
insert into colegiatura values ('2/12/2022');
insert into colegiatura values ('3/12/2022');
insert into colegiatura values ('1/29/2022');
insert into colegiatura values ('7/2/2022');
insert into colegiatura values ('2/15/2022');
insert into colegiatura values ('1/11/2022');
insert into colegiatura values ('8/22/2022');
insert into colegiatura values ('8/27/2022');
insert into colegiatura values ('5/4/2022');
insert into colegiatura values ('6/25/2022');
insert into colegiatura values ('5/28/2022');
insert into colegiatura values ('3/30/2022');
insert into colegiatura values ('7/15/2022');
insert into colegiatura values ('2/20/2022');
insert into colegiatura values ('7/18/2022');
insert into colegiatura values ('9/10/2022');
insert into colegiatura values ('8/9/2022');
insert into colegiatura values ('8/2/2022');
insert into colegiatura values ('9/3/2022');
insert into colegiatura values ('6/26/2022');
insert into colegiatura values ('7/3/2022');

insert into cuota values ('200');
insert into cuota values ('250');
insert into cuota values ('300');

insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Insolvente');
insert into estadoSolvencia values ('Solvente');
insert into estadoSolvencia values ('Solvente');

insert into planEstudio values ('Plan Diario');
insert into planEstudio values ('Plan Fin de Semana');
insert into planEstudio values ('Plan por Madurez');

insert into jornada values ('Jornada Matutina');
insert into jornada values ('Jornada Vespertina');
insert into jornada values ('Jornada Nocturna');

insert into grado values ('Primero Primaria');
insert into grado values ('Segundo Primaria');
insert into grado values ('Tercero Primaria');
insert into grado values ('Cuarto Primaria');
insert into grado values ('Quinto Primaria');
insert into grado values ('Sexto Primaria');
insert into grado values ('Primero Basico');
insert into grado values ('Segundo Basico');
insert into grado values ('Tercero Basico');
insert into grado values ('Cuarto Bachillerato');
insert into grado values ('Quinto Bachillerato');

insert into seccion values ('A');
insert into seccion values ('B');
insert into seccion values ('C');

insert into curso values ('Matematicas, Ciencias Sociales, Ciencias Naturales, Computacion, Expresion Artistica, Comunicacion y Lenguaje');
insert into curso values ('Matematicas, Ciencias Sociales, Ciencias Naturales, Computacion, Expresion Artistica, Comunicacion y Lenguaje, Contabilidad');
insert into curso values ('Matematicas, Ciencias Sociales, Ciencias Naturales, Computacion, Expresion Artistica, Comunicacion y Lenguaje, Contabilidad');
insert into curso values ('Matematicas, Ciencias Sociales, Ciencias Naturales, Computacion, Expresion Artistica, Comunicacion y Lenguaje, Contabilidad, Seminario');

insert into bimestre values ('Primer Bimestre');
insert into bimestre values ('Segundo Bimestre');
insert into bimestre values ('Tercer Bimestre');
insert into bimestre values ('Cuarto Bimestre');

insert into pensum values ('Pensum Primaria');
insert into pensum values ('Pensum Basico');
insert into pensum values ('Pensum Cuarto Diversificado');
insert into pensum values ('Pensum Quinto Diversificado');

insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('M');
insert into genero values ('M');
insert into genero values ('F');
insert into genero values ('M');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('M');
insert into genero values ('M');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');
insert into genero values ('F');

insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA EXTRANJERO');
insert into asignaturaExtra values ('IDIOMA MAYA');
insert into asignaturaExtra values ('IDIOMA MAYA');

insert into tarea values (58, '10/5/2022');
insert into tarea values (52, '10/7/2022');
insert into tarea values (67, '10/9/2022');
insert into tarea values (59, '10/8/2022');
insert into tarea values (63, '10/6/2022');
insert into tarea values (58, '10/9/2022');
insert into tarea values (56, '10/7/2022');
insert into tarea values (64, '10/8/2022');
insert into tarea values (53, '10/6/2022');
insert into tarea values (63, '10/7/2022');
insert into tarea values (60, '10/6/2022');
insert into tarea values (54, '10/8/2022');
insert into tarea values (58, '10/7/2022');
insert into tarea values (69, '10/6/2022');
insert into tarea values (73, '10/5/2022');
insert into tarea values (62, '10/6/2022');
insert into tarea values (50, '10/9/2022');
insert into tarea values (51, '10/6/2022');
insert into tarea values (53, '10/8/2022');
insert into tarea values (87, '10/6/2022');
insert into tarea values (71, '10/8/2022');
insert into tarea values (81, '10/6/2022');
insert into tarea values (97, '10/7/2022');
insert into tarea values (76, '10/6/2022');
insert into tarea values (96, '10/5/2022');

insert into asistencia values (9);
insert into asistencia values (9);
insert into asistencia values (2);
insert into asistencia values (7);
insert into asistencia values (6);
insert into asistencia values (7);
insert into asistencia values (5);
insert into asistencia values (6);
insert into asistencia values (5);
insert into asistencia values (4);
insert into asistencia values (7);
insert into asistencia values (8);
insert into asistencia values (8);
insert into asistencia values (8);
insert into asistencia values (8);
insert into asistencia values (2);
insert into asistencia values (8);
insert into asistencia values (6);
insert into asistencia values (3);
insert into asistencia values (5);
insert into asistencia values (8);
insert into asistencia values (6);
insert into asistencia values (4);
insert into asistencia values (7);
insert into asistencia values (8);

insert into evaluacion values ('10/1/2022', 28);
insert into evaluacion values ('10/1/2022', 13);
insert into evaluacion values ('10/1/2022', 38);
insert into evaluacion values ('10/1/2022', 11);
insert into evaluacion values ('10/1/2022', 41);
insert into evaluacion values ('10/1/2022', 4);
insert into evaluacion values ('10/1/2022', 46);
insert into evaluacion values ('10/1/2022', 6);
insert into evaluacion values ('10/1/2022', 22);
insert into evaluacion values ('10/1/2022', 13);
insert into evaluacion values ('10/1/2022', 41);
insert into evaluacion values ('10/1/2022', 45);
insert into evaluacion values ('10/1/2022', 7);
insert into evaluacion values ('10/1/2022', 48);
insert into evaluacion values ('10/1/2022', 3);
insert into evaluacion values ('10/1/2022', 8);
insert into evaluacion values ('10/1/2022', 8);
insert into evaluacion values ('10/1/2022', 16);
insert into evaluacion values ('10/1/2022', 25);
insert into evaluacion values ('10/1/2022', 9);
insert into evaluacion values ('10/1/2022', 40);
insert into evaluacion values ('10/1/2022', 47);
insert into evaluacion values ('10/1/2022', 2);
insert into evaluacion values ('10/1/2022', 14);
insert into evaluacion values ('10/1/2022', 11);

insert into calificacionBimestral values (37);
insert into calificacionBimestral values (2);
insert into calificacionBimestral values (60);
insert into calificacionBimestral values (8);
insert into calificacionBimestral values (51);
insert into calificacionBimestral values (50);
insert into calificacionBimestral values (99);
insert into calificacionBimestral values (68);
insert into calificacionBimestral values (7);
insert into calificacionBimestral values (55);
insert into calificacionBimestral values (1);
insert into calificacionBimestral values (1);
insert into calificacionBimestral values (94);
insert into calificacionBimestral values (63);
insert into calificacionBimestral values (89);
insert into calificacionBimestral values (40);
insert into calificacionBimestral values (60);
insert into calificacionBimestral values (45);
insert into calificacionBimestral values (1);
insert into calificacionBimestral values (38);
insert into calificacionBimestral values (2);
insert into calificacionBimestral values (93);
insert into calificacionBimestral values (1);
insert into calificacionBimestral values (82);
insert into calificacionBimestral values (16);

insert into calificacionFinalAnual values (66);
insert into calificacionFinalAnual values (45);
insert into calificacionFinalAnual values (56);
insert into calificacionFinalAnual values (68);
insert into calificacionFinalAnual values (44);
insert into calificacionFinalAnual values (70);
insert into calificacionFinalAnual values (47);
insert into calificacionFinalAnual values (41);
insert into calificacionFinalAnual values (63);
insert into calificacionFinalAnual values (97);
insert into calificacionFinalAnual values (61);
insert into calificacionFinalAnual values (50);
insert into calificacionFinalAnual values (98);
insert into calificacionFinalAnual values (65);
insert into calificacionFinalAnual values (90);
insert into calificacionFinalAnual values (82);
insert into calificacionFinalAnual values (64);
insert into calificacionFinalAnual values (70);
insert into calificacionFinalAnual values (49);
insert into calificacionFinalAnual values (100);
insert into calificacionFinalAnual values (78);
insert into calificacionFinalAnual values (82);
insert into calificacionFinalAnual values (69);
insert into calificacionFinalAnual values (100);
insert into calificacionFinalAnual values (99);

-- CONSULTAS

select*from alumno
select*from maestro
select*from director
select*from tutor
select*from instituto 
select*from inscripcion 
select*from colegiatura
select*from cuota
select*from estadoSolvencia
select*from planEstudio
select*from planDiario
select*from planFinsemana
select*from planMadurez
select*from jornada 
select*from grado
select*from seccion
select*from curso
select*from bimestre
select*from pensum
select*from nivelAcademico
select*from genero
select*from asignaturaExtra
select*from tarea
select*from asistencia
select*from evaluacion 
select*from calificacionBimestral
select*from calificacionFinalAnual

-- MÁS CONSULTAS

--#1 Realiza la consulta en la tabla Evaluacion con las notas > 70 y < 60
SELECT * FROM evaluacion WHERE notaEvaluacion > 0 AND notaEvaluacion < 60;

--#2 Realiza la consulta en la tabla Evaluacion entre el idAlumno de 1 al 5 con una notaEvaluacion de 40 pts.
SELECT * FROM evaluacion WHERE (idEvaluacion > 1 AND notaEvaluacion < 5) OR notaEvaluacion = 40;

--#3 Realiza la consulta en la tabla estadoSolvente sobre quienes no están Solvente
SELECT * FROM estadoSolvencia WHERE NOT Estado = 'Solvente';

--#4 selecciona todos los grados que se encuentran en "Tercero Basico","Tercero Primaria"
SELECT * FROM grado WHERE nombreGrado IN ('Tercero Primaria', 'Tercero Basico');

--#5 La siguiente instrucción selecciona todos los alumnos con un nombre que comienza con "a"
SELECT * FROM alumno WHERE nombreAlumno LIKE 'a%';

--#6 La siguiente instrucción selecciona todos los tutor con la direccion "049 Dakota Parkway", en la tabla "direccionTutor"
SELECT * FROM tutor WHERE direccionTutor='049 Dakota Parkway';

--#7 --total de personas por genero
 select descripcion , count(*) as genero from genero group by descripcion

--#8 
SELECT idAsistencia, notaAsistencia FROM asistencia WHERE notaAsistencia <= 5;

--#9 La siguiente instrucción enumera la cantidad de integrantes de planEstudio
SELECT COUNT(DISTINCT descripcion) FROM planEstudio;

--#10 La siguiente instrucción SQL selecciona todos los clientes de la tabla "Clientes", ordenados de forma ascendente por el "País" y descendente por la columna "Nombre del cliente":
SELECT * FROM alumno ORDER BY nacimientoAlumno ASC, direccionAlumno DESC;

--#11 descendente
select nombreAlumno,apellidoAlumno,correoAlumno from alumno order by correoAlumno desc

--#12 ascendente
select nombreAlumno,apellidoAlumno,correoAlumno from alumno order by correoAlumno asc

--#13 Estudiantes que tienen asignaturaExtra de IDIOMA MAYA
select * from asignaturaExtra where idAsignaturaExtra in(select idAsignaturaExtra from asignaturaExtra where nombreAsignatura='IDIOMA MAYA')

--#14 Realiza la consulta de la cuota mas elevada
select * from cuota where montoCuota = (select MAX (montoCuota) from cuota)

--#15 Cuantas calificaciones existen entre 80 y 100 pts en la tabla calificacionFinalAnual
select * from calificacionFinalAnual where notaFinalAnual between 80 and 100;

--SUBCONSULTAS

--#1 Lo que se esta haciendo es desde los alumnos se obtienen en los nombres de los alumnos del menor al promedio de la jornada
select nombreAlumno, idGrado from alumno where gradoAlumno <(select avg(jornada) from jornadaAlumno;

--#2 Lo que se esta haciendo es desde los alumnos se obniten el los nombres de los alumnos mayor al promedio de la jornada
SELECT * from alumno where idAlumno >(select AVG(idGrado) from grado);

--#3 Se selecciona todos los alumnos que esten asignados en el curso de matematica
SELECT nombreAlumno from alumno where nombreAlumno > all (select idCurso from curso where nombreCurso ='matematica');

--#4 Se selecciona algunos alumnos que esten asignados en el curso de matematica
select * from curso where nombreCurso > any (select idCurso from alumno LIKE 'matematica%');

--#5 Se mostrara los alumnos que tengan una asistencia de 20 veces
select nombreAlumno from alumno) where asistencia in (select grado from asistencia where asistencia >20);

--JOINS

--#1
select * from evaluaciones eval
full outerjoin maestro mae
on eval.evaluaiones = mae.idevaluacion

--#2

select jordaNocturna
from jornadas jor
full outer join planDiario pld
on jor.idjornadas = pld.idplanDiarioN
where jor.idjornadas  is null
or pld.idplanDiarioN is null

--#3

select nombreAlumno
from inscripcion ins
right join gradoencurso gra
on ins.idinscripcion = gra.idgrado

--#4

select *
from seccion secn
right join nombreAlumno alm
on secn.idseccion = alm.idAlumno
where secn.idseccion  is null

--#5

select *
from seccion secn
right join nombreAlumno alm
on secn.idseccion = alm.idAlumno
where alm.idAlumno is null

SELECT alumno.idAlumno, alumno.nombreAlumno, maestro.nombreMaestro FROM alumno INNER JOIN maestro ON alumno.idAlumno = maestro.idMaestro

--procedimiento que almacene los datos del alumno y sus notas bimestrales 
USE notas
GO
CREATE PROCEDURE nombreXnotas
@busca varchar(15)
AS
BEGIN
SELECT grado.idGrado, curso.idCurso, curso.calificacionBimestral
FROM grado INNER JOIN calificacionBimestral ON calificacionBimestral.idcalificacionBimestral  = curso.idcurso
WHERE grado.grado like @busca
END