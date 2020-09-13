--Create DataBase Activity_1coma2 
--Use Activity_1coma2
go
Create Table Niveles(
IdNivel TinyInt Not Null Identity (1,1),
NombreNivel Varchar(30) Not Null
)
go
Alter Table Niveles 
Add Constraint Pk_Niveles_IdNivel Primary Key (IdNivel)
go
Create Table Cursos(
IdCurso BigInt Not Null Identity (1,1),
NombreCurso VarChar (50) Not Null,
FechaEstreno Date Not Null,
CostoCursado Money Not Null,
CostoCertificado Money Not Null,
IdNivel TinyInt Null
)
go
Alter Table Cursos
Add Constraint Pk_Cursos Primary Key (IdCurso)
go
Alter Table Cursos
Add Constraint Che_Cursos_FechaEstreno Check (FechaEstreno<=GetDate())
go
Alter Table Cursos
Add Constraint Che_Cursos_CostoCursado Check (CostoCursado>=0)
go
Alter Table Cursos
Add Constraint Che_Cursos_CostoCertificado Check (CostoCertificado>=0)
go
Alter Table Cursos
Add Constraint Fk_Cursos_IdNivel Foreign Key (IdNivel) References Niveles (IdNivel) 
go
Create Table Idioma(
IdIdioma SmallInt Not Null Identity (1,1),
NombreIdioma VarChar(20) Not Null
)
go
Alter Table Idioma
Add Constraint Pk_Idioma_IdIdioma Primary Key(IdIdioma)
go
Alter Table Idioma
Add Constraint U_Idioma_NombreIdioma Unique (NombreIdioma)
go
Create Table NombreFormatos(
IdFormato Smallint Not Null Identity (1,1),
NombreFormato Varchar(30) Not Null
)
go 
Alter Table NombreFormatos
Add Constraint Pk_NombreFormatos_IdFormato Primary Key (IdFormato)
go
Alter Table NombreFormatos
Add Constraint U_NombreFormatos_NombreFormato Unique (NombreFormato)
go
Create Table Formatos(
IdCurso BigInt Not Null,
IdIdioma SmallInt Not Null,
IdFormato Smallint Not Null,
)
go
Alter Table Formatos
Add Constraint Pk_Formatos_IdCurso_IdIdioma Primary Key(IdCurso,IdIdioma,IdFormato)
go
Alter Table Formatos
Add Constraint Fk_Formatos_IdFormato foreign Key(IdFormato) References NombreFormatos(IdFormato)
go
Alter Table Formatos
Add Constraint FK_Formatos_IdCurso Foreign Key(IdCurso) References Cursos(IdCurso) 
go
Alter Table Formatos
Add Constraint FK_Formatos_IdIdioma Foreign Key (IdIdioma)References Idioma(IdIdioma)

go
Create Table Categoria(
IdCategoria SmallInt Not Null Identity(1,1),
NombreCategoria Varchar(20) Not Null
)
go
Alter Table Categoria
Add Constraint Pk_Categoria_IdCategoria Primary Key (IdCategoria)
go
Alter Table Categoria
Add Constraint U_Categoria_Nombre Unique (NombreCategoria)

go
Create Table CategoriaPorCurso(
IdCurso BigInt Not Null,
IdCategoria SmallInt Not Null
) 
go
Alter Table CategoriaPorCurso
Add Constraint Pk_CategoriaPorCurso_IdCurso_IdCategoria Primary Key(IdCurso,IdCategoria)
go
Alter Table CategoriaPorCurso
Add Constraint Fk_CategoriaPorCurso_IdCurso Foreign Key(IdCurso)References Cursos(IdCurso)
go
Alter Table CategoriaPorCurso
Add Constraint Fk_CategoriaPorCurso_IdCategoria Foreign Key(IdCategoria)References Categoria(IdCategoria)
go
Create Table Clase(
IdCurso BigInt Not Null,
IdClase BigInt Not Null Identity(1,1), 
NombreClase VarChar(50)Not Null,
NumeroDeClase SmallInt Not Null,
Duracion SmallInt Not Null,

)
go
Alter Table Clase
Add Constraint Che_Clase_NumeroDeClase Check(NumeroDeClase>0)
go
Alter Table Clase
Add Constraint Che_Clase_Duracion Check(Duracion>0)
go
Alter Table Clase 
Add Constraint Pk_Clase_IdCurso_NumeroDeClase Primary Key(IdCurso,NumeroDeClase)
go
Alter Table Clase
Add Constraint Fk_Clase_IdCurso Foreign Key (IdCurso) References Cursos(IdCurso)
go
Alter Table Clase 
Add Constraint U_Clase_IdClase Unique(IdClase)

