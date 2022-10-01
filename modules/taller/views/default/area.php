<form id="form-area">
    <div class="form-group">
        <label>Nombre taller</label>
        <input type="text" class="form-control" readonly
               value="<?= $taller->codigo_taller . ' | ' . $taller->nombre ?>"/>
    </div>
    <div class="form-group">
        <label>Nombre area<span class="text-danger">*</span></label>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Ingrese nombre" name="nombre_taller"
                   id="nombre_taller">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit" id="btn-guardar-area">+</button>
            </div>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Area</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody id="area_table"></tbody>
    </table>
</form>
