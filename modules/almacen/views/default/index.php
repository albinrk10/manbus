<?php

use app\modules\almacen\bundles\AlmacenAsset;

$bundle = AlmacenAsset::register($this);
?>
<!--begin::Card-->
<div class="card card-custom">
    <div class="card-header flex-wrap border-0 pt-6 pb-0">
        <div class="card-title">
            <h3 class="card-label">Almacen </h3>
        </div>
        <div class="card-toolbar">
            <!--begin::Button-->
            <button id="modal-almacen" class="btn btn-primary">
                <i class="text-white flaticon2-plus"></i>
                Nuevo Registro
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
                        <input type="text" class="form-control" placeholder="Buscar por producto..." id="tabla-almacen-buscar"/>
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
        <div class="datatable datatable-bordered datatable-head-custom" id="tabla-almacen"></div>
        <!--end: Datatable-->
    </div>
</div>
<!--end::Card-->