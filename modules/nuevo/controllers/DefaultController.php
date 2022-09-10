<?php

namespace app\modules\nuevo\controllers;

use yii\web\Controller;

/**
 * Default controller for the `nuevo` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $saludo = "Ingresa un nombre para saludar";
        return $this->render('index', [
            "uno" => $saludo,
        ]);
    }

    public function actionSaludo()
    {
        $nombre = $_POST["nombre"];


        echo "Hola " . $nombre;
    }

}
