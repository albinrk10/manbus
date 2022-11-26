<form id="form-vehiculosn">

    <div class="row">
        <div class="form-group col-md-3">
            <label>Marca<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="marca" id="marca" value="<?= $vehiculos->marca ?>" />
        </div>
        <div class="form-group col-md-3">
            <label>Version<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="version" id="version" value="<?= $vehiculos->version ?>" />
        </div>
        <div class="form-group col-md-2">
            <label>Modelo<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="modelo" id="modelo" value="<?= $vehiculos->modelo ?>" />
        </div>
        <div class="form-group col-md-2">
            <label>Placa<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="matricula" id="matricula" value="<?= $vehiculos->matricula ?>" />
        </div>

        <div class="form-group col-md-2">
            <label>Tara<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="tara" id="tara" value="<?= $vehiculos->tara ?>" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-3">
            <label>Denominacion<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="denominacion_comercial" id="denominacion_comercial" value="<?= $vehiculos->denominacion_comercial ?>" />
        </div>
        <div class="form-group col-md-3">
            <label>Medidas Neumaticos<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="medida_neumatico" id="medida_neumatico" value="<?= $vehiculos->medidas_neumaticos ?>" />
        </div>

        <div class="form-group col-md-2">
            <label>Altura<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="altura" id="altura" value="<?= $vehiculos->altura ?>" />
        </div>
        <div class="form-group col-md-2">
            <label>Anchura<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="anchura" id="anchura" value="<?= $vehiculos->anchura ?>" />
        </div>

        <div class="form-group col-md-2">
            <label>Longitud<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="longitud" id="longitud" value="<?= $vehiculos->longitud ?>" />
        </div>
    </div>

    <div class="row">


        <div class="form-group col-md-2">
            <label>Tipo Motor<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="tipo_motor" id="tipo_motor" value="<?= $vehiculos->tipo_motor ?>" />
        </div>
        <div class="form-group col-md-2">
            <label>N° Cilindros<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="numero_cilindros" id="numero_cilindros" value="<?= $vehiculos->numero_cilindros ?>" />
        </div>

        <div class="form-group col-md-3">
            <label> Potencia en CV<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="potencia_expresada_en_cv" id="potencia_expresada_en_cv" value="<?= $vehiculos->potencia_expresada_en_cv ?>" />
        </div>
        <div class="form-group col-md-3">
            <label>Potencia en KW<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="potencia_expresada_en_kw" id="potencia_expresada_en_kw" value="<?= $vehiculos->potencia_expresada_en_kw ?>" />
        </div>
        <div class="form-group col-md-2">
            <label>N° Bastidor<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="numero_bastidor" id="numero_bastidor" value="<?= $vehiculos->numero_bastidor ?>" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-3">
            <label>N° Plazas<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="numero_plazas" id="numero_plazas" value="<?= $vehiculos->numero_plazas ?>" />
        </div>

        <div class="form-group col-md-3">
            <label>Descripcion<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="descripcion" id="descripcion" value="<?= $vehiculos->descripcion ?>" />
        </div>
        <div class="form-group col-md-3">
            <label>Incripcion<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="incripcion" id="incripcion" value="<?= $vehiculos->incripcion ?>" />
        </div>
        <div class="form-group col-md-3">
            <label>Configuracion Vehicular<span class="text-danger">*</span></label>
            <input type="text" class="form-control" name="config_vehicular" id="config_vehicular" value="<?= $vehiculos->config_vehicular ?>" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-3">
            <label>Estado<span class="text-danger">*</span></label>
            <select class="form-control select2" id="estado" name="estado" style="width: 100%;">
                <option value="Operativo" <?= $vehiculos->estado == 'Operativo' ? 'selected' : '' ?>>
                    Operativo
                </option>
                <option value="Inoperativo" <?= $vehiculos->estado == 'Inoperativo' ? 'selected' : '' ?>>
                    Inoperativo
                </option>
            </select>
        </div>
        <div class="form-group col-md-3">
            <label class="col-form-label">Inspeccion tecnico</label>
            <div class="col-3">
                <span class="switch switch-icon">
                    <label>
                        <input type="checkbox" <?= ($vehiculos->flg_inspeccion_tecnica == 1 ? "checked " : "") ?> name="flg_inspeccion_tecnica" id="flg_inspeccion_tecnica" />
                        <span></span>
                    </label>
                </span>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label class="col-form-label">Soat con vigencia </label>
            <div class="col-3">
                <span class="switch switch-icon">
                    <label>
                        <input type="checkbox" <?= ($vehiculos->flg_soat == 1 ? "checked " : "") ?> name="flg_soat" id="flg_soat" />
                        <span></span>
                    </label>
                </span>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label>Combustible<span class="text-danger">*</span></label>
            <select class="form-control select2" id="combustible" name="combustible" style="width: 100%;">
                <?php foreach ($combustible as $c) : ?>
                    <option value="<?= $c->id_combustible ?>" <?= ($c->id_combustible == $vehiculos->id_combustible) ? "selected" : "" ?>><?= $c->nombre ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Actualizar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>