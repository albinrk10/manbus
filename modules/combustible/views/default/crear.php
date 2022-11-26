<form id="form-combustible">
    <div class="form-group row">
        <div class="col-lg-4">
            <label>Codigo</label>
            <input type="text" class="form-control" placeholder="Ingrese codigo" name="codigo" id="codigo">
        </div>
        <div class="col-lg-8">
            <label>Nombre</label>
            <input type="text" class="form-control" placeholder="Ingrese nombre del combustible" name="nombre" id="nombre">
        </div>
    </div>
    <div class="form-group">
        <label>Descripción<span class="text-danger">*</span></label>
        <textarea type="text" class="form-control" placeholder="Ingrese descripcion" name="descripcion" id="descripcion"></textarea>
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>
