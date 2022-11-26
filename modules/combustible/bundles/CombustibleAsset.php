<?php

namespace app\modules\combustible\bundles;

use yii\web\AssetBundle;

class CombustibleAsset extends AssetBundle {

    public $sourcePath = '@app/modules/combustible/assets';
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
