<form id="form-vehiculosn">

    <div class="row">
        <div class="form-group col-md-3">
            <label>Marca<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control" placeholder="" name="marca" id="marca"/>
        </div>
        <div class="form-group col-md-3">
            <label>Version<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="version" id="version"/>
        </div>
        <div class="form-group col-md-2">
            <label>Modelo<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="modelo" id="modelo"/>
        </div>
        <div class="form-group col-md-2">
            <label>Matricula<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="matricula" id="matricula"/>
        </div>

        <div class="form-group col-md-2">
            <label>Tara<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="tara" id="tara"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-3">
            <label>Denominacion<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control" placeholder="" name="denominacion_comercial"
                   id="denominacion_comercial"/>
        </div>
        <div class="form-group col-md-3">
            <label>Medidas Neumaticos<span class="text-danger">*</span></label>
            <input type="text" class="form-control" placeholder="" name="medida_neumatico" id="medida_neumatico"/>
        </div>

        <div class="form-group col-md-2">
            <label>Altura<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control" placeholder=""
                   name="altura" id="altura"/>
        </div>
        <div class="form-group col-md-2">
            <label>Anchura<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control" placeholder=""
                   name="anchura" id="anchura"/>
        </div>

        <div class="form-group col-md-2">
            <label>Longitud<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control" placeholder="" name="longitud"
                   id="longitud"/>
        </div>
    </div>

    <div class="row">


        <div class="form-group col-md-2">
            <label>Tipo Motor<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control" placeholder=""
                   name="tipo_motor" id="tipo_motor"/>
        </div>
        <div class="form-group col-md-2">
            <label>N° Cilindros<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control" placeholder=""
                   name="numero_cilindros" id="numero_cilindros"/>
        </div>

        <div class="form-group col-md-3">
            <label> Potencia en CV<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="potencia_expresada_en_cv" id="potencia_expresada_en_cv"/>
        </div>
        <div class="form-group col-md-3">
            <label>Potencia en KW<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="potencia_expresada_en_kw" id="potencia_expresada_en_kw"/>
        </div>
        <div class="form-group col-md-2">
            <label>N° Bastidor<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="numero_bastidor" id="numero_bastidor"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-3">
            <label>N° Plazas<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="numero_plazas"
                   id="numero_plazas"/>
        </div>

        <div class="form-group col-md-3">
            <label>Descripcion<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="descripcion" id="descripcion"/>
        </div>
        <div class="form-group col-md-3">
            <label>Incripcion<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="incripcion" id="incripcion"/>
        </div>
        <div class="form-group col-md-3">
            <label>Configuracion Vehicular<span class="text-danger">*</span></label>
            <input type="text"
                   class="form-control"
                   name="config_vehicular"
                   id="config_vehicular"/>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-3">
            <label>Estado<span class="text-danger">*</span></label>
            <select class="form-control select2" id="estado" name="estado" style="width: 100%;">
                <option value="Operativo">Operativo</option>
                <option value="Inoperativo">Inoperativo</option>
            </select>
        </div>
        <div class="form-group col-md-3">
            <label class="col-form-label">Inspeccion tecnico</label>
            <div class="col-3">
                    <span class="switch switch-icon">
                        <label>
                            <input type="checkbox" name="flg_inspeccion_tecnica"
                                   id="flg_inspeccion_tecnica"/>
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
                            <input type="checkbox" name="flg_soat"
                                   id="flg_soat"/>
                            <span></span>
                        </label>
                    </span>
            </div>
        </div>
        <div class="form-group col-md-3">
            <label>Combustible<span class="text-danger">*</span></label>
            <select class="form-control select2" id="combustible" name="combustible" style="width: 100%;">
                <?php foreach ($combustible as $c): ?>
                    <option value="<?= $c->id_combustible ?>"><?= $c->nombre ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>

    <div class="text-right">
        <button class="btn btn-primary mr-2" id="btn-guardarv">Guardar</button>
        <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>

    </div>
</form>
