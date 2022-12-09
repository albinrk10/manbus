<?php

use app\modules\vehiculoCombustible\bundles\VehiculoCombustibleAsset;

$bundle = VehiculoCombustibleAsset::register($this);
?>
<!--begin::Card-->
<div class="card card-custom">
    <div class="card-header flex-wrap border-0 pt-6 pb-0">
        <div class="card-title">
            <h3 class="card-label">Lista Vehiculo Combustible </h3>
        </div>
        <div class="card-toolbar">
            <!--begin::Button-->
            <a href="/manbus/web/vehiculoCombustible/default/exportar-pdf" target="_blank" class="btn btn-success">
                <i class="text-white flaticon-download"></i>
                Reporte pdf
            </a>
            &nbsp;
            <a href="/manbus/web/vehiculoCombustible/default/exportar" target="_blank" class="btn btn-success">
                <i class="text-white flaticon-download"></i>
                Reporte excel
            </a>
            &nbsp;
            <a href="/manbus/web/vehiculoCombustible/default/exportar" target="_blank" class="btn btn-success">
                <i class="text-white flaticon-download"></i>
                Reporte csv
            </a>
            &nbsp;
            <button id="modal-vehiculo-combustible" class="btn btn-primary">
                <i class="text-white flaticon-avatar"></i>
                Registrar Combustible
            </button>
            <!--end::Button-->
        </div>
    </div>
    <div class="card-body">
        <!--begin: Search Form-->
        <!--begin::Search Form-->
        <div class="mb-7">
            <div class="row align-items-center">
                <div class="col-md-12">
                    <div class="input-icon">
                        <input type="text" class="form-control" placeholder="Buscar..." id="tabla-vehiculo-combustible-buscar"/>
                        <span>
                            <i class="flaticon2-search-1 text-muted"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!--end::Search Form-->
        <!--end: Search Form-->
        <!--begin: Datatable-->
        <div class="datatable datatable-bordered datatable-head-custom" id="tabla-vehiculo-combustible"></div>
        <!--end: Datatable-->
    </div>
</div>
<!--end::Card-->