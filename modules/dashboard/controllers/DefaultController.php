<?php

namespace app\modules\dashboard\controllers;

use yii\web\Controller;
use Yii;
/**
 * Default controller for the `dashboard` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $uno = "";
        $dos = "";
        $tres = "";

        $command1 = Yii::$app->db->createCommand("select concat(v.marca,' ', v.version,' ', v.modelo) as vehiculo from choque c inner join vehiculos v on c.id_vehiculo = v.id_vehiculo where c.estado = 'por reparar' and c.fecha_del is null;");
        $uno = $command1->queryAll();

        $command2 = Yii::$app->db->createCommand("select concat(v.marca,' ', v.version,' ', v.modelo) as vehiculo from choque c inner join vehiculos v on c.id_vehiculo = v.id_vehiculo where c.estado = 'reparado' and c.fecha_del is null;");
        $dos = $command2->queryAll();

        $command3 = Yii::$app->db->createCommand("select concat(v.marca,' ', v.version,' ', v.modelo) as vehiculo from vehiculos v where flg_soat = 1 and fecha_del is null;");
        $tres = $command3->queryAll();

        return $this->render('index', [
            "uno" => $uno,
            "dos" => $dos,
            "tres" => $tres
        ]);
    }
}
