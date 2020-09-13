Use MonkeyUniv

-- (1)  Listado con la cantidad de cursos.
Select count(*) as 'Cantidad de cursos' from Cursos 

-- 2  Listado con la cantidad de usuarios.
Select count(*) as 'Cantidad de Usuarios' from Usuarios

-- (3)  Listado con el promedio de costo de certificación de los cursos.
Select avg(Cursos.CostoCertificacion)as'Promedio De Certificacion' From Cursos


-- 4  Listado con el promedio general de calificación de reseñas.
Select avg(Reseñas.Puntaje) as 'Promedio de Calificacion de Reseñas 'From Reseñas

-- (5)  Listado con la fecha de estreno de curso más antigua.
Select min(c.Estreno) as 'Fecha de Estreno mas antigua' From Cursos as C

-- 6  Listado con el costo de certificación menos costoso.
Select min(c.CostoCertificacion) as 'Certificacion mas barata' from Cursos as C

-- (7)  Listado con el costo total de todos los cursos.
Select Sum(C.CostoCurso) as 'Costo Total' from Cursos as C


-- 8  Listado con la suma total de todos los pagos.
Select Sum(p.Importe) as 'Total de pagos' from Pagos as P

-- 9  Listado con la cantidad de cursos de nivel principiante.
Select count(c.ID) as 'Cantidad de cursos Nivel Principiante' 
from Cursos as C
inner Join Niveles as N
on C.IDNivel=N.ID 
Where N.Nombre like 'Principiante'

-- 10  Listado con la suma total de todos los pagos realizados en 2019.
Select Sum(p.Importe) as 'Importe Total de pagos 2019' 
From Pagos as p
Where year(p.Fecha)=2019

-- (11)  Listado con la cantidad de usuarios que son instructores.
Select count(distinct i.IDUsuario )as 'Cantidad de instructores'
From Instructores_x_Curso as I


-- 12  Listado con la cantidad de usuarios distintos que se hayan certificado.
Select count(Distinct i.IDUsuario)as Cantidad_De_Usuarios_Certificados
From Inscripciones as I
inner Join Certificaciones as C on I.ID=c.IDInscripcion

--para ver la tabla como me quedo sin el distinct
Select * From Certificaciones as c
inner Join Inscripciones as i on I.ID=c.IDInscripcion
order by I.IDUsuario

-- (13)  Listado con el nombre del país y la cantidad de usuarios de cada país.

Select p.Nombre as Nombre, count(Dat.ID) as Cantidad_Usuarios
From Paises as P
Left Join Datos_Personales as Dat on P.ID=Dat.IDPais
Group by(p.Nombre)
Order by P.Nombre asc

--order by 2 desc es lo mismo de arriba 



-- (14)  Listado con el apellido y nombres del usuario y el importe más costoso abonado como pago. 
--Sólo listar aquellos que hayan abonado más de $7500.

Select Dat.Apellidos +','+ Dat.Nombres as Apenom , max(P.importe)as MaxImporte
From Datos_Personales as Dat
inner Join Usuarios as u on Dat.ID=u.ID
inner join Inscripciones as I on U.ID=i.IDUsuario
inner join Pagos as P on I.ID=P.IDInscripcion
Group by Dat.Apellidos,Dat.Nombres
Having Max(p.Importe) >7500
order by 1 asc

-- 15  Listado con el apellido y nombres de usuario y el importe más costoso de curso al cual se haya inscripto.

Select Dat.Apellidos, Dat.Nombres , Max(C.CostoCurso)as Maxcosto_Curso
From Datos_Personales as Dat
Inner Join Usuarios as U on Dat.ID=U.ID
Inner Join Inscripciones as i on U.ID =I.IDUsuario
Inner Join Cursos as C on I.IDCurso = C.ID
Group By Dat.Apellidos,Dat.Nombres




-- 16  Listado con el nombre del curso, nombre del nivel, cantidad total de clases y duración total del curso en minutos.

select Cursos.Nombre as Curso,Niveles.Nombre as Nivel, count(Clases.ID)as CantidadDeClases, Sum(Clases.Duracion) as duracionDelCurso
From  Cursos 
left Join Niveles on Cursos.IDNivel=Niveles.ID
left Join Clases on Cursos.ID = Clases.IDCurso
Group by Cursos.Nombre,Niveles.Nombre


