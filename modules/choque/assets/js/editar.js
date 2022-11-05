function funcionEditarChoque(id) {
    $.post(APP_URL + '/choque/default/get-modal-edit/' + id, {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Editar choque</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        $("#estado").select2({
            placeholder: "Seleccione Estado"
        })

        $("#vehiculo").select2({
            placeholder: "Seleccione Vehiculo"
        })

        $(document).ready(function () {
            $("#btn-guardar").click(function () {
                $("#form-choque").validate({
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
                        var estado = $("#estado").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/choque/default/update',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                id_choque: id,
                                vehiculo: vehiculo,
                                descripcion: descripcion,
                                fecha: fecha,
                                estado: estado,
                            },
                            success: function (response) {
                                if (response) {
                                    bootbox.hideAll();
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                datatableChoque.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
}
