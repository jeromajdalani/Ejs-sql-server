Use MonkeyUniv

--Ej 1
Select Nombre From Idiomas 
--Ej 2
Select Nombre From Cursos
--Ej 3
Select Nombre,CostoCurso,CostoCertificacion,Estreno from Cursos
-- 4	Listado con ID, nombre, costo de inscripción e ID de nivel de todos los cursos cuyo costo de certificación sea menor a $ 5000.
Select * From Cursos
Select ID,Nombre,CostoCurso as 'Costo Inscripcion',IdNivel From Cursos Where CostoCertificacion<5000
-- 5	Listado con ID, nombre, costo de inscripción e ID de nivel de todos los cursos cuyo costo de certificación sea mayor a $ 1200.
Select Id,Nombre,CostoCurso as 'Costo Inscripcion', IdNivel from Cursos Where CostoCertificacion>1200
-- 6	Listado con nombre, número y duración de todas las clases del curso con ID número 6.
Select *From Clases
Select Nombre,Numero,Duracion From Clases where IDCurso In (6)
-- 7	Listado con nombre, número y duración de todas las clases del curso con ID número 10.
Select Nombre,Numero,Duracion From Clases where IDCurso = 10
-- 8	Listado con nombre y duración de todas las clases con ID número 4. Ordenado por duración de mayor a menor.
Select Nombre,Duracion From Clases where Id=4 Order By Duracion desc
-- 9	Listado con nombre, fecha de estreno, costo del curso, costo de certificación ordenados por fecha de estreno de manera creciente.
Set Dateformat 'DMY'
Select Nombre,Estreno,CostoCurso,CostoCertificacion from Cursos Order By Estreno Asc 
-- 10	Listado con nombre, fecha de estreno y costo del curso de todos aquellos cuyo ID de nivel sea 1, 5, 6 o 7.
Select * From Cursos
Select Nombre,Estreno,CostoCurso From Cursos where IdNivel In(1,5,6,7)
-- 11	Listado con nombre, fecha de estreno e ID de curso de todos los cursos cuyo número de clase sea 1, 4, o 5.
Select Nombre,Estreno,Id as 'Id Curso'from Cursos where IDNivel In(1,4,5) 
--Select * From Clases
-- 12	Listado con nombre, duración y costo del curso de todos aquellos cuyo ID de nivel no sean 1, 5, 9 y 10.
Select Nombre,Estreno,CostoCurso from Cursos where IdNivel Not In(1,5,9,10)
Select * From Cursos
-- 13	Listado con nombre y fecha de estreno de todos los cursos cuya fecha de estreno haya sido en el primer semestre del año 2019.
Select Nombre,Estreno From Cursos where Month(Estreno)<=6
-- 14	Listado de cursos cuya fecha de estreno haya sido en el año 2020.
Select * From Cursos Where Year(Estreno)=2020
-- 15	Listado de cursos cuya mes de estreno haya sido entre el 1 y el 4.
Select * From Cursos where Month(Estreno) Between 1 And 4
-- 16	Listado de clases cuya duración se encuentre entre 15 y 90 minutos.
Select * From Clases Where Duracion Between 15 And 90
-- 17	Listado de contenidos cuyo tamaño supere los 5000MB y sean de tipo 4 o sean menores a 400MB y sean de tipo 1.
Select * From Contenidos where Tamaño>5000 and IdTipo in (4) or Tamaño < 400 and IdTipo=1 Order By IdTipo Asc,Tamaño Desc
-- 18	Listado de cursos que no posean ID de nivel.
Select * From Cursos where IDNivel is Null
-- 19	Listado de cursos cuyo costo de certificación corresponda al 20% o más del costo del curso.
Select * From Cursos where CostoCertificacion >= (CostoCurso*20)/100  
-- 20	Listado de costos de cursado de todos los cursos sin repetir y ordenados de mayor a menor.
Select distinct CostoCurso From Cursos  Order By CostoCurso desc
Select Top (1) with ties CostoCurso From Cursos order by CostoCurso asc
Select All Cursos.Estreno From Cursos