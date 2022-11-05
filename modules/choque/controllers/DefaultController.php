<?php

namespace app\modules\choque\controllers;

use app\components\Utils;
use app\models\Choque;
use app\models\Vehiculo;
use yii\web\Controller;
use yii\web\HttpException;
use Yii;
/**
 * Default controller for the `choque` module
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
        return $this->render('index');
    }

    public function actionGetModal()
    {
        $vehiculos = Vehiculo::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("crear", [
            "vehiculos" => $vehiculos
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
                $choque = new Choque();
                $choque->id_vehiculo = $post['vehiculo'];
                $choque->detalle = $post['descripcion'];
                $choque->fecha = $post['fecha'];
                $choque->estado = $post['estado'];
                $choque->id_usuario_reg = Yii::$app->user->getId();
                $choque->fecha_reg = Utils::getFechaActual();
                $choque->ipmaq_reg = Utils::obtenerIP();

                if (!$choque->save()) {
                    Utils::show($choque->getErrors(), true);
                    throw new HttpException("No se puede guardar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $choque->id_choque;
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = Choque::findOne($id);
        $vehiculos = Vehiculo::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "vehiculos" => $vehiculos,
            "choque" => $data
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
                //Traemos los datos mediante el id
                $choque = Choque::findOne($post['id_choque']);
                $choque->id_vehiculo = $post['vehiculo'];
                $choque->detalle = $post['descripcion'];
                $choque->fecha = $post['fecha'];
                $choque->estado = $post['estado'];
                $choque->id_usuario_reg = Yii::$app->user->getId();
                $choque->fecha_reg = Utils::getFechaActual();
                $choque->ipmaq_reg = Utils::obtenerIP();

                if (!$choque->save()) {
                    Utils::show($choque->getErrors(), true);
                    throw new HttpException("No se puede actualizar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $choque->id_choque;
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
                //Traemos los datos mediante el id
                $choque = Choque::findOne($post['id_choque']);
                $choque->id_usuario_del = Yii::$app->user->getId();
                $choque->fecha_del = Utils::getFechaActual();
                $choque->ipmaq_del = Utils::obtenerIP();

                if (!$choque->save()) {
                    Utils::show($choque->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro vehiculos");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            //  echo json_encode($vehiculos->id_direccion);
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $choque->id_choque;
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
        $length = ($perpage * $page) - 1;

        $result = [];
        $totalData = 0;

        try {
            $command = Yii::$app->db->createCommand('call listadoChoque(:row,:length,:buscar,@total)');
            $command->bindValue(':row', $row);
            $command->bindValue(':length', $length);
            $command->bindValue(':buscar', $buscar);
            $result = $command->queryAll();
            $totalData = Yii::$app->db->createCommand("select @total as result;")->queryScalar();
        } catch (\Exception $e) {
            echo "Error al ejecutar procedimiento" . $e;
        }

        $data = [];
        foreach ($result as $k => $row) {
            $data[] = [
                "vehiculo" => $row['marca'] .' '.$row['modelo'].' '.$row['version'] .' - '.$row['matricula'],
                "denominacion_comercial" => $row['denominacion_comercial'],
                "fecha" => $row['fecha'],
                "descripcion" => $row['detalle'],
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditarChoque(' . $row["id_choque"] . ')"><i class="flaticon-edit"></i></button>
                              <button title="Eliminar" class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminarChoque(' . $row["id_choque"] . ')"><i class="flaticon-delete"></i></button>',
            ];
        }

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
