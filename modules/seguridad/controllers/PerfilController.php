<?php

namespace app\modules\seguridad\controllers;

use app\models\Modulo;
use app\models\Rol;
use app\models\RolModulo;
use yii\web\Controller;
use Yii;
use yii\web\HttpException;
use Exception;
use app\components\Utils;
use app\models\Opciones;
use app\models\Perfiles;
use app\models\PerfilOpciones;

/**
 * Default controller for the `seguridad` module
 */
class PerfilController extends Controller
{

    public $enableCsrfValidation = false;

    public function actionGetModal()
    {
        $modulo = Modulo::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("crearPerfil", [
            "modulo" => $modulo
        ]);
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = ["plantilla" => $plantilla];
    }

    public function actionCreate()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();
            $post = Yii::$app->request->post();
            try {
                $perfil = new Rol();
                $perfil->nombre_rol = $post['nombre'];
                $perfil->descripcion = $post['descripcion'];
                $perfil->estado = 1;
                $perfil->id_usuario_reg = Yii::$app->user->getId();
                $perfil->fecha_reg = Utils::getFechaActual();
                $perfil->ipmaq_reg = Utils::obtenerIP();

                if (!$perfil->save()) {
                    Utils::show($perfil->getErrors(), true);
                    throw new HttpException("No se puede guardar datos Perfil");
                }

                $modulos = $post['modulo'];

                foreach ($modulos as $m) {
                    $opciones = new RolModulo();
                    $opciones->id_rol = $perfil->id_rol;
                    $opciones->id_modulo = $m;
                    $opciones->id_usuario_reg = Yii::$app->user->getId();
                    $opciones->fecha_reg = Utils::getFechaActual();
                    $opciones->ipmaq_reg = Utils::obtenerIP();

                    if (!$opciones->save()) {
                        Utils::show($opciones->getErrors(), true);
                        throw new HttpException("No se puede guardar datos Opciones");
                    }
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($perfil->id_rol);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = Rol::findOne($id);
        try {
            $command = Yii::$app->db->createCommand('call rolModulo(:idPerfil)');
            $command->bindValue(':idPerfil', $id);
            $result = $command->queryAll();
        } catch (\Exception $e) {
            echo "Error al ejecutar procedimiento" . $e;
        }

        $plantilla = Yii::$app->controller->renderPartial("editarPerfil", [
            "perfil" => $data,
            "modulo" => $result
        ]);
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = ["plantilla" => $plantilla];
    }

    public function actionUpdate()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();
            $post = Yii::$app->request->post();
            try {
                $perfil = Rol::findOne($post['id_rol']);
                $perfil->nombre_rol = $post['nombre'];
                $perfil->descripcion = $post['descripcion'];
                $perfil->id_usuario_act = Yii::$app->user->getId();
                $perfil->fecha_act = Utils::getFechaActual();
                $perfil->ipmaq_act = Utils::obtenerIP();

                if (!$perfil->save()) {
                    Utils::show($perfil->getErrors(), true);
                    throw new HttpException("No se puede guardar datos Perfil");
                }

                $modulosEliminar = RolModulo::find()->where(["id_rol" => $perfil->id_rol])->all();

                foreach ($modulosEliminar as $m) {
                    $po = RolModulo::findOne($m->id_rol_modulo);
                    $po->id_usuario_del = Yii::$app->user->getId();
                    $po->fecha_del = Utils::getFechaActual();
                    $po->ipmaq_del = Utils::obtenerIP();

                    if (!$po->save()) {
                        Utils::show($po->getErrors(), true);
                        throw new HttpException("No se puede guardar datos Perfil Opciones");
                    }
                }

                $modulos = $post['modulo'];
                foreach ($modulos as $m) {
                    $opciones = new RolModulo();
                    $opciones->id_rol = $perfil->id_rol;
                    $opciones->id_modulo = $m;
                    $opciones->id_usuario_reg = Yii::$app->user->getId();
                    $opciones->fecha_reg = Utils::getFechaActual();
                    $opciones->ipmaq_reg = Utils::obtenerIP();

                    if (!$opciones->save()) {
                        Utils::show($opciones->getErrors(), true);
                        throw new HttpException("No se puede guardar datos Opciones");
                    }
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($perfil->id_rol);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionDelete()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();
            $post = Yii::$app->request->post();

            try {
                $perfil = Rol::findOne($post['id_rol']);
                $perfil->id_usuario_del = Yii::$app->user->getId();
                $perfil->fecha_del = Utils::getFechaActual();
                $perfil->ipmaq_del = Utils::obtenerIP();

                if (!$perfil->save()) {
                    Utils::show($perfil->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro perfil");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            echo json_encode($perfil->id_rol);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionEstado()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();
            $post = Yii::$app->request->post();

            try {
                $perfil = Rol::findOne($post['id_rol']);
                $perfil->estado = $post["estado"];
                $perfil->id_usuario_act = Yii::$app->user->getId();
                $perfil->fecha_act = Utils::getFechaActual();
                $perfil->ipmaq_act = Utils::obtenerIP();

                if (!$perfil->save()) {
                    Utils::show($perfil->getErrors(), true);
                    throw new HttpException("No se puede cambiar registro perfil");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            echo json_encode($perfil->id_rol);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionLista()
    {
        $page = empty($_POST["pagination"]["page"]) ? 0 : $_POST["pagination"]["page"];
        $pages = empty($_POST["pagination"]["pages"]) ? 1 : $_POST["pagination"]["pages"];
        $buscar = empty($_POST["query"]["generalSearch"]) ? '' : $_POST["query"]["generalSearch"];
        $perpage = $_POST["pagination"]["perpage"];
        $row = ($page * $perpage) - $perpage;
//        $length = ($perpage * $page) - 1;

        try {
            $command = Yii::$app->db->createCommand('call listadoRol(:row,:length,:buscar)');
            $command->bindValue(':row', $row);
            $command->bindValue(':length', $perpage);
            $command->bindValue(':buscar', $buscar);
            $result = $command->queryAll();
        } catch (\Exception $e) {
            echo "Error al ejecutar procedimiento" . $e;
        }

        $data = [];
        foreach ($result as $k => $row) {

            $boton = "";
            if ($row["estado"] == 1) {
                $boton = '<button class="btn btn-icon btn-success btn-circle btn-xs mr-2" onclick="funcionEstadoPerfil(' . $row["id_rol"] . ',0)">
                                <i class="flaticon2-check-mark"></i>
                          </button>';
            } else {
                $boton = '<button class="btn btn-icon btn-danger btn-circle btn-xs mr-2" onclick="funcionEstadoPerfil(' . $row["id_rol"] . ',1)">
                                <i class="flaticon2-cancel"></i>
                          </button>';
            }

            $data[] = [
                "nombre" => $row['nombre_rol'],
                "descripcion" => $row['descripcion'],
                "estado" => $boton,
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditarPerfil(' . $row["id_rol"] . ')"><i class="flaticon-edit"></i>Editar</button>
                             <button class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminarPerfil(' . $row["id_rol"] . ')"><i class="flaticon-delete"></i>Eliminar</button>',
            ];
        }

        $totalData = isset($result[0]['total']) ? $result[0]['total'] : 0;

        $json_data = [
            "data" => $data,
            "meta" => [
                "page" => $page,
                "pages" => $pages,
                "perpage" => $perpage,
                "sort" => "asc",
                "total" => $totalData
            ]
        ];

        ob_start();
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = $json_data;
    }

}
