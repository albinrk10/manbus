"use strict";
var columnas = [
    {
        field: "vehiculo",
        title: "Vehiculo"
    },
    {
        field: "denominacion_comercial",
        title: "D. Comercial"
    }, {
        field: "descripcion",
        title: "Descripcion"
    },
    {
        field: "fecha",
        title: "Fecha"
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var datatableChoque = iniciarTabla("#tabla-choque", "/choque/default/lista", "#tabla-choque-buscar", columnas);
