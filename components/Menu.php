<?php

namespace app\components;

use Yii;

class Menu {

    public static function getListaMenu() {
        $result = [];
        try {
            $command = Yii::$app->db->createCommand('call menu(:idPerfil)');
            $command->bindValue(':idPerfil', Yii::$app->user->identity->id_perfil);
            $result = $command->queryAll();
        } catch (\Exception $e) {
            echo "Error al ejecutar procedimiento" . $e;
        }
        return $result;
    }

}
