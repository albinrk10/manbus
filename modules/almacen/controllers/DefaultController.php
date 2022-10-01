<?php

namespace app\modules\almacen\controllers;

use app\components\Utils;
use app\models\Almacen;
use app\models\Producto;
use yii\web\Controller;
use yii\web\HttpException;
use Yii;

/**
 * Default controller for the `almacen` module
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
        $producto = Producto::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("crear", [
            "producto" => $producto
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

                $almacen = new Almacen();
                $almacen->id_producto = $post["producto"];
                $almacen->cantidad_entrada = $post["cantidad"];
                $almacen->cantidad_actual = $post["cantidad"];
                $almacen->fecha_ingreso = $post["fecha"];
                $almacen->id_usuario_reg = Yii::$app->user->getId();
                $almacen->fecha_reg = Utils::getFechaActual();
                $almacen->ipmaq_reg = Utils::obtenerIP();

                if (!$almacen->save()) {
                    Utils::show($almacen->getErrors(), true);
                    throw new HttpException("No se puede guardar datos producto");
                }

                $producto = Producto::findOne($almacen->id_producto);
                $producto->stock = $producto->stock + $almacen->cantidad_entrada;

                if (!$producto->save()) {
                    Utils::show($producto->getErrors(), true);
                    throw new HttpException("No se puede guardar datos producto");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($almacen->id_almacen);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = Almacen::findOne($id);
        $producto = Producto::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "almacen" => $data,
            "producto" => $producto
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
                $almacen = Almacen::findOne($post['id_almacen']);
                $almacen->id_producto = $post["producto"];
                $almacen->cantidad_entrada = $post["cantidad"];
                $almacen->fecha_ingreso = $post["fecha"];
                $almacen->id_usuario_act = Yii::$app->user->getId();
                $almacen->fecha_act = Utils::getFechaActual();
                $almacen->ipmaq_act = Utils::obtenerIP();

                if (!$almacen->update()) {
                    Utils::show($almacen->getErrors(), true);
                    throw new HttpException("No se puede actualizar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($almacen->id_almacen);
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
                $almacen = Almacen::findOne($post['id_almacen']);
                $almacen->id_usuario_del = Yii::$app->user->getId();
                $almacen->fecha_del = Utils::getFechaActual();
                $almacen->ipmaq_del = Utils::obtenerIP();

                if (!$almacen->save()) {
                    Utils::show($almacen->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro producto");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            echo json_encode($almacen->id_almacen);
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
            $command = Yii::$app->db->createCommand('call listadoAlmacen(:row,:length,:buscar,@total)');
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
                "producto" => $row['codigo_producto'] . ' | ' . $row['nombre'],
                "fecha_ingreso" => $row['fecha_ingreso'],
                "cantidad_entrada" => $row['cantidad_entrada'],
                "cantidad_salida" => $row['cantidad_salida'],
                "cantidad_actual" => '<a href="#" class="text-primary font-weight-bolder">' . $row['cantidad_actual'] . '</a>',
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditar(' . $row["id_almacen"] . ')"><i class="flaticon-edit"></i>Editar</button>
                             <button class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminar(' . $row["id_almacen"] . ')"><i class="flaticon-delete"></i>Eliminar</button>',
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
