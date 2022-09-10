<?php

namespace app\modules\taller\controllers;

use app\components\Utils;
use Yii;
use app\models\Taller;
use yii\web\Controller;
use yii\web\HttpException;

/**
 * Default controller for the `taller` module
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
        $plantilla = Yii::$app->controller->renderPartial("crear", []);
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = ["plantilla" => $plantilla];
    }

    public function actionCreate()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();

            $post = Yii::$app->request->post();

            try {

                $taller = new Taller();
                $taller->codigo_taller = $post["codigo"];
                $taller->nombre = $post["nombre"];
                $taller->direccion = $post["direccion"];
                $taller->id_usuario_reg = Yii::$app->user->getId();
                $taller->fecha_reg = Utils::getFechaActual();
                $taller->ipmaq_reg = Utils::obtenerIP();

                if (!$taller->save()) {
                    Utils::show($taller->getErrors(), true);
                    throw new HttpException("No se puede guardar datos taller");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($taller->id_taller);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = Taller::findOne($id);
        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "taller" => $data
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
                $taller = Taller::findOne($post['id_taller']);
                $taller->codigo_taller = $post["codigo"];
                $taller->nombre = $post["nombre"];
                $taller->direccion = $post["direccion"];
                $taller->id_usuario_act = Yii::$app->user->getId();
                $taller->fecha_act = Utils::getFechaActual();
                $taller->ipmaq_act = Utils::obtenerIP();

                if (!$taller->update()) {
                    Utils::show($taller->getErrors(), true);
                    throw new HttpException("No se puede actualizar datos taller");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($taller->id_taller);
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
                $taller = Taller::findOne($post['id_taller']);
                $taller->id_usuario_del = Yii::$app->user->getId();
                $taller->fecha_del = Utils::getFechaActual();
                $taller->ipmaq_del = Utils::obtenerIP();

                if (!$taller->save()) {
                    Utils::show($taller->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro taller");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            echo json_encode($taller->id_taller);
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

        $result = [];
        $totalData = 0;

        try {
            $command = Yii::$app->db->createCommand('call listadoTaller(:row,:length,:buscar,@total)');
            $command->bindValue(':row', $row);
            $command->bindValue(':length', $perpage);
            $command->bindValue(':buscar', $buscar);
            $result = $command->queryAll();
            $totalData = Yii::$app->db->createCommand("select @total as result;")->queryScalar();
        } catch (\Exception $e) {
            echo "Error al ejecutar procedimiento" . $e;
        }

        $data = [];
        foreach ($result as $k => $row) {
            $data[] = [
                "codigo_taller" => $row['codigo_taller'],
                "nombre" => $row['nombre'],
                "direccion" => $row['direccion'],
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditar(' . $row["id_taller"] . ')"><i class="flaticon-edit"></i>Editar</button>
                             <button class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminar(' . $row["id_taller"] . ')"><i class="flaticon-delete"></i>Eliminar</button>',
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
