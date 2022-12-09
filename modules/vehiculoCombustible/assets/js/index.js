"use strict";
var columnas = [
    {
        field: "marca",
        title: "marca"
    },
    {
        field: "version",
        title: "version"
    },
    {
        field: "modelo",
        title: "modelo"
    },   {
        field: "matricula",
        title: "matricula"
    }, {
        field: "nombre",
        title: "combustible"
    },{
        field: "kilometraje",
        title: "kilometraje",
        width: 100
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var tableVehiculoCombustible = iniciarTabla("#tabla-vehiculo-combustible", "/vehiculoCombustible/default/lista", "#tabla-vehiculo-combustible-buscar", columnas);
