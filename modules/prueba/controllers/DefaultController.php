<?php

namespace app\modules\prueba\controllers;

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
        $saludo = "Hola Mundo! desde el controlador";
        return $this->render('index',[
            "saludo"=>$saludo
        ]);
    }
}
