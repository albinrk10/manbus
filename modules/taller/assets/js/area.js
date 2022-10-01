function eliminarArea(id) {
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: APP_URL + '/taller/default/eliminar-area',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: {
            id_area: id
        },
        success: function (response) {
            if (response) {
                notificacion('Accion realizada con exito', 'success');
                listaArea(response);
            } else {
                notificacion('Error al guardar datos', 'error');
            }
        }
    });
}

function funcionArea(id) {
    $.post(APP_URL + '/taller/default/get-modal-area/' + id, {}, function (resp) {
        bootbox.dialog({
            title: "<h2><strong>Areas</strong></h2>",
            message: resp.plantilla,
            buttons: {}
        });

        $("#btn-cancelar").click(function () {
            bootbox.hideAll();
        });

        listaArea(id);

        $(document).ready(function () {
            $("#btn-guardar-area").click(function () {
                $("#form-area").validate({
                    rules: {
                        nombre_taller: "required"
                    },
                    messages: {
                        nombre_taller: "Por favor ingrese dato"
                    },
                    submitHandler: function () {
                        var nombre_taller = $("#nombre_taller").val();

                        $.ajax({
                            type: "POST",
                            dataType: 'json',
                            url: APP_URL + '/taller/default/create-area',
                            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                            data: {
                                id_taller: id,
                                nombre: nombre_taller
                            },
                            success: function (response) {
                                if (response) {
                                    notificacion('Accion realizada con exito', 'success');
                                } else {
                                    notificacion('Error al guardar datos', 'error');
                                }
                                listaArea(id);
                            }
                        });
                    }
                });
            });
        });
    }, 'json');
}


function listaArea(id) {
    $.ajax({
        type: "GET",
        dataType: 'json',
        url: APP_URL + '/taller/default/lista-area/' + id,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (response) {
            $("#area_table tr").remove();
            $("#area_table").append(response);
        }
    });
}


