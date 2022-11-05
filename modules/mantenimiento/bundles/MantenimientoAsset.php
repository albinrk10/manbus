<?php

namespace app\modules\mantenimiento\bundles;

use yii\web\AssetBundle;

class MantenimientoAsset extends AssetBundle {

    public $sourcePath = '@app/modules/mantenimiento/assets';
    public $css = [
        'css/main.css'
    ];
    public $js = [
        'js/index.js',
        'js/crear.js',
        'js/editar.js',
        'js/eliminar.js',
    ];
    public $depends = [
        'app\bundles\TemplateAsset',
    ];
    public $publishOptions = [
        'forceCopy' => true,
    ];

}
