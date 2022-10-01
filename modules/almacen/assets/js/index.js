"use strict";
var columnas = [
    {
        field: "producto",
        title: "Producto",
    },
    {
        field: "fecha_ingreso",
        title: "Fecha Ingreso",
        width: 100
    },
    {
        field: "cantidad_entrada",
        title: "Cantidad Entrada",
        width: 100
    },
    {
        field: "cantidad_salida",
        title: "Cantidad Salida",
        width: 100
    },
    {
        field: "cantidad_actual",
        title: "Stock Actual",
        width: 100
    },
    {
        field: "accion",
        title: "Acciones",
        width: 210
    }
];

var tableAlmacen = iniciarTabla("#tabla-almacen", "/almacen/default/lista", "#tabla-almacen-buscar", columnas);
