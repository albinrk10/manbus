function funcionEditarDiagnostico(id) {
    $.post(APP_URL + '/diagnostico/default/get-modal-edit/' + id, {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Editar diagnostico</strong></h2>",
            message: resp.plantilla,
            size: 'large',
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
                $("#form-diagnostico").validate({
                    rules: {
                        vehiculo: "required",
                        descripcion: "required"
                    },
                    messages: {
                        vehiculo: "Por favor ingrese datos",
                        descripcion: "Por favor ingrese datos"
                    },
                    submitHandler: function () {
                        var vehiculo = $("#vehiculo").val();
                        var descripcion = $("#descripcion").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/diagnostico/default/update',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                id_diagnostico: id,
                                vehiculo: vehiculo,
                                descripcion: descripcion
                            },
                            success: function (response) {
                                if (response) {
                                    bootbox.hideAll();
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                datatableDiagnostico.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
}
