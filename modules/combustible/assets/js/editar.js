function funcionEditarCombustible(id) {
    $.post(APP_URL + '/combustible/default/get-modal-edit/' + id, {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Editar Combustible</strong></h2>",
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
                            url: APP_URL + '/combustible/default/update',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                id_combustible: id,
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
}
