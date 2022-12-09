<?php

namespace app\modules\vehiculoCombustible\bundles;

use yii\web\AssetBundle;

class VehiculoCombustibleAsset extends AssetBundle {

    public $sourcePath = '@app/modules/vehiculoCombustible/assets';
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
