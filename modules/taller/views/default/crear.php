<form id="form-taller">
    <div class="form-group row">
        <div class="col-1">
            <span class="switch switch-sm switch-icon">
                <label>
                    <input type="checkbox" name="select" id="flag_concesionario">
                    <span></span>
                </label>
            </span>
        </div>
        <label class="col-8 col-form-label">¿Pertenece a un concesionario?</label>
    </div>

    <div class="form-group" id="view_concesionario">
        <label>Nombre Concesionario</label>
        <input type="text" class="form-control" placeholder="Ingrese nombre concesionario" name="concesionario" id="concesionario"/>
    </div>

    <div class="form-group">
        <label>Codigo Taller<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese codigo" name="codigo" id="codigo"/>
    </div>
    <div class="form-group">
        <label>Nombre<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese nombre" name="nombre" id="nombre"/>
    </div>
    <div class="form-group">
        <label>Dirección<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese direccion" name="direccion" id="direccion"/>
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>
