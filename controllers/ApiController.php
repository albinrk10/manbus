<?php

namespace app\controllers;

use yii\web\Controller;
use Yii;

class ApiController extends Controller {

    public function actionPass($id) {
        return Yii::$app->security->generatePasswordHash($id);
    }

}
