/* 1. Consulta para traer el nombre del paciente, nombre del doctor y fecha
 programada que estan relacionados en un cita medica*/
 
SELECT pa.nombre_paciente , doc.nombre_doctor, cm.estado FROM public.paciente AS pa
INNER JOIN public.cita_medica AS cm ON pa.cedula_paciente = cm.cedula_paciente
INNER JOIN public.doctor AS doc ON cm.cedula_doctor = doc.cedula_doctor;

/* 2. Consulta usando LEFT JOIN en la tabla cita medica y registro_cita*/
SELECT cm.fecha_programada, cm.hora_programada, cm.estado, rc.detalle
FROM public.cita_medica AS cm LEFT JOIN public.registro_cita AS rc
ON cm.codigo_citamedica = rc.codigo_citamedica;

/* 3. Consulta usando RIGHT JOIN entre las tablas formula medica y medicamento*/
SELECT md.nombre_medicamento, fm.codigo_registro
FROM public.medicamento AS md RIGHT JOIN public.formula_medica AS fm
ON md.codigo_medicamento = fm.codigo_medicamento;

/* 4. Consulta usando FULL JOIN entre las tablas formula medica y medicamento*/
SELECT md.nombre_medicamento, fm.codigo_registro
FROM public.medicamento AS md FULL JOIN public.formula_medica AS fm
ON md.codigo_medicamento = fm.codigo_medicamento;

/* 5. Cuenta el numero de citas que tiene cada paciente*/
SELECT pa.nombre_paciente, count(cm.codigo_citamedica)
FROM public.paciente AS pa INNER JOIN public.cita_medica AS cm
ON pa.cedula_paciente = cm.cedula_paciente GROUP BY pa.nombre_paciente;

/* 5. Cuenta el numero de citas que tiene cada doctor*/
SELECT doc.nombre_doctor, count(cm.codigo_citamedica)
FROM public.doctor AS doc INNER JOIN public.cita_medica AS cm
ON doc.cedula_doctor = cm.cedula_doctor GROUP BY doc.nombre_doctor;

/* 6. Consulta las citas entre '2022-06-01' y '2022-08-31' */
SELECT * FROM public.cita_medica AS cm
WHERE cm.fecha_programada BETWEEN '2022-06-01' AND '2022-08-31';

/* 7. Cuenta el número de medicamentos en cada formula*/
SELECT md.nombre_medicamento, COUNT(fm.codigo_medicamento)
FROM public.medicamento AS md INNER JOIN public.formula_medica AS fm
ON md.codigo_medicamento = fm.codigo_medicamento GROUP BY md.nombre_medicamento;

/* 8. Consulta los doctores que sean especialistas en Dermatologia*/
SELECT doc.cedula_doctor, doc.nombre_doctor, doc.telefono_doctor, doc.correo_doctor
FROM public.doctor AS doc INNER JOIN public.lista_especializaciones AS le
ON doc.cedula_doctor = le.cedula_doctor INNER JOIN especializacion AS esp
ON le.id_especializacion = esp.id_especializacion WHERE esp.nombre = 'Dermatología';

/* 9. Consulta las citas entre '12:00' y '14:00' */
SELECT * FROM public.cita_medica AS cm
WHERE cm.hora_programada BETWEEN '12:00' AND '14:00';

/* 10. Consulta las citas que tienen un resgistro de cita*/
SELECT * FROM public.cita_medica as cm, public.registro_cita as rc
WHERE cm.codigo_citamedica = rc.codigo_citamedica;

/* 11. Consulta de los doctores que tengan más de una especializacion */
SELECT cedula_doctor, nombre_doctor, telefono_doctor, correo_doctor FROM
(SELECT doc.cedula_doctor, doc.nombre_doctor, doc.telefono_doctor, doc.correo_doctor,
COUNT(le.id_especializacion) AS conteo_especializaciones FROM public.doctor AS doc
INNER JOIN public.lista_especializaciones AS le ON doc.cedula_doctor = le.cedula_doctor
INNER JOIN especializacion AS esp ON le.id_especializacion = esp.id_especializacion
GROUP BY doc.cedula_doctor) AS foo WHERE conteo_especializaciones > 1;

/* 12. Consulta del total de cantidades solicitadas de un medicamento*/
SELECT md.nombre_medicamento AS Medicamento, SUM(fm.cantidad_solicitada) AS Suma_cantidades
FROM public.medicamento AS md INNER JOIN public.formula_medica AS fm
ON fm.codigo_medicamento = md.codigo_medicamento GROUP BY md.nombre_medicamento
ORDER BY md.nombre_medicamento;

/* 13. Consulta de las citas realizadas con el detalle */
SELECT pa.nombre_paciente, rc.detalle FROM public.paciente AS pa INNER JOIN public.cita_medica AS cm
ON cm.cedula_paciente = pa.cedula_paciente INNER JOIN
public.registro_cita AS rc ON rc.codigo_citamedica = cm.codigo_citamedica;

/* 14. Consulta de las citas realizadas con el detalle y formula medica */
SELECT pa.nombre_paciente, rc.detalle, md.nombre_medicamento, fm.indicaciones FROM public.paciente AS pa
INNER JOIN public.cita_medica AS cm ON cm.cedula_paciente = pa.cedula_paciente
INNER JOIN public.registro_cita AS rc ON rc.codigo_citamedica = cm.codigo_citamedica
INNER JOIN public.formula_medica AS fm ON fm.codigo_registro = rc.codigo_registro
INNER JOIN public.medicamento AS md ON md.codigo_medicamento = fm.codigo_medicamento;
