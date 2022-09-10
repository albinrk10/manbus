<form id="form-producto">
    <div class="form-group row">
        <div class="col-lg-4">
            <label>Codigo Producto</label>
            <input type="text" class="form-control" placeholder="Ingrese codigo" name="codigo" id="codigo">
        </div>
        <div class="col-lg-8">
            <label>Nombre</label>
            <input type="text" class="form-control" placeholder="Ingrese nombre del producto" name="nombre" id="nombre">
        </div>
    </div>
    <div class="form-group">
        <label>Descripción<span class="text-danger">*</span></label>
        <textarea type="text" class="form-control" placeholder="Ingrese descripcion" name="descripcion" id="descripcion"></textarea>
    </div>
    <div class="form-group row">
        <div class="col-lg-6">
            <label>Precio</label>
            <input type="number" class="form-control" step="0.01" placeholder="Ingrese precio" name="precio" id="precio">
        </div>
        <div class="col-lg-6">
            <label>Stock</label>
            <input type="number" class="form-control" placeholder="Ingrese stock" name="stock" id="stock">
        </div>
    </div>

    <hr>
    <button class="btn btn-primary mr-2" id="btn-guardar">Guardar</button>
    <a class="btn btn-secondary" id="btn-cancelar">Cancelar</a>
</form>
