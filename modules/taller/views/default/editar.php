<form id="form-taller">
    <div class="form-group">
        <label>Codigo Taller<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese codigo" name="codigo" id="codigo" value="<?=$taller->codigo_taller?>"/>
    </div>
    <div class="form-group">
        <label>Nombre<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese nombre" name="nombre" id="nombre" value="<?=$taller->nombre?>"/>
    </div>
    <div class="form-group">
        <label>Dirección<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese direccion" name="direccion" id="direccion" value="<?=$taller->direccion?>"/>
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>
