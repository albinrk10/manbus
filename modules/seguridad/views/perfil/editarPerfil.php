<form id="form-perfil">
    <div class="form-group">
        <label>Nombre Rol<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese nombre del rol" name="nombre" id="nombre" value="<?= $perfil->nombre_rol ?>"/>
    </div>
    <div class="form-group">
        <label>Descripción<span class="text-danger">*</span></label>
        <textarea type="text" class="form-control" placeholder="Ingrese descripción" name="descripcion" id="descripcion" ><?= $perfil->descripcion ?></textarea>
    </div>
    <div class="form-group">
        <label style="font-weight: bold;">Módulos</label>
        <div class="form-group row">
            <?php foreach ($modulo as $m): ?>
                <label class="col-3 col-form-label"><?= $m["nombre_modulo"] ?></label>
                <div class="col-3">
                    <span class="switch switch-icon">
                        <label>
                            <input type="checkbox" <?= ($m["activo"] == 1 ? "checked " : "") ?> name="modulo[]" value="<?= $m["id_modulo"] ?>" id="modulo"/>
                            <span></span>
                        </label>
                    </span>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
    <hr>
    <div class="text-right">
        <button class="btn btn-primary mr-2" id="btn-guardar">Actualizar</button>
        <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
    </div>
</form>
