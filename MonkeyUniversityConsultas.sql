Create Database MonkeyUniv
go
Use MonkeyUniv
Go
Create Table Niveles(
    ID tinyint not null primary key identity (1, 1),
    Nombre varchar(50) not null
)
GO
Create Table Idiomas(
    ID smallint not null primary key identity (1, 1),
    Nombre varchar(50) not null
)
GO
Create Table TiposIdioma(
    ID tinyint not null primary key identity (1, 1),
    Nombre varchar(50) not null
)
Go
Create Table Categorias(
    ID smallint not null primary key identity (1, 1),
    Nombre varchar(100) not null
)
GO
Create Table TiposContenido(
    ID int not null primary key identity (1, 1),
    Nombre varchar(100) not null
)
Go
Create Table Cursos(
    ID bigint not null primary key identity (1, 1),
    IDNivel tinyint null foreign key references Niveles(ID),
    Nombre varchar(100) not null,
    CostoCurso money not null check (CostoCurso >= 0),
    CostoCertificacion money not null check (CostoCertificacion >= 0),
    Estreno date not null
)
Go
Create Table Clases(
    ID bigint not null primary key identity (1, 1),
    IDCurso bigint not null foreign key references Cursos(ID),
    Nombre varchar(100) not null,
    Numero smallint null check (Numero >= 0),
    Duracion int not null check (Duracion > 0)
)
Go
Create Table Contenidos(
    ID bigint not null primary key identity (1, 1),
    IDClase bigint foreign key references Clases(ID),
    IDTipo int not null foreign key references TiposContenido(ID),
    Tamaño int not null check (Tamaño > 0)
)
Go
Create Table Idiomas_x_Curso(
    IDCurso bigint not null foreign key references Cursos(ID),
    IDIdioma smallint not null foreign key references Idiomas(ID),
    IDTipo tinyint not null foreign key references TiposIdioma(ID),
    Primary key (IDCurso, IDIdioma, IDTipo)
)
go
Create Table Categorias_x_Curso(
    IDCurso bigint not null foreign key references Cursos(ID),
    IDCategoria smallint not null foreign key references Categorias(ID),
    Primary Key (IDCurso, IDCategoria)
)
go
USE [MonkeyUniv]
GO
SET DATEFORMAT 'YMD'
GO
SET IDENTITY_INSERT [dbo].[Niveles] ON 
GO
INSERT [dbo].[Niveles] ([ID], [Nombre]) VALUES (1, N'Introductivo')
GO
INSERT [dbo].[Niveles] ([ID], [Nombre]) VALUES (2, N'Aficionado')
GO
INSERT [dbo].[Niveles] ([ID], [Nombre]) VALUES (3, N'Avanzado')
GO
INSERT [dbo].[Niveles] ([ID], [Nombre]) VALUES (4, N'Medio')
GO
INSERT [dbo].[Niveles] ([ID], [Nombre]) VALUES (5, N'Principiante')
GO
INSERT [dbo].[Niveles] ([ID], [Nombre]) VALUES (6, N'Junior')
GO
INSERT [dbo].[Niveles] ([ID], [Nombre]) VALUES (7, N'Experto')
GO
SET IDENTITY_INSERT [dbo].[Niveles] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (1, 5, N'Lenguaje C', 14000.0000, 7000.0000, CAST(N'2015-10-10' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (2, NULL, N'Cocina italiana', 20000.0000, 8500.0000, CAST(N'2019-09-09' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (3, 3, N'Bordado: Técnicas avanzadas', 5000.0000, 1000.0000, CAST(N'2018-07-03' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (4, 5, N'Python 101', 13000.0000, 4000.0000, CAST(N'2017-07-07' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (5, 5, N'Javascript 101', 10000.0000, 5000.0000, CAST(N'2017-07-07' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (6, 2, N'Introducción a la pesca con mosca', 17000.0000, 7000.0000, CAST(N'2020-09-21' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (7, 4, N'Preparación de mermeladas', 10000.0000, 1000.0000, CAST(N'2020-08-10' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (8, 5, N'Pixel art', 0.0000, 15000.0000, CAST(N'2019-10-11' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (9, 5, N'Guitarra', 0.0000, 1500.0000, CAST(N'2015-05-06' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (10, NULL, N'Edad Media: Armas y técnicas bélicas', 50000.0000, 35000.0000, CAST(N'2020-08-20' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (11, NULL, N'Historia del Rock Argentino', 20000.0000, 2000.0000, CAST(N'2020-08-20' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (12, 5, N'Ajedrez', 7000.0000, 700.0000, CAST(N'2008-04-11' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (13, 5, N'Go', 7000.0000, 700.0000, CAST(N'2008-04-11' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (14, 5, N'Damas', 7000.0000, 700.0000, CAST(N'2008-04-11' AS Date))
GO
INSERT [dbo].[Cursos] ([ID], [IDNivel], [Nombre], [CostoCurso], [CostoCertificacion], [Estreno]) VALUES (15, NULL, N'Internet para dummies', 5000.0000, 50.0000, CAST(N'2010-08-19' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Idiomas] ON 
GO
INSERT [dbo].[Idiomas] ([ID], [Nombre]) VALUES (1, N'Castellano')
GO
INSERT [dbo].[Idiomas] ([ID], [Nombre]) VALUES (2, N'Inglés')
GO
INSERT [dbo].[Idiomas] ([ID], [Nombre]) VALUES (3, N'Italiano')
GO
INSERT [dbo].[Idiomas] ([ID], [Nombre]) VALUES (4, N'Francés')
GO
INSERT [dbo].[Idiomas] ([ID], [Nombre]) VALUES (5, N'Portugués')
GO
INSERT [dbo].[Idiomas] ([ID], [Nombre]) VALUES (6, N'Chino')
GO
SET IDENTITY_INSERT [dbo].[Idiomas] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposIdioma] ON 
GO
INSERT [dbo].[TiposIdioma] ([ID], [Nombre]) VALUES (1, N'Subtítulo')
GO
INSERT [dbo].[TiposIdioma] ([ID], [Nombre]) VALUES (2, N'Audio')
GO
INSERT [dbo].[TiposIdioma] ([ID], [Nombre]) VALUES (3, N'Texto del video')
GO
SET IDENTITY_INSERT [dbo].[TiposIdioma] OFF
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (1, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (1, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (1, 2, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (1, 3, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (1, 4, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (1, 5, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (2, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (2, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (2, 2, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (2, 3, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (2, 3, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (2, 4, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (2, 5, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (3, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (4, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (4, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (4, 2, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (4, 3, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (4, 4, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (4, 5, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (5, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (5, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (5, 2, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (5, 3, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (5, 4, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (5, 5, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (6, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (6, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (6, 2, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (6, 3, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (6, 4, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (6, 5, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (7, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (7, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (7, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (8, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (8, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (8, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (9, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (10, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (10, 2, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (10, 2, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (11, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (11, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (12, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (12, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (13, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (13, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (14, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (14, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (15, 1, 1)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (15, 1, 2)
GO
INSERT [dbo].[Idiomas_x_Curso] ([IDCurso], [IDIdioma], [IDTipo]) VALUES (15, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (2, N'Arte')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (3, N'Bélico')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (4, N'Bordado')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (5, N'Cocina')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (6, N'Deportes individuales')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (7, N'Diseño')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (8, N'Edad media')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (9, N'Historia')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (10, N'Informática')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (11, N'Internet')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (12, N'Italia')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (13, N'Juegos de tablero')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (14, N'Manualidades')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (15, N'Música')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (16, N'Negocios')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (17, N'Pesca')
GO
INSERT [dbo].[Categorias] ([ID], [Nombre]) VALUES (18, N'Programación')
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (1, 10)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (1, 18)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (2, 5)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (2, 12)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (3, 2)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (3, 4)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (3, 14)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (4, 10)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (4, 18)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (5, 10)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (5, 18)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (6, 6)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (6, 17)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (7, 5)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (7, 16)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (8, 2)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (8, 7)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (8, 10)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (9, 2)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (9, 9)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (9, 15)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (10, 3)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (10, 8)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (10, 9)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (11, 1)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (11, 9)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (11, 15)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (12, 6)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (12, 9)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (12, 13)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (13, 6)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (13, 9)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (13, 13)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (14, 9)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (14, 13)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (15, 10)
GO
INSERT [dbo].[Categorias_x_Curso] ([IDCurso], [IDCategoria]) VALUES (15, 11)
GO
SET IDENTITY_INSERT [dbo].[TiposContenido] ON 
GO
INSERT [dbo].[TiposContenido] ([ID], [Nombre]) VALUES (1, N'Audio de alta calidad')
GO
INSERT [dbo].[TiposContenido] ([ID], [Nombre]) VALUES (2, N'Examen')
GO
INSERT [dbo].[TiposContenido] ([ID], [Nombre]) VALUES (3, N'Texto')
GO
INSERT [dbo].[TiposContenido] ([ID], [Nombre]) VALUES (4, N'Video')
GO
SET IDENTITY_INSERT [dbo].[TiposContenido] OFF
GO
SET IDENTITY_INSERT [dbo].[Clases] ON 
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (1, 1, N'Tipos de datos y variables', 1, 45)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (2, 1, N'Estructura de decisión', 2, 45)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (3, 1, N'Estructura de repetición', 3, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (4, 1, N'Arrays', 4, 60)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (5, 1, N'Funciones', 5, 70)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (6, 2, N'Pastas', 1, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (7, 2, N'Pizzas', 2, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (8, 2, N'Pescados', 3, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (9, 2, N'Dulces', 4, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (10, 3, N'Elementos básicos para comenzar', 1, 45)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (11, 3, N'Tipos de telas', 2, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (12, 3, N'Tipos de puntos', 3, 60)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (13, 4, N'Tipos de datos y variables', 1, 30)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (14, 4, N'Estructura de decisión', 2, 40)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (15, 4, N'Estructura de repetición', 3, 20)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (16, 4, N'Arrays', 4, 40)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (17, 4, N'Funciones', 5, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (18, 4, N'Clases', 6, 100)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (19, 5, N'Tipos de datos y variables', 1, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (20, 5, N'Estructura de decisión', 2, 60)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (21, 5, N'Estructura de repetición', 3, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (22, 5, N'Arrays', 4, 70)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (23, 5, N'Funciones', 5, 60)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (24, 5, N'Clases', 6, 70)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (25, 6, N'Elementos básicos para comenzar', 1, 90)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (26, 6, N'Los peces', 2, 120)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (27, 6, N'Las moscas', 3, 90)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (28, 7, N'Frutas de estación', 1, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (29, 7, N'Cocción y almacenamiento', 2, 50)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (30, 7, N'Herramientas para venta online', 3, 90)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (31, 7, N'Poniendose al día con la AFIP', 4, 110)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (32, 8, N'Empezando: Ejemplos', 1, 60)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (33, 8, N'Práctica', 2, 70)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (34, 8, N'Abandonando porque no me sale', 3, 5)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (35, 9, N'Historia de la guitarra', 1, 60)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (36, 9, N'Historia de las cuerdas de la guitarra', 2, 40)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (37, 9, N'Historia de las clavijas de la guitarra', 3, 70)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (38, 9, N'Brian May', 4, 80)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (39, 10, N'La caballería', 1, 150)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (40, 10, N'La infantería', 2, 200)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (41, 10, N'Tropas lanzaproyectiles', 3, 240)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (42, 10, N'Armas de asedio', 4, 330)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (43, 11, N'Virus', 1, 120)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (44, 11, N'Soda Stereo', 2, 120)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (45, 11, N'Las demás bandas', 3, 30)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (46, 12, N'Reglas de juego', 1, 80)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (47, 13, N'Reglas de juego', 1, 80)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (48, 14, N'Reglas de juego', 1, 40)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (49, 15, N'La historia de Internet', 1, 90)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (50, 15, N'Memes', 2, 70)
GO
INSERT [dbo].[Clases] ([ID], [IDCurso], [Nombre], [Numero], [Duracion]) VALUES (51, 15, N'¿Cómo mandar spam?', 3, 50)
GO
SET IDENTITY_INSERT [dbo].[Clases] OFF
GO
SET IDENTITY_INSERT [dbo].[Contenidos] ON 
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (1, 1, 3, 3)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (2, 1, 4, 42129)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (3, 2, 3, 9)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (4, 2, 4, 42479)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (5, 3, 3, 8)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (6, 3, 4, 31123)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (7, 4, 3, 8)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (8, 4, 4, 52558)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (9, 5, 3, 2)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (10, 5, 4, 27233)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (11, 6, 4, 7565)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (12, 7, 4, 11748)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (13, 8, 4, 12277)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (14, 9, 4, 41865)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (15, 10, 3, 10)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (16, 10, 4, 55689)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (17, 11, 3, 10)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (18, 11, 4, 13564)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (19, 12, 3, 8)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (20, 12, 4, 45610)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (21, 1, 3, 4)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (22, 1, 4, 23281)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (23, 2, 3, 8)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (24, 2, 4, 27679)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (25, 3, 3, 2)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (26, 3, 4, 6054)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (27, 4, 3, 1)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (28, 4, 4, 33472)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (29, 5, 3, 4)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (30, 5, 4, 27925)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (31, 5, 2, 1)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (32, 18, 3, 7)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (33, 18, 4, 21568)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (34, 18, 2, 2)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (35, 1, 4, 1093)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (36, 2, 4, 57116)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (37, 3, 4, 22670)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (38, 4, 4, 40725)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (39, 5, 4, 1772)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (40, 18, 4, 50823)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (41, 10, 4, 8836)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (42, 26, 4, 23943)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (43, 27, 4, 50476)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (44, 28, 3, 1)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (45, 28, 4, 54331)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (46, 28, 2, 2)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (47, 29, 3, 6)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (48, 29, 4, 17761)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (49, 29, 2, 2)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (50, 30, 3, 5)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (51, 30, 4, 56704)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (52, 30, 2, 2)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (53, 31, 3, 1)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (54, 31, 4, 13237)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (55, 31, 2, 1)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (56, 32, 4, 15684)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (57, 33, 4, 24366)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (58, 34, 4, 7753)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (59, 35, 1, 34)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (60, 36, 1, 807)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (61, 37, 1, 459)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (62, 38, 1, 745)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (63, 35, 4, 6799)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (64, 36, 4, 2868)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (65, 37, 4, 18715)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (66, 38, 4, 31962)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (67, 39, 3, 9)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (68, 40, 3, 9)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (69, 41, 3, 7)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (70, 42, 3, 8)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (71, 39, 4, 27851)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (72, 40, 4, 48400)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (73, 41, 4, 46921)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (74, 42, 4, 29492)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (75, 43, 1, 741)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (76, 44, 1, 143)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (77, 45, 1, 123)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (78, 43, 4, 59839)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (79, 44, 4, 16470)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (80, 45, 4, 44445)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (81, 46, 3, 1)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (82, 46, 3, 3)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (83, 46, 3, 2)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (84, 49, 4, 21649)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (85, 50, 4, 18306)
GO
INSERT [dbo].[Contenidos] ([ID], [IDClase], [IDTipo], [Tamaño]) VALUES (86, 51, 4, 21680)
GO
SET IDENTITY_INSERT [dbo].[Contenidos] OFF
GO

Create Table Paises(
    ID smallint not null primary key,
    Nombre varchar(50) not null
)
go
Create Table Usuarios(
    ID bigint not null primary key identity (1, 1),
    NombreUsuario varchar(50) not null unique,
)
go
Create Table Datos_Personales(
    ID bigint not null primary key foreign key references Usuarios(ID),
    Apellidos varchar(100) not null,
    Nombres varchar(100) not null,
    Nacimiento date not null,
    Genero char not null,
    Celular varchar(15) null,
    Email varchar(140) null,
    Domicilio varchar(200) not null,
    CP smallint not null,
    IDPais smallint not null foreign key references Paises(ID)
)
go
Create Table Inscripciones(
    ID bigint not null primary key identity (1, 1),
    IDUsuario bigint not null foreign key references Usuarios(ID),
    IDCurso bigint not null foreign key references Cursos(ID),
    Fecha date not null default(getdate()),
    Costo money not null check (Costo >= 0)
)
go
Create Table Pagos(
    ID bigint not null primary key identity (1, 1),
    IDInscripcion bigint not null foreign key references Inscripciones(ID),
    Fecha date not null default(getdate()),
    Importe money not null check(Importe > 0)
)
go
Create Table Certificaciones(
    IDInscripcion bigint not null primary key foreign key references Inscripciones(ID),
    Fecha date not null default(getdate()),
    Costo money not null check(Costo >= 0)
)
go
Create Table Reseñas(
    IDInscripcion bigint not null primary key foreign key references Inscripciones(ID),
    Fecha date not null default(getdate()),
    Observaciones varchar(MAX) not null,
    Puntaje decimal(3, 1) not null,
    Inapropiada bit not null default(0)
)
go
Create Table Instructores_x_Curso(
    IDUsuario bigint not null foreign key references Usuarios(ID),
    IDCurso bigint not null foreign key references Cursos(ID),
    Primary Key (IDUsuario, IDCurso)
)
go
Set dateformat 'YMD'
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (2, N'Brasil')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (3, N'Chile')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (4, N'España')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (5, N'Estados Unidos')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (6, N'Italia')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (7, N'Uruguay')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (8, N'Inglaterra')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (9, N'Paraguay')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (10, N'Colombia')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (1, N'aalberti')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (6, N'acacchione')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (7, N'achaparro')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (10, N'adiaz')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (29, N'aolivera')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (28, N'bmolteni')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (14, N'cferreira')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (20, N'ciglesias')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (21, N'cjesus')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (30, N'corellana')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (33, N'cpaolini')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (12, N'dfernandez')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (5, N'ebreyaue')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (37, N'esalcedo')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (17, N'ggonzalez')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (24, N'glopez')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (27, N'gmolinos')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (38, N'hvillalba')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (9, N'icordoba')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (23, N'ikeegan')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (8, N'jcontreras')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (22, N'jjuarez')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (25, N'jmajdalani')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (26, N'lmendoza')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (31, N'lorihuela')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (36, N'lrodriguez')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (39, N'lvillalva')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (2, N'mantezana')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (11, N'mdominguez')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (13, N'mferrari')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (16, N'mgonzalez')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (32, N'mpais')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (4, N'nblanco')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (15, N'nflori')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (34, N'npieruzzini')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (3, N'obianchi')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (19, N'pibazeta')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (18, N'rhuarcaya')
GO
INSERT [dbo].[Usuarios] ([ID], [NombreUsuario]) VALUES (35, N'wrepolledo')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (1, N'Alberti', N'Alan Fernando', CAST(N'1991-03-11' AS Date), N'M', N'1511190842', N'aalberti@mail.com', N'Batalla de Alberti 33365', 1625, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (2, N'Antezana Velazque', N'Marcos Daniel', CAST(N'1991-01-28' AS Date), N'M', N'1511658411', N'mantezana@utn.edu.ar', N'Virrey Antezana Velazque 34751', 1642, 7)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (3, N'Bianchi Di Rocco', N'Oscar Alberto', CAST(N'1984-04-27' AS Date), N'M', N'1511478142', N'obianchi@gmail.com', N'Virrey Bianchi Di Rocco 20001', 1633, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (4, N'Blanco', N'Nazareno Tomas', CAST(N'1986-08-27' AS Date), N'M', N'1511770422', N'nblanco@gmail.com', N'Santa Blanco 14811', 1629, 7)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (5, N'Breyaue', N'Emmanuel David', CAST(N'1984-04-29' AS Date), N'M', N'1511731160', N'ebreyaue@utn.edu.ar', N'Cardenal Breyaue 28501', 1612, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (6, N'Cacchione', N'Andres Omar', CAST(N'1978-01-07' AS Date), N'M', N'1511284177', null, N'Virrey Cacchione 2120', 1619, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (7, N'Chaparro', N'Agustin', CAST(N'2001-11-07' AS Date), N'M', N'1511782647', null, N'Obispo Chaparro 4627', 1601, 5)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (8, N'Contreras', N'Juan Ignacio', CAST(N'1972-07-20' AS Date), N'M', null, null, N'Virrey Contreras 32614', 1607, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (9, N'Cordoba', N'Ignacio David', CAST(N'1993-06-10' AS Date), N'M', N'1511268095', N'icordoba@hotmail.com.ar', N'Santa Cordoba 22474', 1624, 4)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (10, N'Diaz', N'Ailen Estefania', CAST(N'1984-06-24' AS Date), N'F', null, N'adiaz@hotmail.com.ar', N'Obispo Diaz 4132', 1626, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (11, N'Dominguez', N'Maximiliano Fernando Luis', CAST(N'1975-12-03' AS Date), N'M', N'1511381440', N'mdominguez@hotmail.com', N'Obispo Dominguez 22949', 1623, 6)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (12, N'Fernandez', N'Daniel David', CAST(N'1978-12-24' AS Date), N'M', N'1511574306', N'dfernandez@hotmail.com', N'San Fernandez 39871', 1647, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (13, N'Ferrari', N'Maria Silvana', CAST(N'1987-11-24' AS Date), N'F', null, N'mferrari@mail.com', N'Obispo Ferrari 6021', 1618, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (14, N'Ferreira', N'Cristian Nicolas', CAST(N'1990-04-18' AS Date), N'M', N'1511654956', N'cferreira@utn.edu.ar', N'General Ferreira 31627', 1602, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (15, N'Flori', N'Nicolas Ezequiel', CAST(N'1978-09-07' AS Date), N'M', N'1511449859', N'nflori@mail.com', N'Obispo Flori 33457', 1637, 2)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (16, N'Gonzalez Samperi', N'Matias Ezequiel', CAST(N'1977-09-06' AS Date), N'M', null, N'mgonzalez@mail.com', N'Presidente Gonzalez Samperi 10936', 1637, 3)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (17, N'Gonzalez', N'Guillermo Adrian', CAST(N'1990-12-20' AS Date), N'M', N'1511181907', N'ggonzalez@utn.edu.ar', N'Virrey Gonzalez 18066', 1610, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (18, N'Huarcaya Sánchez', N'Ricardo Alonso', CAST(N'1997-11-26' AS Date), N'M', N'1511170568', null, N'Comandante Huarcaya Sánchez 33580', 1603, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (19, N'Ibazeta', N'Pablo Agustín', CAST(N'1985-10-24' AS Date), N'M', N'1511135879', N'pibazeta@hotmail.com.ar', N'Santa Ibazeta 20958', 1641, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (20, N'Iglesias', N'Cristian', CAST(N'1986-09-26' AS Date), N'M', null, N'ciglesias@gmail.com', N'Virrey Iglesias 6558', 1638, 6)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (21, N'Jesus Sipiran', N'Carlos Alfredo', CAST(N'1983-01-13' AS Date), N'M', null, N'cjesus@hotmail.com.ar', N'Santa Jesus Sipiran 10071', 1648, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (22, N'Juarez', N'Juan Manuel', CAST(N'1976-06-23' AS Date), N'M', null, N'jjuarez@utn.edu.ar', N'San Juarez 16524', 1625, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (23, N'Keegan', N'Ignacio Nicolas', CAST(N'1999-10-17' AS Date), N'M', null, N'ikeegan@utn.edu.ar', N'Virrey Keegan 31264', 1628, 6)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (24, N'Lopez', N'Gonzalo Ezequiel', CAST(N'1993-05-04' AS Date), N'M', null, N'glopez@mail.com', N'Virrey Lopez 34815', 1600, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (25, N'Majdalani', N'Jeronimo', CAST(N'1988-02-07' AS Date), N'M', null, null, N'San Majdalani 27491', 1633, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (26, N'Mendoza', N'Leonardo Oscar', CAST(N'1986-11-01' AS Date), N'M', null, N'lmendoza@utn.edu.ar', N'Virrey Mendoza 16565', 1633, 5)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (27, N'Molinos Zola', N'Gabriel', CAST(N'1980-05-21' AS Date), N'M', null, N'gmolinos@hotmail.com', N'San Molinos Zola 32111', 1627, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (28, N'Molteni', N'Bruno Mauricio', CAST(N'1988-11-16' AS Date), N'M', null, null, N'Santa Molteni 20053', 1646, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (29, N'Olivera', N'Alejandro Alberto', CAST(N'1993-03-14' AS Date), N'M', null, N'aolivera@mail.com', N'Batalla de Olivera 39116', 1604, 2)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (30, N'Orellana', N'Carlos Alberto', CAST(N'1996-10-10' AS Date), N'M', null, N'corellana@hotmail.com', N'Obispo Orellana 7304', 1627, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (31, N'Orihuela', N'Lucas Franco', CAST(N'1998-03-15' AS Date), N'M', null, N'lorihuela@hotmail.com.ar', N'Santa Orihuela 36108', 1641, 6)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (32, N'Pais', N'Manuel Agustin', CAST(N'1991-11-27' AS Date), N'M', null, N'mpais@hotmail.com', N'Comandante Pais 8097', 1635, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (33, N'Paolini Vattuone', N'Cristian Andres', CAST(N'1980-08-22' AS Date), N'M', null, N'cpaolini@utn.edu.ar', N'General Paolini Vattuone 35066', 1614, 6)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (34, N'Pieruzzini Pla', N'Nestor Tomas', CAST(N'1976-12-05' AS Date), N'M', N'1511627856', N'npieruzzini@hotmail.com.ar', N'Comandante Pieruzzini Pla 16921', 1618, 5)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (35, N'Repolledo Rodas', N'Wendy Maite', CAST(N'1972-02-24' AS Date), N'F', N'1511749540', N'wrepolledo@hotmail.com', N'Comandante Repolledo Rodas 11490', 1637, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (36, N'Rodriguez', N'Leandro Hernan', CAST(N'1990-12-05' AS Date), N'M', N'1511554236', N'lrodriguez@gmail.com', N'General Rodriguez 26037', 1647, 1)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (37, N'Salcedo Paucar', N'Edwin Mishaell', CAST(N'1986-05-07' AS Date), N'M', N'1511321809', null, N'Virrey Salcedo Paucar 24247', 1606, 3)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (38, N'Villalba', N'Hernan Gabriel', CAST(N'1972-11-26' AS Date), N'M', N'1511193441', N'hvillalba@gmail.com', N'Cardenal Villalba 17719', 1648, 4)
GO
INSERT [dbo].[Datos_Personales] ([ID], [Apellidos], [Nombres], [Nacimiento], [Genero], [Celular], [Email], [Domicilio], [CP], [IDPais]) VALUES (39, N'Villalva', N'Lautaro Javier', CAST(N'1972-11-27' AS Date), N'M', N'1511375998', N'lvillalva@gmail.com', N'San Villalva 36458', 1615, 1)
GO
SET IDENTITY_INSERT [dbo].[Inscripciones] ON 
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (1, 26, 1, CAST(N'2018-04-22' AS Date), 14000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (2, 39, 1, CAST(N'2018-03-02' AS Date), 14000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (3, 34, 1, CAST(N'2019-06-18' AS Date), 14000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (4, 21, 1, CAST(N'2018-10-05' AS Date), 14000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (5, 7, 1, CAST(N'2019-02-06' AS Date), 14000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (6, 31, 2, CAST(N'2019-05-26' AS Date), 20000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (7, 27, 2, CAST(N'2019-06-20' AS Date), 20000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (8, 25, 2, CAST(N'2018-10-29' AS Date), 20000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (9, 16, 2, CAST(N'2019-01-13' AS Date), 20000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (10, 4, 3, CAST(N'2019-08-02' AS Date), 5000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (11, 26, 3, CAST(N'2019-02-11' AS Date), 5000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (12, 20, 3, CAST(N'2018-02-07' AS Date), 5000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (13, 27, 4, CAST(N'2018-08-22' AS Date), 13000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (14, 35, 4, CAST(N'2019-03-15' AS Date), 13000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (15, 29, 4, CAST(N'2018-04-19' AS Date), 13000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (16, 17, 4, CAST(N'2020-02-22' AS Date), 13000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (17, 33, 4, CAST(N'2019-04-10' AS Date), 13000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (18, 24, 4, CAST(N'2019-01-17' AS Date), 13000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (19, 38, 5, CAST(N'2019-05-03' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (20, 1, 5, CAST(N'2018-06-08' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (21, 9, 5, CAST(N'2019-11-11' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (22, 25, 5, CAST(N'2019-02-23' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (23, 13, 5, CAST(N'2019-11-08' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (24, 23, 5, CAST(N'2019-08-19' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (25, 39, 6, CAST(N'2019-09-12' AS Date), 17000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (26, 23, 6, CAST(N'2019-07-04' AS Date), 17000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (27, 19, 6, CAST(N'2019-07-29' AS Date), 17000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (28, 12, 7, CAST(N'2019-08-13' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (29, 21, 7, CAST(N'2019-11-22' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (30, 12, 7, CAST(N'2019-10-09' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (31, 14, 7, CAST(N'2018-03-02' AS Date), 10000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (32, 6, 8, CAST(N'2018-02-26' AS Date), 0.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (33, 32, 8, CAST(N'2019-11-23' AS Date), 0.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (34, 14, 8, CAST(N'2018-07-15' AS Date), 0.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (35, 25, 9, CAST(N'2018-06-28' AS Date), 0.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (36, 3, 9, CAST(N'2019-09-02' AS Date), 0.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (37, 39, 9, CAST(N'2019-06-21' AS Date), 0.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (38, 7, 9, CAST(N'2018-09-04' AS Date), 0.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (39, 22, 10, CAST(N'2018-12-30' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (40, 2, 10, CAST(N'2018-11-06' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (41, 4, 10, CAST(N'2018-12-20' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (42, 12, 10, CAST(N'2019-10-04' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (43, 22, 10, CAST(N'2019-09-15' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (44, 4, 10, CAST(N'2020-01-18' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (45, 35, 10, CAST(N'2018-11-28' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (46, 4, 10, CAST(N'2018-12-14' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (47, 22, 10, CAST(N'2020-01-07' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (48, 37, 10, CAST(N'2019-01-23' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (49, 6, 10, CAST(N'2018-05-19' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (50, 13, 10, CAST(N'2018-04-29' AS Date), 50000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (51, 1, 11, CAST(N'2019-08-22' AS Date), 20000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (52, 21, 11, CAST(N'2019-11-05' AS Date), 20000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (53, 24, 11, CAST(N'2018-05-05' AS Date), 20000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (54, 38, 12, CAST(N'2019-04-09' AS Date), 7000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (55, 20, 12, CAST(N'2020-01-27' AS Date), 7000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (56, 20, 13, CAST(N'2018-06-09' AS Date), 7000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (57, 14, 14, CAST(N'2019-10-28' AS Date), 7000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (58, 3, 15, CAST(N'2018-01-01' AS Date), 5000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (59, 36, 15, CAST(N'2019-12-06' AS Date), 5000.0000)
GO
INSERT [dbo].[Inscripciones] ([ID], [IDUsuario], [IDCurso], [Fecha], [Costo]) VALUES (60, 39, 15, CAST(N'2018-11-17' AS Date), 5000.0000)
GO
SET IDENTITY_INSERT [dbo].[Inscripciones] OFF
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (1, 11)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (7, 9)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (8, 1)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (11, 3)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (12, 12)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (13, 8)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (15, 8)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (15, 10)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (19, 11)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (23, 6)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (25, 7)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (27, 4)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (30, 4)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (31, 9)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (32, 1)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (32, 2)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (33, 11)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (33, 14)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (35, 5)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (38, 15)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (39, 2)
GO
INSERT [dbo].[Instructores_x_Curso] ([IDUsuario], [IDCurso]) VALUES (39, 13)
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (1, 1, CAST(N'2018-04-22' AS Date), 14000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (2, 2, CAST(N'2018-03-02' AS Date), 14000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (3, 3, CAST(N'2019-06-18' AS Date), 14000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (4, 4, CAST(N'2018-10-05' AS Date), 14000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (5, 5, CAST(N'2019-02-06' AS Date), 14000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (6, 6, CAST(N'2019-05-26' AS Date), 20000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (7, 7, CAST(N'2019-06-20' AS Date), 20000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (8, 8, CAST(N'2018-10-29' AS Date), 20000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (9, 9, CAST(N'2019-01-13' AS Date), 20000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (10, 10, CAST(N'2019-08-02' AS Date), 5000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (11, 11, CAST(N'2019-02-11' AS Date), 5000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (12, 12, CAST(N'2018-02-07' AS Date), 5000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (13, 13, CAST(N'2018-08-22' AS Date), 13000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (14, 14, CAST(N'2019-03-15' AS Date), 13000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (15, 15, CAST(N'2018-04-19' AS Date), 13000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (16, 16, CAST(N'2020-02-22' AS Date), 13000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (17, 17, CAST(N'2019-04-10' AS Date), 13000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (18, 18, CAST(N'2019-01-17' AS Date), 13000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (19, 19, CAST(N'2019-05-03' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (20, 20, CAST(N'2018-06-08' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (21, 21, CAST(N'2019-11-11' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (22, 22, CAST(N'2019-02-23' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (23, 23, CAST(N'2019-11-08' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (24, 24, CAST(N'2019-08-19' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (25, 25, CAST(N'2019-09-12' AS Date), 17000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (26, 26, CAST(N'2019-07-04' AS Date), 17000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (27, 27, CAST(N'2019-07-29' AS Date), 17000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (28, 28, CAST(N'2019-08-13' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (29, 29, CAST(N'2019-11-22' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (30, 30, CAST(N'2019-10-09' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (31, 31, CAST(N'2018-03-02' AS Date), 10000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (32, 39, CAST(N'2018-12-30' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (33, 40, CAST(N'2018-11-06' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (34, 41, CAST(N'2018-12-20' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (35, 42, CAST(N'2019-10-04' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (36, 43, CAST(N'2019-09-15' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (37, 44, CAST(N'2020-01-18' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (38, 45, CAST(N'2018-11-28' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (39, 46, CAST(N'2018-12-14' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (40, 47, CAST(N'2020-01-07' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (41, 48, CAST(N'2019-01-23' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (42, 49, CAST(N'2018-05-19' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (43, 50, CAST(N'2018-04-29' AS Date), 50000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (44, 51, CAST(N'2019-08-22' AS Date), 20000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (45, 52, CAST(N'2019-11-05' AS Date), 20000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (46, 53, CAST(N'2018-05-05' AS Date), 20000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (47, 54, CAST(N'2019-04-09' AS Date), 7000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (48, 55, CAST(N'2020-01-27' AS Date), 7000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (49, 56, CAST(N'2018-06-09' AS Date), 7000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (50, 57, CAST(N'2019-10-28' AS Date), 7000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (51, 58, CAST(N'2018-01-01' AS Date), 5000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (52, 59, CAST(N'2019-12-06' AS Date), 5000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (53, 60, CAST(N'2018-11-17' AS Date), 5000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (54, 1, CAST(N'2018-06-11' AS Date), 250.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (55, 2, CAST(N'2018-04-21' AS Date), 500.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (56, 3, CAST(N'2019-08-07' AS Date), 500.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (57, 24, CAST(N'2019-10-08' AS Date), 900.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (58, 25, CAST(N'2019-11-01' AS Date), 900.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (59, 26, CAST(N'2019-08-23' AS Date), 1000.0000)
GO
INSERT [dbo].[Pagos] ([ID], [IDInscripcion], [Fecha], [Importe]) VALUES (60, 1, CAST(N'2018-09-09' AS Date), 300.0000)
GO
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (1, CAST(N'2018-08-08' AS Date), 5000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (2, CAST(N'2018-05-31' AS Date), 5000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (3, CAST(N'2019-08-19' AS Date), 7000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (4, CAST(N'2018-12-05' AS Date), 5000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (5, CAST(N'2019-04-14' AS Date), 7000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (6, CAST(N'2019-06-22' AS Date), 8000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (7, CAST(N'2019-08-02' AS Date), 8000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (8, CAST(N'2019-02-04' AS Date), 8000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (9, CAST(N'2019-03-15' AS Date), 8000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (10, CAST(N'2019-10-26' AS Date), 1000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (11, CAST(N'2019-02-27' AS Date), 1000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (12, CAST(N'2018-05-15' AS Date), 1000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (13, CAST(N'2018-08-26' AS Date), 3000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (14, CAST(N'2019-03-17' AS Date), 3500.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (15, CAST(N'2018-08-10' AS Date), 3500.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (16, CAST(N'2020-05-22' AS Date), 4000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (17, CAST(N'2019-06-01' AS Date), 3500.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (18, CAST(N'2019-03-18' AS Date), 3500.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (19, CAST(N'2019-08-16' AS Date), 4000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (20, CAST(N'2018-10-04' AS Date), 3000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (21, CAST(N'2019-12-29' AS Date), 5000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (22, CAST(N'2019-06-03' AS Date), 4000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (23, CAST(N'2020-02-14' AS Date), 5000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (24, CAST(N'2019-09-27' AS Date), 4000.0000)
GO
INSERT [dbo].[Certificaciones] ([IDInscripcion], [Fecha], [Costo]) VALUES (25, CAST(N'2019-11-17' AS Date), 7000.0000)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (5, CAST(N'2019-04-29' AS Date), N'No me compiló ningún ejemplo', CAST(2.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (24, CAST(N'2019-09-06' AS Date), N'Excelente, recomiendo!', CAST(10.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (25, CAST(N'2019-12-23' AS Date), N'Muy bueno', CAST(10.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (26, CAST(N'2019-10-01' AS Date), N'No explicó como cocinar los pescados', CAST(5.0 AS Decimal(3, 1)), 1)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (27, CAST(N'2019-08-05' AS Date), N'Estoy muy enojado con el instructor', CAST(2.0 AS Decimal(3, 1)), 1)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (28, CAST(N'2019-10-20' AS Date), N'Cuál es el mail para comprar mermeladas?', CAST(10.0 AS Decimal(3, 1)), 1)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (29, CAST(N'2020-01-21' AS Date), N'Hacés envíos?', CAST(10.0 AS Decimal(3, 1)), 1)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (30, CAST(N'2019-11-30' AS Date), N'No me gustan las mermeladas', CAST(2.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (31, CAST(N'2018-04-14' AS Date), N'No podés hacer uno de escabeches?', CAST(10.0 AS Decimal(3, 1)), 1)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (32, CAST(N'2018-03-31' AS Date), N'No me salió ningún dibujo', CAST(4.0 AS Decimal(3, 1)), 1)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (34, CAST(N'2018-09-12' AS Date), N'Hay que practicar mucho', CAST(5.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (38, CAST(N'2018-10-29' AS Date), N'Hay que practicar mucho', CAST(6.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (39, CAST(N'2019-01-03' AS Date), N'Aguante la Edad Media <3', CAST(10.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (54, CAST(N'2019-06-29' AS Date), N'No enseñó la apertura italiana', CAST(8.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (56, CAST(N'2018-09-01' AS Date), N'Pensé que era un curso de programación y era de un juego de mesa. Igual estuvo bueno.', CAST(9.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (57, CAST(N'2020-01-28' AS Date), N'Genial 100% recomendable', CAST(2.0 AS Decimal(3, 1)), 0)
GO
INSERT [dbo].[Reseñas] ([IDInscripcion], [Fecha], [Observaciones], [Puntaje], [Inapropiada]) VALUES (58, CAST(N'2018-04-21' AS Date), N'Sólo enseñó a dejar reseñas en internet. Acá va una negativa.', CAST(1.0 AS Decimal(3, 1)), 0)
GO






