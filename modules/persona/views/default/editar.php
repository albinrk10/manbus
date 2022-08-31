<form id="form-persona">
    <div class="form-group">
        <label>DNI<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese DNI" name="dni" id="dni" value="<?= $persona->dni ?>"/>
    </div>
    <div class="form-group">
        <label>Nombres<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese nombres" name="nombres" id="nombres" value="<?= $persona->nombres ?>"/>
    </div>
    <div class="form-group">
        <label>Apellido Paterno<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese apellido paterno" name="apellido_paterno" id="apellido_paterno" value="<?= $persona->apellido_paterno ?>"/>
    </div>
    <div class="form-group">
        <label>Apellido Materno<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese apellido materno" name="apellido_materno" id="apellido_materno" value="<?= $persona->apellido_materno ?>"/>
    </div>
    <div class="form-group">
        <label>Sexo<span class="text-danger">*</span></label>
        <select class="form-control" name="sexo" id="sexo">
            <option value="Masculino" <?= $persona->sexo == 'Masculino' ? 'selected' : '' ?>>Masculino</option>
            <option value="Femenino" <?= $persona->sexo == 'Femenino' ? 'selected' : '' ?>>Femenino</option>
        </select>
    </div>
    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Actualizar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>