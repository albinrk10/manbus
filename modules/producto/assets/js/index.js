"use strict";
var columnas = [
    {
        field: "codigo_producto",
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
        field: "precio",
        title: "Precio"
    },
    {
        field: "stock",
        title: "Stock"
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var tableProducto = iniciarTabla("#tabla-producto", "/producto/default/lista", "#tabla-producto-buscar", columnas);
