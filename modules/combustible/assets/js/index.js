"use strict";
var columnas = [
    {
        field: "codigo_combustible",
        title: "Codigo",
        width: 75
    },
    {
        field: "nombre",
        title: "Nombre"
    },
    {
        field: "descripcion",
        title: "Descripción"
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var tableCombustible = iniciarTabla("#tabla-combustible", "/combustible/default/lista", "#tabla-combustible-buscar", columnas);
