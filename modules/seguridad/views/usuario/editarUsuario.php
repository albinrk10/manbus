<form id="form-usuario">
    <div class="form-group">
        <label>Persona<span class="text-danger">*</span></label>
        <select class="form-control select2" id="persona" name="persona" style="width: 100%;">
            <?php foreach ($persona as $p): ?>
                <option value="<?= $p->id_empleado ?>" <?= $usuario->id_empleado == $p->id_empleado ? 'selected' : '' ?>>
                    <?= $p->nombres . ' ' . $p->apellido_paterno . ' ' . $p->apellido_materno ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="form-group">
        <label>Perfil<span class="text-danger">*</span></label>
        <select class="form-control select2" id="perfil" name="perfil" style="width: 100%;">
            <?php foreach ($perfil as $p): ?>
                <option value="<?= $p->id_rol ?>" <?= $usuario->id_rol == $p->id_rol ? 'selected' : '' ?>>
                    <?= $p->nombre_rol ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="form-group">
        <label>Correo<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese correo" name="correo" id="correo" value="<?= $usuario->correo ?>"/>
    </div>
    <div class="form-group">
        <label>Usuario<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese usuario" name="usuario" id="usuario" value="<?= $usuario->usuario ?>"/>
    </div>
    <div class="form-group">
        <label>Contraseña</label>
        <input type="text" class="form-control" placeholder="Ingrese contraseña" name="password" id="password"/>
    </div>
    <hr>
    <div class="text-right">
        <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
        <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
    </div>
</form>
