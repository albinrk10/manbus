<?php

namespace app\modules\almacen\bundles;

use yii\web\AssetBundle;

class AlmacenAsset extends AssetBundle {

    public $sourcePath = '@app/modules/almacen/assets';
    public $css = [
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
