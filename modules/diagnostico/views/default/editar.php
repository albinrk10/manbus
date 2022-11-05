<form id="form-diagnostico">

    <div class="row">
        <div class="form-group col-md-12">
            <label>Vehiculo<span class="text-danger">*</span></label>
            <select class="form-control select2" id="vehiculo" name="vehiculo" style="width: 100%;">
                <?php foreach ($vehiculos as $v): ?>
                    <option value="<?= $v->id_vehiculo ?>" <?= $diagnostico->id_vehiculo == $v->id_vehiculo ? 'selected' : '' ?>><?= $v->marca . ' ' . $v->version . ' ' . $v->modelo . ' ' . $v->matricula . ' ' . $v->denominacion_comercial ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="form-group col-md-12">
            <label>Descripcion diagnostico<span class="text-danger">*</span></label>
            <textarea type="text" class="form-control" placeholder="" name="descripcion"
                      id="descripcion"><?= $diagnostico->descripcion ?></textarea>
        </div>
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Actualizar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>