<?php

header('Access-Control-Allow-Origin', "*");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');

$listaSeguros = array();
$aregloSeguros = array();
$aregloCoberturas = array();

	$cn = mysqli_connect("localhost", "root","", "seguros");

	$rs = mysqli_query($cn, "SELECT id_seguro, nombre_seguro, prima_desde from seguros");

	while ($rowSeguros = mysqli_fetch_assoc($rs)){
		$aregloSeguros['id_seguro'] = $rowSeguros['id_seguro']; 
		$aregloSeguros['nombre_seguro'] = $rowSeguros['nombre_seguro'];
		$aregloSeguros['prima_desde'] = $rowSeguros['prima_desde'];
		$aregloSeguros['coberturas'] = array();

		$rs2 = mysqli_query($cn, "SELECT c.id_cobertura, des_cobe, des_cober, rest_cober, case est_cobe when 1 then 'activo' when 2 then 'inactivo' end as estado FROM detalle_cobertura as d INNER JOIN coberturas as c on d.id_cobertura = c.id_cobertura where id_seguro = ".$rowSeguros['id_seguro']."  ");
		while ($rowCoberturas  = mysqli_fetch_assoc($rs2) ) {
			$aregloCoberturas['id_cobertura'] = $rowCoberturas['id_cobertura'];
			$aregloCoberturas['des_cobe'] = $rowCoberturas['des_cobe'];
			$aregloCoberturas['des_cober'] = $rowCoberturas['des_cober'];
			$aregloCoberturas['rest_cober'] = $rowCoberturas['rest_cober'];
			$aregloCoberturas['estado'] = $rowCoberturas['estado'];
			array_push($aregloSeguros['coberturas'],$aregloCoberturas );
		}
		array_push($listaSeguros,$aregloSeguros);

	}
	echo json_encode($listaSeguros, JSON_UNESCAPED_UNICODE);
	mysqli_close($cn)







?>