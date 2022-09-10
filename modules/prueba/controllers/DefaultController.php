<?php

namespace app\modules\prueba\controllers;

use app\models\Prueba;
use yii\web\Controller;

/**
 * Default controller for the `prueba` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $model = Prueba::find()->all();
        return $this->render('index', [
            "datos" => $model
        ]);
    }
}
