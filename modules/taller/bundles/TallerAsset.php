<?php

namespace app\modules\taller\bundles;

use yii\web\AssetBundle;

class TallerAsset extends AssetBundle {

    public $sourcePath = '@app/modules/taller/assets';
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
