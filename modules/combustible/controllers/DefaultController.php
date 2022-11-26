<?php

namespace app\modules\combustible\controllers;

use app\components\Utils;
use app\models\Combustible;
use app\models\Producto;
use yii\web\Controller;
use yii\web\HttpException;
use Yii;
/**
 * Default controller for the `combustible` module
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

                $producto = new Combustible();
                $producto->codigo_combustible = $post["codigo"];
                $producto->nombre = $post["nombre"];
                $producto->descripcion = $post["descripcion"];
                $producto->id_usuario_reg = Yii::$app->user->getId();
                $producto->fecha_reg = Utils::getFechaActual();
                $producto->ipmaq_reg = Utils::obtenerIP();

                if (!$producto->save()) {
                    Utils::show($producto->getErrors(), true);
                    throw new HttpException("No se puede guardar datos producto");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($producto->id_combustible);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = Combustible::findOne($id);
        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "combustible" => $data
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
                $producto = Combustible::findOne($post['id_combustible']);
                $producto->codigo_combustible = $post["codigo"];
                $producto->nombre = $post["nombre"];
                $producto->descripcion = $post["descripcion"];
                $producto->id_usuario_act = Yii::$app->user->getId();
                $producto->fecha_act = Utils::getFechaActual();
                $producto->ipmaq_act = Utils::obtenerIP();

                if (!$producto->update()) {
                    Utils::show($producto->getErrors(), true);
                    throw new HttpException("No se puede actualizar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($producto->id_combustible);
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
                $producto = Combustible::findOne($post['id_combustible']);
                $producto->id_usuario_del = Yii::$app->user->getId();
                $producto->fecha_del = Utils::getFechaActual();
                $producto->ipmaq_del = Utils::obtenerIP();

                if (!$producto->save()) {
                    Utils::show($producto->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro producto");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            echo json_encode($producto->id_combustible);
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
            $command = Yii::$app->db->createCommand('call listadoCombustible(:row,:length,:buscar,@total)');
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
                "codigo_combustible" => $row['codigo_combustible'],
                "nombre" => $row['nombre'],
                "descripcion" => $row['descripcion'],
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditarCombustible(' . $row["id_combustible"] . ')"><i class="flaticon-edit"></i>Editar</button>
                             <button class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminarCombustible(' . $row["id_combustible"] . ')"><i class="flaticon-delete"></i>Eliminar</button>',
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
