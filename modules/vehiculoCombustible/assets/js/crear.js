$("#modal-vehiculo-combustible").on("click", function () {
    $.post(APP_URL + '/vehiculoCombustible/default/get-modal', {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Registro Vehiculo Combustible</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        $("#vehiculo").select2({
            placeholder: "Seleccione Vehiculo"
        })

        $("#vehiculo").change(function () {
            $.ajax({
                type: "GET",
                dataType: 'json',
                url: APP_URL + '/vehiculoCombustible/default/get-combustible/' + $(this).val(),
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (response) {
                    $("#combustible").val(response.id_combustible)
                    $("#nombre_combustible").val(response.nombre)
                }
            });
        })

        $(document).ready(function () {
            $("#btn-guardar").click(function () {
                $("#form-vehiculo-combustible").validate({
                    rules: {
                        vehiculo: "required",
                        kilometraje: "required"
                    },
                    messages: {
                        vehiculo: "Por favor ingrese dato",
                        kilometraje: "Por favor ingrese dato"
                    },
                    submitHandler: function () {
                        var vehiculo = $("#vehiculo").val();
                        var combustible = $("#combustible").val();
                        var kilometraje = $("#kilometraje").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/vehiculoCombustible/default/create',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                vehiculo: vehiculo,
                                combustible: combustible,
                                kilometraje: kilometraje,
                            },
                            success: function (response) {
                                bootbox.hideAll();
                                if (response) {
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                tableVehiculoCombustible.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
});
