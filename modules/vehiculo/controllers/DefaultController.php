<?php

namespace app\modules\vehiculo\controllers;

use app\components\Utils;
use app\models\Vehiculo;
use app\models\Vehiculos;
use app\models\Vehiculosn;
use yii\debug\models\search\Log;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\HttpException;

use Yii;
use Exception;

/**
 * Default controller for the `vehiculosn` module
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

                $vehiculos = new Vehiculo();
                $vehiculos->marca = $post['marca'];

                $vehiculos->marca = $post['marca'];
                $vehiculos->version = $post['version'];
                $vehiculos->modelo = $post['modelo'];
                $vehiculos->matricula = $post['matricula'];
                $vehiculos->denominacion_comercial = $post['denominacion_comercial'];
                $vehiculos->medidas_neumaticos = $post['medida_neumatico'];
                $vehiculos->altura = $post['altura'];
                $vehiculos->anchura = $post['anchura'];
                $vehiculos->longitud = $post['longitud'];
                $vehiculos->tipo_motor = $post['tipo_motor'];
                $vehiculos->numero_cilindros = $post['numero_cilindros'];
                $vehiculos->potencia_expresada_en_cv = $post['potencia_expresada_en_cv'];
                $vehiculos->potencia_expresada_en_kw = $post['potencia_expresada_en_kw'];
                $vehiculos->numero_bastidor = $post['numero_bastidor'];
                $vehiculos->numero_plazas = $post['numero_plazas'];
                $vehiculos->descripcion = $post['descripcion'];
                $vehiculos->incripcion = $post['incripcion'];
                $vehiculos->config_vehicular = $post['config_vehicular'];
                $vehiculos->tara = $post['tara'];

                $vehiculos->flg_estado = Utils::ACTIVO;
                $vehiculos->id_usuario_reg = Yii::$app->user->getId();
                $vehiculos->fecha_reg = Utils::getFechaActual();
                $vehiculos->ipmaq_reg = Utils::obtenerIP();

                if (!$vehiculos->save()) {
                    Utils::show($vehiculos->getErrors(), true);
                    throw new HttpException("No se puede guardar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $vehiculos->id_vehiculo;
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = Vehiculo::findOne($id);

        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "vehiculos" => $data,
        ]);
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = ["plantilla" => $plantilla];
    }

    public function actionGetModalReglubr($id)
    {
        $data = Vehiculo::findOne($id);
        $plantilla = Yii::$app->controller->renderPartial("registar_preventivo", [
            "vehiculos" => $data
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
                $vehiculos = Vehiculo::findOne($post['id_vehiculo']);

                $vehiculos->marca = $post['marca'];
                $vehiculos->version = $post['version'];
                $vehiculos->modelo = $post['modelo'];
                $vehiculos->matricula = $post['matricula'];
                $vehiculos->denominacion_comercial = $post['denominacion_comercial'];
                $vehiculos->medidas_neumaticos = $post['medida_neumatico'];
                $vehiculos->altura = $post['altura'];
                $vehiculos->anchura = $post['anchura'];
                $vehiculos->longitud = $post['longitud'];
                $vehiculos->tipo_motor = $post['tipo_motor'];
                $vehiculos->numero_cilindros = $post['numero_cilindros'];
                $vehiculos->potencia_expresada_en_cv = $post['potencia_expresada_en_cv'];
                $vehiculos->potencia_expresada_en_kw = $post['potencia_expresada_en_kw'];
                $vehiculos->numero_bastidor = $post['numero_bastidor'];
                $vehiculos->numero_plazas = $post['numero_plazas'];
                $vehiculos->descripcion = $post['descripcion'];
                $vehiculos->incripcion = $post['incripcion'];
                $vehiculos->config_vehicular = $post['config_vehicular'];
                $vehiculos->tara = $post['tara'];

                $vehiculos->id_usuario_act = Yii::$app->user->getId();
                $vehiculos->fecha_act = Utils::getFechaActual();
                $vehiculos->ipmaq_act = Utils::obtenerIP();

                if (!$vehiculos->save()) {
                    Utils::show($vehiculos->getErrors(), true);
                    throw new HttpException("No se puede actualizar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $vehiculos->id_vehiculo;

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
                $vehiculos = Vehiculo::findOne($post['id_vehiculo']);
                $vehiculos->id_usuario_del = Yii::$app->user->getId();
                $vehiculos->fecha_del = Utils::getFechaActual();
                $vehiculos->ipmaq_del = Utils::obtenerIP();

                if (!$vehiculos->save()) {
                    Utils::show($vehiculos->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro vehiculos");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            //  echo json_encode($vehiculos->id_direccion);
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $vehiculos->id_vehiculo;
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
            $command = Yii::$app->db->createCommand('call listadoVehiuclo(:row,:length,:buscar,@total)');
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
                "marca" => $row['marca'],
                "version" => $row['version'],
                "modelo" => $row['modelo'],
                "matricula" => $row['matricula'],
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditar(' . $row["id_vehiculo"] . ')"><i class="flaticon-edit"></i>Editar</button>
                              <button title="Eliminar" class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminar(' . $row["id_vehiculo"] . ')"><i class="flaticon-delete"></i></button>',
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
