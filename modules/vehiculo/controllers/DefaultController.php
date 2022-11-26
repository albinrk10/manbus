<?php

namespace app\modules\vehiculo\controllers;

use app\components\Utils;
use app\models\Combustible;
use app\models\Vehiculo;
use app\models\Vehiculos;
use app\models\Vehiculosn;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
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
        $combustible = Combustible::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("crear", [
            "combustible" => $combustible
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
                $vehiculos->estado = $post['estado'];
                $vehiculos->id_combustible = $post['combustible'];

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
        $combustible = Combustible::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "vehiculos" => $data,
            "combustible" => $combustible
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
                $vehiculos->estado = $post['estado'];
                $vehiculos->flg_inspeccion_tecnica = $post['flg_inspeccion_tecnica'];
                $vehiculos->flg_soat = $post['flg_soat'];
                $vehiculos->id_combustible = $post['combustible'];

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
                "combustible" => $row['combustible'],
                "estado" => $row['estado'],
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditar(' . $row["id_vehiculo"] . ')"><i class="flaticon-edit"></i></button>
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

    public function actionExportarPdf()
    {
        $pdf = new \FPDF();
        $pdf->AddPage('P', 'A4');
        $pdf->SetFont('ARIAL', 'B', 9);
        $pdf->SetAutoPageBreak(true, 10);
        if (1 == 1) {
            $pdf->SetFont('ARIAL', 'B', 10);

            $pdf->MultiCell(0, 3, "TOTAL VEHICULO", '', 'C');
        }

        $pdf->Ln(5);
        $pdf->setX(0);
        $pdf->Ln(5);
        $pdf->SetFont('ARIAL', 'B', 9);

        $pdf->Ln(5);
        $pdf->SetTextColor(255);
        $header3 = [utf8_decode("ITEM"), utf8_decode("MARCA"), utf8_decode("VERSION"), utf8_decode("MODELO"), utf8_decode("ESTADO")];

        $command = Yii::$app->db->createCommand("SELECT marca, version, modelo, estado FROM vehiculos WHERE fecha_del is NULL");
        $data = $command->queryAll();

        self::tablaActaResultadoFInalPDF($pdf, $header3, $data);


        $pdf->Ln();
        // ob_start();
        $pdf->Output();
        exit;
    }

    public static function tablaActaResultadoFInalPDF($pdf, $header, $data)

    {
        $pdf->SetFont('', '', 5);
        $w = array(30, 50, 30, 30, 30);
        // Header
        for ($i = 0; $i < count($header); $i++)
            $pdf->Cell($w[$i], 6, $header[$i], 1, 0, 'C', true);
        $pdf->Ln();

        // Data
        foreach ($data as $v => $row) {
            $pdf->SetTextColor(0);
            $pdf->Cell($w[0], 9, utf8_decode($v + 1), 1, 0, 'C');
            $pdf->Cell($w[1], 9, utf8_decode($row["marca"]), 1, 0, 'C');
            $pdf->Cell($w[2], 9, utf8_decode($row["version"]), 1, 0, 'C');
            $pdf->Cell($w[3], 9, utf8_decode($row["modelo"]), 1, 0, 'C');
            $pdf->Cell($w[4], 9, utf8_decode($row["estado"]), 1, 0, 'C');

            $pdf->Ln();

        }
    }

    public function actionExportar()
    {

        $command = Yii::$app->db->createCommand("SELECT marca, version, modelo, estado FROM vehiculos WHERE fecha_del is NULL");
        $data = $command->queryAll();


        $filename = "Total Vehiculo.xlsx";

        $spreadsheet = new Spreadsheet();

        $styleBorder = [
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                    'color' => ['rgb' => '000000'],
                ],
            ]
        ];

        $sheet = $spreadsheet->getActiveSheet();

        $sheet->mergeCells("B2:E2");
        $sheet->setCellValue('B2', 'Total Vehiculo');
        $sheet->getStyle('B2')->applyFromArray(['font' => ['bold' => true, 'size' => 20], 'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER,]]);

        $sheet->getStyle('A6:E6')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('335593');
        $sheet->getStyle('A6:E6')->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_WHITE);
        $sheet->getPageSetup()->setScale(73);
        $sheet->getPageSetup()
            ->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);


        $sheet->getPageSetup()->setHorizontalCentered(true);
        $sheet->getPageSetup()->setVerticalCentered(false);

        $sheet->getPageMargins()->setTop(0);
        $sheet->getPageMargins()->setRight(0);
        $sheet->getPageMargins()->setLeft(0);
        $sheet->getPageMargins()->setBottom(0);


        $sheet->setCellValue('A6', 'ITEM');
        $sheet->setCellValue('B6', 'MARCA');
        $sheet->setCellValue('C6', 'VERSION');
        $sheet->setCellValue('D6', 'MODELO');
        $sheet->setCellValue('E6', 'ESTADO');

        $i = 7;
        $nu = 1;
        foreach ($data as $k => $v) {
            $sheet->setCellValue('A' . $i, $nu . '');
            $sheet->setCellValue('B' . $i, $v['marca']);
            $sheet->setCellValue('C' . $i, $v['version']);
            $sheet->setCellValue('D' . $i, $v['modelo']);
            $sheet->setCellValue('E' . $i, $v['estado']);
            $nu = ($nu + 1);
            $i++;
        }

        $sheet->getStyle('A6' . ':E' . $i)->applyFromArray($styleBorder);

        foreach (range('A', 'E') as $columnID) {
            $sheet->getColumnDimension($columnID)
                ->setAutoSize(true);
        }

        ///$drawing->setWorksheet($sheet);

        $writer = IOFactory::createWriter($spreadsheet, "Xlsx");
        $response = Yii::$app->getResponse();
        $headers = $response->getHeaders();
        $headers->set('Content-Type', 'application/vnd.ms-excel');
        $headers->set('Content-Disposition', 'attachment;filename="' . $filename . '"');

        ob_start();
        $writer->save("php://output");
        $content = ob_get_contents();
        ob_clean();
        return $content;
    }

}
