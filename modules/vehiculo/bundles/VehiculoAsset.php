<?php

namespace app\modules\vehiculo\bundles;

use yii\web\AssetBundle;

class VehiculoAsset extends AssetBundle {

    public $sourcePath = '@app/modules/vehiculo/assets';
    public $css = [
        'css/main.css'
    ];
    public $js = [
        'js/index.js',
        'js/crear.js',
        'js/editar.js',
        'js/eliminar.js',
        'js/reg_prev_lubri.js',
    ];
    public $depends = [
        'app\bundles\TemplateAsset',
    ];
    public $publishOptions = [
        'forceCopy' => true,
    ];

}
