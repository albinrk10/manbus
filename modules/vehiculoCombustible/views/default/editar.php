<form id="form-vehiculo-combustible">

    <div class="form-group">
        <label>Vehiculo<span class="text-danger">*</span></label>
        <select class="form-control select2" id="vehiculo" name="vehiculo" style="width: 100%;" disabled>
            <option value="" selected>Seleccione una opción</option>
            <?php foreach ($vehiculo as $v): ?>
                <option value="<?= $v->id_vehiculo ?>" <?= $combustible->id_vehiculo == $v->id_vehiculo ? 'selected' : '' ?>><?= $v->marca . ' ' . $v->version . ' ' . $v->modelo . ' ' . $v->matricula . ' ' . $v->denominacion_comercial ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="form-group">
        <label>Combustible</label>
        <input id="combustible" type="hidden" value="<?= $combustible->id_combustible ?>">
        <input type="text" class="form-control" name="nombre_combustible" id="nombre_combustible" readonly>
    </div>

    <div class="form-group">
        <label>Kilometraje<span class="text-danger">*</span></label>
        <input type="number" step=".01" class="form-control" placeholder="Ingrese kilometraje" name="kilometraje"
               id="kilometraje" value="<?= $combustible->kilometraje ?>">
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>