-- 17  Listado con el nombre del curso y cantidad de contenidos registrados.
--     Sólo listar aquellos cursos que tengan más de 10 contenidos registrados.
Select Cursos.Nombre as Curso, count(Contenidos.ID) as Cant_Contenido
From Cursos
Inner Join Clases on Cursos.ID=Clases.IDCurso
Inner Join Contenidos on Clases.ID=Contenidos.IDClase
Group by Cursos.Nombre
Having count(Contenidos.ID)>10


-- 18  Listado con nombre del curso, nombre del idioma y cantidad de tipos de idiomas.
Select c.Nombre as Curso ,i.Nombre as Idioma,COUNT(ixc.IDTipo) as Cant_Tipo_Idiomas 
From Cursos as C 
inner join Idiomas_x_Curso as IxC on C.ID=IxC.IDCurso
Inner join Idiomas as I on IxC.IDIdioma=I.ID
Inner Join TiposIdioma as T on IxC.IDTipo=T.ID
Group By  C.Nombre,I.Nombre


-- 19  Listado con el nombre del curso y cantidad de idiomas distintos disponibles.
Select C.Nombre as Curso, count(distinct ixc.IDIdioma) as CantIdiomas
From Cursos as C
Inner Join Idiomas_x_Curso as ixc on C.ID=ixc.IDCurso
inner join Idiomas as i on Ixc.IDIdioma=i.ID
Group by c.Nombre

-- 20  Listado de categorías de curso y cantidad de cursos asociadas a cada categoría.
--Sólo mostrar las categorías con más de 5 cursos.

Select Cat.Nombre as Categoria,count(cxc.IDCategoria)
from Categorias as Cat
inner join Categorias_x_Curso as cxc on Cat.ID=cxc.IDCategoria
inner join Cursos As c on cxc.IDCurso=c.ID
Group by cat.Nombre
having count(cxc.IDCategoria)>5

-- 21  Listado con tipos de contenido y la cantidad de contenidos asociados a cada tipo. 
--     Mostrar aquellos tipos que no hayan registrado contenidos con cantidad 0.
Select t.Nombre as Nombre, Count(c.ID) as cantContenido
From TiposContenido as t
inner join Contenidos as c on T.ID=c.IDTipo 
Group By T.Nombre


-- 22  Listado con Nombre del curso, nivel, año de estreno y el total recaudado en concepto de inscripciones. 
--Listar aquellos cursos sin inscripciones con total igual a $0.
Select C.Nombre as Curso,N.Nombre as Nivel,year(C.Estreno) as AñoEstreno, sum(i.Costo) as TotalRecaudado
From Cursos as c
left join Niveles as N on C.IDNivel=n.ID
left join Inscripciones as i on c.ID=i.IDCurso
group by C.Nombre,n.Nombre,c.Estreno



-- LA OPCION QUE CREEMOS CORRECTA
Select C.Nombre as Curso,N.Nombre as Nivel,year(C.Estreno) as AñoEstreno,sum(case when p.importe is null then 0 else p.Importe end) as TotalRecaudado
From Cursos as c
left join Niveles as N on C.IDNivel=n.ID
left join Inscripciones as i on c.ID=i.IDCurso
Left join Pagos as p on i.ID=p.IDInscripcion
group by C.Nombre,n.Nombre,c.Estreno




-- 23  Listado con Nombre del curso, costo de cursado y certificación y cantidad de usuarios distintos 
--inscriptos cuyo costo de cursado sea menor a $10000 y cuya cantidad de usuarios inscriptos sea menor a 5. 
--Listar aquellos cursos sin inscripciones con cantidad 0.

Select c.Nombre as Curso,c.CostoCurso as CostoCursado, c.CostoCertificacion as CostoCertificacion,
case when c.CostoCurso < 10000 then count (distinct I.idusuario) end as CantUsuarios
From Cursos as c
left join Inscripciones as i on C.ID=i.IDCurso
Group by c.Nombre, c.CostoCurso,c.CostoCertificacion
having c.CostoCurso < 10000 and count( distinct I.idusuario)<5



-- 24  Listado con Nombre del curso, fecha de estreno y nombre del nivel del curso que más recaudó en concepto de certificaciones.

Select top (1) c.Nombre as Curso,c.Estreno as FechaEstreno ,n.Nombre as Nivel 
from Cursos as C
inner join Niveles as n on c.IDNivel=n.ID
inner join Inscripciones as i on C.ID=i.IDCurso
inner join Certificaciones as Cer on i.ID=cer.IDInscripcion
Group by C.Nombre,c.Estreno,n.Nombre
order by Sum(Cer.Costo) asc



