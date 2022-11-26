$("#modal-combustible").on("click", function () {
    $.post(APP_URL + '/combustible/default/get-modal', {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Registro Combustible</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        $(document).ready(function () {
            $("#btn-guardar").click(function () {
                $("#form-combustible").validate({
                    rules: {
                        codigo: "required",
                        nombre: "required",
                        descripcion: "required",
                    },
                    messages: {
                        codigo: "Por favor ingrese dato",
                        nombre: "Por favor ingrese dato",
                        descripcion: "Por favor ingrese dato",
                    },
                    submitHandler: function () {
                        var codigo = $("#codigo").val();
                        var nombre = $("#nombre").val();
                        var descripcion = $("#descripcion").val();
                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/combustible/default/create',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                codigo: codigo,
                                nombre: nombre,
                                descripcion: descripcion,
                            },
                            success: function (response) {
                                bootbox.hideAll();
                                if (response) {
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                tableCombustible.reload()
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
});
