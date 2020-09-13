Use MonkeyUniv
-- (1) Listado con nombre de usuario de todos los usuarios y sus respectivos nombres y apellidos.
Select U.NombreUsuario,Datos_personales.Apellidos,Datos_personales.Nombres
From Usuarios as U
Inner Join Datos_Personales on U.Id=Datos_personales.id


Select *From Usuarios
Select *From Datos_personales


Select  Usuarios.NombreUsuario,
        Datos_Personales.Apellidos,
        Datos_Personales.Nombres
From Usuarios
Inner Join Datos_Personales ON Usuarios.ID = Datos_Personales.ID

Select U.NombreUsuario, DAT.Apellidos, DAT.Nombres, DAT.Email
From Usuarios as U
Inner Join Datos_Personales as DAT ON U.ID = DAT.ID

-- Lo que realiza la cláusula join en memoria
Select *
From Usuarios as U
Inner Join Datos_Personales as DAT ON U.ID = DAT.ID


-- 2 Listado con apellidos, nombres, fecha de nacimiento y nombre del país de nacimiento. 
Select Dat.Apellidos,Dat.Nombres,Dat.Nacimiento,pa.Nombre
From Datos_personales as dat Inner Join Paises As Pa on Dat.IdPais =Pa.ID



-- (3) Listado con nombre de usuario, apellidos, nombres, email o celular de todos los usuarios que vivan en una domicilio cuyo nombre contenga el término 'Presidente' o 'General'. NOTA: Si no tiene email, obtener el celular.
Select U.NombreUsuario,D.Apellidos,D.Nombres, isnull (D.Email,D.Celular)as Contacto, D.Domicilio
From Usuarios as U 
Inner Join Datos_personales as D on u.id = d.id
where d.Domicilio like '%Presidente%'or D.domicilio like '%General%'


-- 4 Listado con nombre de usuario, apellidos, nombres, email o celular o domicilio como 'Información de contacto'.  NOTA: Si no tiene email, obtener el celular y si no posee celular obtener el domicilio.
Select u.NombreUsuario,d.Apellidos,d.Nombres,isnull(isnull(d.Email,d.Celular),d.Domicilio)as infocontacto
from Usuarios as u 
Inner Join Datos_Personales as D on U.id=d.ID


-- (5) Listado con dat apellido y nombres, nombre del curso y costo de la inscripción de todos los usuarios inscriptos a cursos.  NOTA: No deben figurar los usuarios que no se inscribieron a ningún curso.
Select d.Apellidos +','+ d.Nombres as 'Apellido y Nombre',C.Nombre,i.Costo
From Datos_Personales as d
inner join Inscripciones as i on d.ID=i.IDUsuario
inner join Cursos as C on I.IDCurso=c.ID
order By d.Apellidos asc

-- 6 Listado con nombre de curso, nombre de usuario y mail de todos los inscriptos a cursos que se hayan estrenado en el año 2020.
Select C.Nombre,U.NombreUsuario,D.Email
From Datos_Personales as d
Inner Join Inscripciones as i on D.ID =i.IDUsuario  
inner Join Cursos as C on I.IDCurso = C.ID
inner Join Usuarios as U on U.ID=i.IDUsuario
where year(c.Estreno)=2020

-- 7 Listado con nombre de curso, nombre de usuario, apellidos y nombres, fecha de inscripción, costo de inscripción, fecha de pago e importe de pago. Sólo listar información de aquellos que hayan pagado.
select c.Nombre as Curso, U.NombreUsuario,D.Apellidos + ',' + d.Nombres as 'Apenom',i.Fecha,i.Costo,p.Fecha as 'Fecha Pago',p.Importe
From Usuarios as U
Inner Join Datos_Personales as D on U.ID=D.ID
Inner Join Inscripciones as I on I.IDUsuario = d.ID
inner Join Cursos as c on c.ID=i.IDCurso
inner join Pagos as p on p.IDInscripcion=i.ID



-- 8 Listado con nombre y apellidos, genero, fecha de nacimiento, mail, nombre del curso y fecha de certificación de todos aquellos usuarios que se hayan certificado.
Select d.Nombres + ',' + d.apellidos as ApeNom, d.Genero,d.Nacimiento,d.Email,C.Nombre as NombreCurso,Cer.Fecha
From Datos_Personales as D
inner join Usuarios as u on u.ID=d.ID
inner Join Inscripciones as i on I.IDUsuario=u.ID
Inner Join Cursos as c on c.ID=i.IDCurso
inner join Certificaciones as Cer on Cer.IDInscripcion=i.ID
order by ApeNom Asc

-- 9 Listado de cursos con nombre, costo de cursado y certificación, costo total (cursado + certificación) con 10% de todos los cursos de nivel Principiante.
Select c.Nombre,c.CostoCurso,c.CostoCertificacion,(c.CostoCurso+c.CostoCertificacion)*0.9 as 'Costo Total' 
From Cursos as C 
inner join Niveles as N on N.ID=c.IDNivel
where n.Nombre like 'Principiante' 







-- 10 Listado con nombre y apellido y mail de todos los instructores. Sin repetir.
Select distinct d.Apellidos+','+d.Nombres as Apenom, d.Email
From Datos_Personales as D
inner Join Instructores_x_Curso as i on d.ID=i.IDUsuario 


