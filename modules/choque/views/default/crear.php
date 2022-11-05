<form id="form-choque">

    <div class="row">
        <div class="form-group col-md-12">
            <label>Vehiculo<span class="text-danger">*</span></label>
            <select class="form-control select2" id="vehiculo" name="vehiculo" style="width: 100%;">
                <?php foreach ($vehiculos as $v): ?>
                    <option value="<?= $v->id_vehiculo ?>"><?= $v->marca . ' ' . $v->version . ' ' . $v->modelo . ' ' . $v->matricula . ' ' . $v->denominacion_comercial ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="form-group col-md-12">
            <label>Estado<span class="text-danger">*</span></label>
            <select class="form-control select2" id="estado" name="estado" style="width: 100%;">
                <option value="por reparar">Daños / Por reparar</option>
                <option value="reparado">Reparado</option>
            </select>
        </div>
        <div class="form-group col-md-12">
            <label>Fecha<span class="text-danger">*</span></label>
            <input type="date" class="form-control" placeholder="" name="fecha" id="fecha"/>
        </div>
        <div class="form-group col-md-12">
            <label>Detalle<span class="text-danger">*</span></label>
            <textarea type="text" class="form-control" placeholder="" name="descripcion" id="descripcion"></textarea>
        </div>
    </div>

    <div class="text-right">
        <button class="btn btn-primary mr-2" id="btn-guardarv">Guardar</button>
        <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>

    </div>
</form>
