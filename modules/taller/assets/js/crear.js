$("#modal-taller").on("click", function () {
    $.post(APP_URL + '/taller/default/get-modal', {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Registro Taller</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        $(document).ready(function () {
            $("#btn-guardar").click(function () {
                $("#form-taller").validate({
                    rules: {
                        codigo: "required",
                        nombre: "required",
                        direccion: "required"
                    },
                    messages: {
                        codigo: "Por favor ingrese dato",
                        nombre: "Por favor ingrese dato",
                        direccion: "Por favor ingrese dato"
                    },
                    submitHandler: function () {
                        var codigo = $("#codigo").val();
                        var nombre = $("#nombre").val();
                        var direccion = $("#direccion").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/taller/default/create',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                codigo: codigo,
                                nombre: nombre,
                                direccion: direccion
                            },
                            success: function (response) {
                                bootbox.hideAll();
                                if (response) {
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                tableTaller.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
});