-- 25  Listado con Nombre del idioma del idioma más utilizado como subtítulo.
Select top(1) i.Nombre
From Idiomas as i
inner join Idiomas_x_Curso as ic on i.ID=ic.IDIdioma
inner join TiposIdioma as tc on ic.IDTipo=tc.ID
where tc.Nombre like 'subtitulo'
group by i.Nombre
order by count(i.ID) desc




-- 26  Listado con Nombre del curso y promedio de puntaje de reseñas apropiadas.
Select c.Nombre as curso, avg(r.Puntaje) as Puntaje
From Cursos as c
inner join Inscripciones as i on C.ID=i.IDCurso
inner join Reseñas as r on i.ID=r.IDInscripcion
where r.Inapropiada=0
group by C.Nombre



-- 27  Listado con Nombre de usuario y la cantidad de reseñas inapropiadas que registró.

select Usuarios.NombreUsuario as Usuario,
case when Reseñas.Inapropiada = 1 then COUNT(Reseñas.Inapropiada) end as Cant
From Usuarios
left join Inscripciones on Usuarios.ID=Inscripciones.IDUsuario
left join Reseñas on Inscripciones.ID=Reseñas.IDInscripcion
Group by Usuarios.NombreUsuario,Reseñas.Inapropiada
Having COUNT(Reseñas.Inapropiada)>0




select Usuarios.NombreUsuario as Usuario,COUNT(Reseñas.Puntaje) as CantResInapropiadas
From Usuarios
left join Inscripciones on Usuarios.ID=Inscripciones.IDUsuario
left join Reseñas on Inscripciones.ID=Reseñas.IDInscripcion
where Reseñas.Inapropiada=1
Group by Usuarios.NombreUsuario,Reseñas.Inapropiada


/*
	select u.NombreUsuario, sum(case when r.Inapropiada =1 then 1 else 0 end) as 'Cantidad de reseñas inapropiadas'
	from Usuarios as u left join Inscripciones as i on u.ID=i.IDUsuario
	left join Reseñas as r on r.IDInscripcion=i.ID
	group by u.NombreUsuario
	order by u.NombreUsuario asc
	*/

	select u.NombreUsuario, sum(cast(r.inapropiada as int)) as 'Cantidad de reseñas inapropiadas'
	from Usuarios as u left join Inscripciones as i on u.ID=i.IDUsuario
	left join Reseñas as r on r.IDInscripcion=i.ID
	group by u.NombreUsuario
	order by u.NombreUsuario asc


-- 28  Listado con Nombre del curso, nombre y apellidos de usuarios y la cantidad de veces que dicho usuario realizó dicho curso. 
--No mostrar cursos y usuarios que contabilicen cero.
Select c.Nombre as Curso,dat.Nombres,dat.Apellidos,count(i.IDCurso) as cantRealizada
from Cursos as c
inner join Inscripciones as i on C.ID=i.IDCurso
inner join Usuarios as u on i.IDUsuario=u.ID
inner join Datos_Personales as dat on u.ID=dat.ID
group by c.Nombre,dat.Nombres,dat.Apellidos
order by count(i.IDCurso) desc



-- 29  Listado con Apellidos y nombres, mail y duración total en concepto de clases de cursos a los que se haya inscripto. 
--Sólo listar información de aquellos registros cuya duración total supere los 400 minutos.
Select dat.Apellidos as Apellidos,dat.Nombres as Nombres ,dat.Email as Email,sum(Cla.Duracion) as Duracion
From Datos_Personales as dat
Inner Join Usuarios as U on Dat.ID=U.ID
Inner Join Inscripciones as i on U.ID =I.IDUsuario
Inner Join Cursos as C on I.IDCurso = C.ID
inner join Clases as Cla on C.ID=Cla.IDCurso
group by dat.Apellidos,dat.Nombres,dat.Email

having sum(Cla.Duracion)>1200
Order by Duracion desc


-- 30  Listado con nombre del curso y recaudación total. 
--La recaudación total consiste en la sumatoria de costos de inscripción y de certificación. 
--Listarlos ordenados de mayor a menor por recaudación.
SElect  C.Nombre as Curso, Sum(i.Costo + cer.Costo) as RecaudacionTotal
from Cursos as c
 inner join Inscripciones as i on c.ID=i.IDCurso
 inner join Certificaciones as cer on i.ID=cer.IDInscripcion
group by C.Nombre
order by Sum(i.Costo + cer.Costo) desc

