$("#modal-almacen").on("click", function () {
    $.post(APP_URL + '/almacen/default/get-modal', {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Nuevo Registro</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        $("#producto").select2({
            placeholder: "Seleccione producto"
        })

        $(document).ready(function () {
            $("#btn-guardar").click(function () {
                $("#form-almacen").validate({
                    rules: {
                        producto: "required",
                        cantidad: "required",
                        fecha: "required"
                    },
                    messages: {
                        producto: "Por favor seleccione",
                        cantidad: "Por favor ingrese dato",
                        fecha: "Por favor ingrese dato"
                    },
                    submitHandler: function () {
                        var producto = $("#producto").val();
                        var cantidad = $("#cantidad").val();
                        var fecha = $("#fecha").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/almacen/default/create',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                producto: producto,
                                cantidad: cantidad,
                                fecha: fecha
                            },
                            success: function (response) {
                                bootbox.hideAll();
                                if (response) {
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                tableAlmacen.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
});
