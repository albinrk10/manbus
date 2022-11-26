"use strict";
var columnas = [
/*  "marca" => $row['marca'],
                "version" => $row['version'],
                "modelo" => $row['modelo'],
                "matricula" => $row['matricula'],*/
    {
        field: "marca",
        title: "Marca"
    },
    {
        field: "version",
        title: "Version"
    },
    {
        field: "modelo",
        title: "Modelo"
    },

    {
        field: "matricula",
        title: "Placa"
    },
    {
        field: "estado",
        title: "Estado"
    },
    {
        field: "combustible",
        title: "Combustible"
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var datatable = iniciarTabla("#tabla-vehiculosn", "/vehiculo/default/lista", "#tabla-vehiculosn-buscar", columnas);
