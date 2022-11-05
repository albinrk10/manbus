"use strict";
var columnas = [
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
        title: "Matricula"
    },
    {
        field: "denominacion_comercial",
        title: "D. Comercial"
    }, {
        field: "descripcion",
        title: "Descripcion"
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var datatableDiagnostico = iniciarTabla("#tabla-diagnostico", "/diagnostico/default/lista", "#tabla-diagnostico-buscar", columnas);
