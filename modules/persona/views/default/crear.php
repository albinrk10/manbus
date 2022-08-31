<form id="form-persona">
    <div class="form-group">
        <label>DNI<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese DNI" name="dni" id="dni"/>
    </div>
    <div class="form-group">
        <label>Nombres<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese nombres" name="nombres" id="nombres" />
    </div>
    <div class="form-group">
        <label>Apellido Paterno<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese apellido paterno" name="apellido_paterno" id="apellido_paterno"/>
    </div>
    <div class="form-group">
        <label>Apellido Materno<span class="text-danger">*</span></label>
        <input type="text" class="form-control" placeholder="Ingrese apellido materno" name="apellido_materno" id="apellido_materno"/>
    </div>
    <div class="form-group">
        <label>Sexo<span class="text-danger">*</span></label>
        <select class="form-control" name="sexo" id="sexo">
            <option value="Masculino">Masculino</option>
            <option value="Femenino">Femenino</option>
        </select>
    </div>
    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>
