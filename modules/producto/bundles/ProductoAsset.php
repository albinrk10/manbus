<?php

namespace app\modules\producto\bundles;

use yii\web\AssetBundle;

class ProductoAsset extends AssetBundle {

    public $sourcePath = '@app/modules/producto/assets';
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
