"use strict";
var columnas = [
    {
        field: "codigo_taller",
        title: "Codigo Taller",
    },
    {
        field: "nombre",
        title: "Nombre"
    },
    {
        field: "direccion",
        title: "Dirección"
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var tableTaller = iniciarTabla("#tabla-taller", "/taller/default/lista", "#tabla-taller-buscar", columnas);