go
Create Table TipoContenido(
IdTipoContenido SmallInt Not Null Identity(1,1),
NombreTipoContenido Varchar(30) Not Null
)
go
Alter Table TipoContenido
Add Constraint Pk_TC Primary key (IdTipoContenido)
go
Alter Table TipoContenido
Add Constraint U_TC Unique (NombreTipoContenido)
go
Create Table Contenido(
IdContenido BigInt Not Null Identity (1,1), 
IdClase BigInt Not Null,
Tamaño Int Not Null,
IdTipoContenido SmallInt Not Null
)
go
Alter Table Contenido
Add Constraint Che_Contenido_Tamaño Check(Tamaño>0) 
go
Alter Table Contenido
Add Constraint Pk_Contenido_IdContenido Primary Key(IdContenido)
go
Alter Table Contenido
Add Constraint Fk_Contenido_IdClase Foreign Key(IdClase) References Clase(IdClase)
go
Alter Table Contenido
Add Constraint Fk_Contenido_IdTipoContenido Foreign Key(IdTipoContenido) References TipoContenido(IdTipoContenido)
go 
Create Table Inscripciones (
IdInscripcion BigInt Not Null Identity (1,1),
IdUsuario BigInt Not Null,
IdCurso BigInt Not Null,
FechaInscripcion Date Not Null
)
go
Alter Table Inscripciones
Add Constraint Pk_Inscripciones_IdUsuarioAndIdCursoAndFechaInscripcion Primary Key(IdUsuario,IdCurso,FechaInscripcion)
go
Alter Table Inscripciones
Add Constraint Che_Inscripciones_FechaInscripcion Check (FechaInscripcion<=getdate())
go 
Alter Table Inscripciones
Add Constraint U_Inscripciones_IdInscripcion  Unique (IdInscripcion)
go
Alter Table Inscripciones
Add Constraint Fk_Inscripciones_InscripcionesToUsuario Foreign Key (IdUsuario) References Usuario(IdUsuario)
go
Alter Table Inscripciones
Add Constraint Fk_Inscripciones_InscripcionesToCursos Foreign Key (IdCurso) References Cursos(IdCurso)

go
Create Table Certificacion(
IdInscripcion BigInt Not Null,
FechaCertificacion Date Not Null
)
go
Alter Table Certificacion
Add Constraint Pk_Certificacion_IdInscripcion Primary Key(IdInscripcion)
go
Alter Table Certificacion
Add Constraint Che_Certificacion_FechaCertificacion Check (FechaCertificacion<=Getdate())
go
Alter Table Certificacion
Add Constraint Fk_Certificacion_CertificacionToInscripciones Foreign Key (IdInscripcion) References Inscripciones(IdInscripcion)
go 
Create Table PagosInscripcion(
IdInscripcion BigInt Not Null,
NumeroPago TinyInt Not Null, 
FechaPago Date Not Null,
Importe Money Not Null
)

go
Alter Table PagosInscripcion
Add Constraint Pk_PagosInscripcion_IdInscripcionAndNumeroPago Primary Key (IdInscripcion,NumeroPago)
go
Alter Table PagosInscripcion
Add Constraint Fk_PagosInscripcion_PagosInscripcionToInscripciones Foreign Key (IdInscripcion) References Inscripciones(IdInscripcion)
go
Alter Table PagosInscripcion
Add Constraint Che_PagosInscripcion_NumeroPago Check(NumeroPago>0)
go
Alter Table PagosInscripcion
Add Constraint Che_PagosInscripcion_FechaPago Check (FechaPago<=Getdate())
go
Alter Table PagosInscripcion
Add Constraint Che_PagosInscripcion_Importe Check(Importe>0)
go 
Create Table Reseña (
IdInscripcion BigInt Not Null,
Mensaje VarChar(200) Not Null,
Puntaje TinyInt Not Null
)
go
Alter Table Reseña
Add Constraint Pk_Reseña_IdInscripcion Primary Key (IdInscripcion)
go
Alter Table Reseña
Add Constraint Fk_Reseña_ReseñaToInscripciones Foreign Key (IdInscripcion) References Inscripciones(IdInscripcion)
go
Alter Table Reseña
Add Constraint Che_Reseña_Puntaje Check(Puntaje>0 And Puntaje<11)

go 
Create Table Usuario (
IdUsuario BigInt Not Null Identity (1,1),
IdDatosUsuario BigInt Not Null,
NombreUsuario Varchar(50) Not Null,
)
go
Alter Table Usuario
Add Constraint Pk_Usuario_IdUsuario Primary Key(IdUsuario)
go
Alter Table Usuario
Add Constraint Fk_DatosUsuariotoUsuario_IdDatosUsuario Foreign Key(IdDatosUsuario) References DatosUsuario(IdDatosUsuario)
go 
Alter Table Usuario
Add Constraint U_Usuario_IdDatosUsuario Unique(IdDatosUsuario)
go
Alter Table Usuario
Add Constraint U_Usuario_NombreUsuario Unique(NombreUsuario)

