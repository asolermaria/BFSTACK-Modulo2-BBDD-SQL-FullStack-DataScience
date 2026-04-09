-- Lista de profesores por en los campus:
with
    profes AS (
        select p.nombre, p.apellido1, p.apellido2, c.ciudad
        from profesor p
            inner join campus c on c.id = p.campus_id
    )
select
    p.nombre,
    p.apellido1,
    case
        when apellido2 is null then 'NO TIENE'
        else apellido2
    end as apellido,
    p.ciudad
from profes p

-- 2. Estudiantes en una promoción separados por modalidad
SELECT m.nombre, COUNT(*)
FROM
    promocion_modalidad_estudiante pme
    JOIN modalidad m ON m.id = pme.modalidad_id
WHERE
    pme.promocion_id = 1
GROUP BY
    m.nombre
ORDER BY 2 DESC;

-- 3. Listado de estudiantes de una promoción con su modalidad
SELECT e.nombre, e.apellido1, m.nombre
FROM
    promocion_modalidad_estudiante pme
    JOIN estudiante e ON e.id = pme.estudiante_id
    JOIN modalidad m ON m.id = pme.modalidad_id
WHERE
    pme.promocion_id = 1
ORDER BY e.apellido1;

-- 4. Evaluaciones de un estudiante con proyecto y profesor
SELECT ev.fecha, p.nombre, ev.calificacion, pr.nombre || ' ' || pr.apellido1
FROM
    evaluacion ev
    JOIN proyecto p ON p.id = ev.proyecto_id
    JOIN profesor pr ON pr.id = ev.profesor_id
WHERE
    ev.estudiante_id = 1
ORDER BY ev.fecha;

-- 5. Profesores que enseñan un programa
SELECT
    pr.nombre,
    pr.apellido1,
    CASE
        WHEN r.nombre = 'LI' THEN 'Leader Instructor'
        ELSE 'Teacher Asistant'
    END AS rol
FROM
    profesor_programa pp
    JOIN profesor pr ON pr.id = pp.profesor_id
    JOIN rol r ON r.id = pr.rol_id
WHERE
    pp.programa_id = 1;