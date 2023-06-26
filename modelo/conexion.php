<?php
$conexion=new mysqli("localhost","root","","sis_asistencia","3306");
$conexion->set_charset("utf8"); 
//solucionar detalle con la hora ya que se me registra una horas más que la que debería ser actualmente
date_default_timezone_set('America/Merida');



?>