go 
Create Table Instructor(
IdUsuario BigInt Not Null,
IdCurso BigInt Not Null
)
go
Alter Table Instructor
Add Constraint Pk_Instructor_IdUsuarioAndIdCurso Primary Key (IdUsuario,IdCurso)
go
Alter Table Instructor
Add Constraint Fk_Istructor_InstructorToUsuario Foreign Key(IdUsuario) References Usuario(IdUsuario)
go
Alter Table Instructor
Add Constraint Fk_Istructor_InstructorToCursos Foreign Key(IdCurso) References Cursos(IdCurso)
go 
Create Table MailUsuario (
IdUsuario BigInt Not Null,
Email Varchar(150) Not Null
)
go
Alter Table MailUsuario
Add Constraint Fk_MailUsuariotoUsuario_IdUsuario Foreign Key (IdUsuario) References Usuario(IdUsuario)
go
Alter Table MailUsuario
Add Constraint Pk_IdUsuario_Email Primary Key (IdUsuario,Email)
go
Alter Table MailUsuario
Add Constraint U_MailUsuario_Email Unique (Email)
go 
Create Table TelefonoUsuario(
IdUsuario BigInt Not Null,
Telefono  BigInt Not Null
)
go
Alter Table TelefonoUsuario
Add Constraint Pk_TelefonoUsuario_IdUsuarioAndTelefono Primary Key(IdUsuario,Telefono)
go
Alter Table TelefonoUsuario
Add Constraint Fk_TelefonoUsuariotoUsuario_IdUsuario Foreign Key (IdUsuario) References Usuario(IdUsuario)
go 
Create Table DatosUsuario (
IdDatosUsuario BigInt Not Null Identity(1,1),
Apellido Varchar(50) Not Null,
Nombre Varchar(50) Not Null,
FechaNacimiento Date Not Null,
Genero char Not Null,
CodigoPostal SmallInt Not Null,
Domicilio Varchar(150) Not Null,
IdPais Smallint Not Null
)
go 
Alter Table DatosUsuario
Add Constraint Pk_DatosUsuario_IdDatosUsuario Primary Key(IdDatosUsuario)
go 
Alter Table DatosUsuario
Add Constraint Che_DatosUsuario_FechaNacimiento Check (FechaNacimiento<getdate())
go 
Alter Table DatosUsuario
Add Constraint Che_DatosUsuario_Genero Check (Upper(Genero) In('M','F'))
go 
Alter Table DatosUsuario
Add Constraint Che_DatosUsuario_CodigoPostal Check(CodigoPostal>0)
go 
Alter Table DatosUsuario
Add Constraint Fk_PaisesToDatosUsuario_Paises Foreign Key (IdPais) References Paises(IdPais)
go 
Create Table Paises(
IdPais Smallint Not Null Identity(1,1),
NombrePais Varchar(50) Not Null
)
go
Alter Table Paises
Add Constraint Pk_Paises_IdPais Primary Key (IdPais)
go 
Alter Table Paises
Add Constraint U_Paises_NombrePais Unique (NombrePais)


/*
Create Table Clase(
IdCurso BigInt Not Null,
IdClase BigInt Not Null Identity(1,1), 
NombreClase VarChar(50)Not Null

)
go
Alter Table Clase 
Add Constraint Pk_Clase_IdCurso_NombreClase Primary Key(IdCurso,NombreClase)

go
Alter Table Clase
Add Constraint Fk_Clase_IdCurso Foreign Key (IdCurso) References Cursos(IdCurso)
go
Alter Table Clase 
Add Constraint U_Clase_IdClase Unique(IdClase)
go

Create Table DetalleClase(
IdClase BigInt Not Null,
NumeroDeClase SmallInt Not Null,
Duracion SmallInt Not Null,
)
go
Alter Table DetalleClase
Add Constraint Pk_DetalleClase_IdClase_NumeroDeClase Primary key(IdClase,NumeroDeClase)

go
Alter Table DetalleClase
Add Constraint Che_DetalleClase_NumeroDeClase Check(NumeroDeClase>0)
go
Alter Table DetalleClase
Add Constraint Che_DetalleClase_Duracion Check(Duracion>0)

go
Alter Table DetalleClase
Add Constraint U_DetalleClase_IdClase Unique (IdClase)
go
Alter Table DetalleClase
Add Constraint Fk_DetalleClase_IdClase Foreign Key(IdClase)References Clase (IdClase)
go
*/
/*
Drop Table Cursos
Drop Table Categoria
Drop Table CategoriaPorCurso
Drop Table Idioma
Drop Table Contenido
Drop Table NombreFormatos
Drop Table Clase
Drop Table TipoContenido
Drop Table Formatos
Drop Table Niveles
Drop Table DatosUsuarios
*/