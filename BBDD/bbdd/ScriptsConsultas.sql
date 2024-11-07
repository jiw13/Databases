#CONSULTAS PRACTICA BBDD HITO 2
/*
a) Obtener las oficinas que se encuentran ubicadas en las calles cuyo nombre comienzan
por “Paseo de ” dentro del municipio de “Alcobendas” de la provincia
de “Madrid”.
*/
SELECT codO AS Oficina FROM oficina INNER JOIN municipio ON oficina.nomMun = municipio.nombre_M   ##Duda no entiendo como se asignan las oficinas a las calles
WHERE oficina.nomMun IN (SELECT calle.nombre_municipio FROM calle 
                         WHERE oficina.nomMun = 'Alcobendas' AND  calle.nombre LIKE ('Paseo de %'));
                         

/*
b) Obtener el nombre y apellidos del cartero que ha realizado el reparto del paquete
con menor peso, as´ı como la matricula del coche con el que hizo dicho reparto, y
el peso de dicho paquete.

*/

SELECT nombre, apellidos, matricula, peso AS pesoPaquete FROM cartero INNER JOIN reparto
                                                         ON cartero.dni = reparto.dni_cartero
                                                         INNER JOIN paquete 
                                                         ON paquete.dni_cartero = reparto.dni_cartero
GROUP BY nombre,apellidos,matricula,peso
HAVING COUNT(*) < ALL (SELECT peso FROM cartero INNER JOIN reparto
                                                         ON cartero.dni = reparto.dni_cartero
                                                         INNER JOIN paquete 
                                                         ON paquete.dni_cartero = reparto.dni_cartero);
                                                         
 /*
 c) Obtener el nombre, apellidos y direcci´on completa de los usuarios que han enviado
cartas normales y certificadas (devolver el tipo de carta tambi´en) dentro del ´area
de envi´o “AR-MAD-O3”.
 
 */
 
 /*
 SELECT usuario_identificado.nombre AS nombreUI,usuario_identificado.apellidos AS apellidosUI,usuario.generico.nombre AS nombreUG,usuario.generico.apellidos AS apellidosUG,numero,piso,letra,portal,nombre_calle, carta.id, carta_certificada.id 
                                                                       FROM usuario_identificado ui INNER JOIN entrega_certificada_cc_usuario entrega_cc
                                                                                                    ON ui.dni = entrega_cc.dni_usuario
                                                                                                    INNER JOIN 
                                                                                                    #NI PUTA IDEA DE COMO COJONES SE HACE
                                                                                                    
*/               
/*
d) Obtener el numero total de repartos realizados por cada cartero en las diferentes
oficinas ordenado de mayor a menor.
*/

SELECT COUNT(DISTINCT reparto.id) FROM reparto INNER JOIN cartero ON reparto.dni_cartero = cartero.dni
                             INNER JOIN trabaja ON trabaja.dni_cartero = cartero.dni
                             INNER JOIN oficina ON oficina.codO = trabaja.codO

ORDER BY reparto.id desc;


/*
e) Obtener el peso total de los paquetes y el nivel mayor de urgencia de las cartas
certificadas que ha llevado los coches de la oficina “OF-MAD-O1” en los repartos
que se les han asignado en los ´ultimos 7 d´ıas.
*/

SELECT SUM(paquetes.peso), nivel_urgencia FROM carta_certificada cc INNER JOIN reparto