-- 11 Listado con nombre y apellido de todos los usuarios que hayan cursado algún curso cuya categoría sea 'Historia'.
Select distinct d.Apellidos +','+ d.Nombres as 'Apellido y Nombre',Cat.Nombre
From Datos_Personales as d 
inner Join  Usuarios as U on D.ID=U.ID
inner Join Inscripciones as i on U.ID=i.IDUsuario
inner Join Cursos as c on I.IDCurso=c.ID
Inner Join Categorias_x_Curso as Cxc on c.ID=Cxc.IDCurso
inner Join Categorias as Cat on cxc.IDCategoria=cat.ID
where cat.Nombre like '%Historia%'
order by 'Apellido y Nombre' asc


-- (12) Listado con nombre de idioma, código de curso y código de tipo de idioma. Listar todos los idiomas indistintamente si no tiene cursos relacionados.

Select I.Nombre,ixc.IDCurso,ixc.IDTipo
From Idiomas_x_Curso as ixc
right join Idiomas as i on ixc.IDIdioma=i.ID 


-- 13 Listado con nombre de idioma de todos los idiomas que no tienen cursos relacionados.
Select I.Nombre
from Idiomas as i
left Join Idiomas_x_Curso as ixc on ixc.IDIdioma=i.ID
where ixc.IDCurso is Null

-- 14 Listado con nombres de idioma que figuren como audio de algún curso. Sin repeticiones.

Select distinct i.Nombre,t.Nombre
from Idiomas as i
inner Join Idiomas_x_Curso as ixc on i.ID=ixc.IDIdioma
Inner Join TiposIdioma as t on t.ID=ixc.IDTipo
where t.Nombre like '%Audio%'

-- (15) Listado con nombres y apellidos de todos los usuarios y el nombre del país en el que nacieron. 
--      Listar todos los países indistintamente si no tiene usuarios relacionados.
Select d.Apellidos+','+d.Nombres as Apenom, p.Nombre
from Paises as P 
left Join Datos_Personales as d on P.ID=d.IDPais


-- 16 Listado con nombre de curso, fecha de estreno y nombres de usuario de todos los inscriptos.
    -- Listar todos los nombres de usuario indistintamente si no se inscribieron a ningún curso.
--mal
Select c.Nombre,c.Estreno,u.NombreUsuario
From Cursos as c
left Join Inscripciones as i on C.ID=i.IDCurso
left Join Usuarios as u on i.IDUsuario=u.ID

--bien
Select c.Nombre,c.Estreno,u.NombreUsuario
From Usuarios as u 
left join Inscripciones as i on U.ID=i.IDUsuario
left join Cursos as c on i.IDCurso=c.ID

-- 17 Listado con nombre de usuario, apellido, nombres, género, fecha de nacimiento y mail 
--de todos los usuarios que no cursaron ningún curso.
Select u.NombreUsuario, d.Apellidos,d.nombres,d.Nacimiento,d.email 
from Datos_Personales as d 
Left join Usuarios as u on d.ID=u.ID 
Left join Inscripciones as i on u.ID=i.IDUsuario
where I.IDUsuario is null
order by d.Nombres asc
   



-- 18 Listado con nombre y apellido, nombre del curso, puntaje otorgado y texto de la reseña.
--Sólo de aquellos usuarios que hayan realizado una reseña inapropiada.

select D.Apellidos,d.Nombres,c.Nombre,r.Puntaje,r.Observaciones
From Reseñas as r 
inner Join Inscripciones as i on r.IDInscripcion=i.ID
inner join Usuarios as u on i.IDUsuario=u.ID
inner join Cursos as c on i.IDCurso=c.ID
inner join Datos_Personales as d on u.ID=d.ID
where R.inapropiada = 1





-- 19 Listado con nombre del curso, costo de cursado, costo de certificación,
--nombre del idioma y nombre del tipo de idioma de todos los cursos cuya fecha de estreno haya sido antes del año actual.
--Ordenado por nombre del curso y luego por nombre de tipo de idioma. Ambos ascendentemente.
Select c.Nombre,c.CostoCurso,c.CostoCertificacion,i.Nombre,t.Nombre
from Cursos as c 
inner Join Idiomas_x_Curso as ixc on c.ID=ixc.IDCurso
inner join Idiomas as i on ixc.IDIdioma=i.ID
inner join TiposIdioma as t on ixc.IDTipo=t.ID
where year(c.Estreno) < YEAR(getdate())
order by c.Nombre asc,t.Nombre asc


-- 20 Listado con nombre del curso y todos los importes de los pagos relacionados.
Select c.Nombre, p.Importe
From Cursos as c
inner join Inscripciones as i on c.ID=i.IDCurso
inner join Pagos as p on i.ID=p.IDInscripcion 
order by c.Nombre asc, p.Importe asc



-- 21 Listado con nombre de curso, 
--costo de cursado y una leyenda que indique "Costoso" si el costo de cursado es mayor a $ 15000, 
--"Accesible" si el costo de cursado está entre $2500 y $15000, "Barato" si el costo está entre $1 y $2499 y
--"Gratis" si el costo es $0.
select Nombre, CostoCurso,
case when CostoCurso>15000 then 'Costoso'
when CostoCurso between 2500 and 15000 then 'Accesible'
when CostoCurso between 1 and 2499 then 'Barato'
else 'Gratis'
end as 'Leyenda' from Cursos;




