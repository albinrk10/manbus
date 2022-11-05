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

var datatableMantenimiento = iniciarTabla("#tabla-mantenimiento", "/mantenimiento/default/lista", "#tabla-mantenimiento-buscar", columnas);
