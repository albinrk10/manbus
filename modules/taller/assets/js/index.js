"use strict";
var columnas = [
    {
        field: "codigo_taller",
        title: "Codigo Taller",
        width: 100
    },
    {
        field: "concesionario",
        title: "Concesionario"
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
        width: 270
    }
];

var tableTaller = iniciarTabla("#tabla-taller", "/taller/default/lista", "#tabla-taller-buscar", columnas);
