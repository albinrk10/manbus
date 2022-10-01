<form id="form-almacen">
    <div class="form-group">
        <label>Producto<span class="text-danger">*</span></label>
        <select class="form-control select2" id="producto" name="producto" style="width: 100%;">
            <option value="" selected disabled>Seleccione</option>
            <?php foreach ($producto as $p): ?>
                <option value="<?= $p->id_producto ?>" <?= $almacen->id_producto == $p->id_producto ? 'selected' : '' ?>><?= $p->codigo_producto . ' | ' . $p->nombre ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="form-group row">
        <div class="col-lg-6">
            <label>Cantidad Ingreso<span class="text-danger">*</span></label>
            <input type="number" class="form-control" placeholder="Ingrese cantidad" name="cantidad" id="cantidad"
                   value="<?= $almacen->cantidad_entrada ?>">
        </div>
        <div class="col-lg-6">
            <label>Fecha<span class="text-danger">*</span></label>
            <input type="date" class="form-control" name="fecha" id="fecha" value="<?= $almacen->fecha_ingreso ?>">
        </div>
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>
