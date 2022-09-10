function funcionEditar(id) {
    $.post(APP_URL + '/producto/default/get-modal-edit/' + id, {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Editar Producto</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        $(document).ready(function () {
            $("#btn-guardar").click(function () {
                $("#form-producto").validate({
                    rules: {
                        codigo: "required",
                        nombre: "required",
                        descripcion: "required",
                        precio: "required",
                        stock: "required"
                    },
                    messages: {
                        codigo: "Por favor ingrese dato",
                        nombre: "Por favor ingrese dato",
                        descripcion: "Por favor ingrese dato",
                        precio: "Por favor ingrese dato",
                        stock: "Por favor ingrese dato"
                    },
                    submitHandler: function () {
                        var codigo = $("#codigo").val();
                        var nombre = $("#nombre").val();
                        var descripcion = $("#descripcion").val();
                        var precio = $("#precio").val();
                        var stock = $("#stock").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/producto/default/update',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                id_producto: id,
                                codigo: codigo,
                                nombre: nombre,
                                descripcion: descripcion,
                                precio: precio,
                                stock: stock
                            },
                            success: function (response) {
                                bootbox.hideAll();
                                if (response) {
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                tableProducto.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
}
