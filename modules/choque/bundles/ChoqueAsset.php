<?php

namespace app\modules\choque\bundles;

use yii\web\AssetBundle;

class ChoqueAsset extends AssetBundle {

    public $sourcePath = '@app/modules/choque/assets';
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
