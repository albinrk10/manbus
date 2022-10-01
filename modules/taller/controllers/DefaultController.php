<?php

namespace app\modules\taller\controllers;

use app\components\Utils;
use app\models\Area;
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
                $taller->concesionario = $post["concesionario"];
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
                $taller->concesionario = $post["concesionario"];
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
                "concesionario" => $row['concesionario'],
                "nombre" => $row['nombre'],
                "direccion" => $row['direccion'],
                "accion" => '<button class="btn btn-sm btn-light-info font-weight-bold mr-2" onclick="funcionArea(' . $row["id_taller"] . ')"><i class="flaticon-map"></i>Area</button>
                             <button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditar(' . $row["id_taller"] . ')"><i class="flaticon-edit"></i>Editar</button>
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

    public function actionGetModalArea($id)
    {
        $taller = Taller::findOne($id);
        $plantilla = Yii::$app->controller->renderPartial("area", [
            "taller" => $taller
        ]);
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = ["plantilla" => $plantilla];
    }

    public function actionListaArea($id)
    {
        $data = Area::find()->where(["id_taller" => $id, "fecha_del" => null])->all();

        $data_json = [];
        foreach ($data as $d) {
            array_push($data_json, '<tr><td>1</td><td>' . $d->nombre . '</td><td><a onclick="eliminarArea(' . $d->id_area . ')" class="btn btn-icon btn-circle btn-xs btn-light-danger mr-2"><i class="flaticon-delete"></i></a></td></tr>');
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = $data_json;
    }

    public function actionCreateArea()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();

            $post = Yii::$app->request->post();

            try {

                $area = new Area();
                $area->id_taller = $post["id_taller"];
                $area->nombre = $post["nombre"];
                $area->id_usuario_reg = Yii::$app->user->getId();
                $area->fecha_reg = Utils::getFechaActual();
                $area->ipmaq_reg = Utils::obtenerIP();

                if (!$area->save()) {
                    Utils::show($area->getErrors(), true);
                    throw new HttpException("No se puede guardar datos taller");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($area->id_area);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionEliminarArea()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();

            $post = Yii::$app->request->post();

            try {

                $area = Area::findOne($post["id_area"]);
                $area->id_usuario_del = Yii::$app->user->getId();
                $area->fecha_del = Utils::getFechaActual();
                $area->ipmaq_del = Utils::obtenerIP();

                if (!$area->save()) {
                    Utils::show($area->getErrors(), true);
                    throw new HttpException("No se puede guardar datos taller");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($area->id_taller);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }
}
