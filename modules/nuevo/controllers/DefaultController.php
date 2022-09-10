<?php

namespace app\modules\nuevo\controllers;

use yii\web\Controller;

/**
 * Default controller for the `nuevo` module
 */
class DefaultController extends Controller
{
    public $enableCsrfValidation = false;
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $nombre = "albin_L";
        return $this->render('index', [
            "saludos" => $nombre
        ]);
    }

    public function actionSaludo()
    {
        $nombre = $_POST["nombre"];
        echo $nombre;
    }
}
