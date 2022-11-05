function funcionEditarMantenimiento(id) {
    $.post(APP_URL + '/mantenimiento/default/get-modal-edit/' + id, {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Editar mantenimiento</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        $("#vehiculo").select2({
            placeholder: "Seleccione Vehiculo"
        })

        $(document).ready(function () {
            $("#btn-guardar").click(function () {
                $("#form-mantenimiento").validate({
                    rules: {
                        vehiculo: "required",
                        fecha: "required",
                        descripcion: "required"
                    },
                    messages: {
                        vehiculo: "Por favor ingrese datos",
                        fecha: "Por favor ingrese datos",
                        descripcion: "Por favor ingrese datos"
                    },
                    submitHandler: function () {
                        var vehiculo = $("#vehiculo").val();
                        var descripcion = $("#descripcion").val();
                        var fecha = $("#fecha").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/mantenimiento/default/update',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                id_mantenimiento: id,
                                vehiculo: vehiculo,
                                descripcion: descripcion,
                                fecha: fecha
                            },
                            success: function (response) {
                                if (response) {
                                    bootbox.hideAll();
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                datatableMantenimiento.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
}
