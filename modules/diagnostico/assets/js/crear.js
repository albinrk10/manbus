$("#modal-diagnostico").on("click", function () {
    $.post(APP_URL + '/diagnostico/default/get-modal', {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Registro diagnostico</strong></h2>",
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
            $("#btn-guardarv").click(function () {
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
                            url: APP_URL + '/diagnostico/default/create',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                vehiculo: vehiculo,
                                descripcion: descripcion
                            },
                            success: function (response) {
                                if (response) {
                                    notificacion('Accion realizada con exito', 'success');
                                    bootbox.hideAll();
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
});
