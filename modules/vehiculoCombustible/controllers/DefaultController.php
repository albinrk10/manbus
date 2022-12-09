<?php

namespace app\modules\vehiculoCombustible\controllers;

use app\components\Utils;
use app\models\Combustible;
use app\models\Vehiculo;
use app\models\VehiculoCombustible;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use yii\web\Controller;
use yii\web\HttpException;
use Yii;

/**
 * Default controller for the `vehiculoCombustible` module
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
            "vehiculo" => $vehiculos
        ]);
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = ["plantilla" => $plantilla];
    }

    public function actionGetCombustible($id)
    {
        $vehiculo = Vehiculo::findOne($id);
        $combustible = Combustible::findOne($vehiculo->id_combustible);
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        Yii::$app->response->data = $combustible;
    }

    public function actionCreate()
    {
        if (Yii::$app->request->post()) {
            $transaction = Yii::$app->db->beginTransaction();

            $post = Yii::$app->request->post();

            try {

                $combustible = new VehiculoCombustible();
                $combustible->id_combustible = $post["combustible"];
                $combustible->id_vehiculo = $post["vehiculo"];
                $combustible->kilometraje = $post["kilometraje"];
                $combustible->id_usuario_reg = Yii::$app->user->getId();
                $combustible->fecha_reg = Utils::getFechaActual();
                $combustible->ipmaq_reg = Utils::obtenerIP();

                if (!$combustible->save()) {
                    Utils::show($combustible->getErrors(), true);
                    throw new HttpException("No se puede guardar datos producto");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($combustible->id_vehiculo_combustible);
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = VehiculoCombustible::findOne($id);
        $vehiculos = Vehiculo::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "combustible" => $data,
            "vehiculo" => $vehiculos
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
                $combustible = VehiculoCombustible::findOne($post['id_vehiculo_combustible']);
                $combustible->kilometraje = $post["kilometraje"];
                $combustible->id_usuario_act = Yii::$app->user->getId();
                $combustible->fecha_act = Utils::getFechaActual();
                $combustible->ipmaq_act = Utils::obtenerIP();

                if (!$combustible->update()) {
                    Utils::show($combustible->getErrors(), true);
                    throw new HttpException("No se puede actualizar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            echo json_encode($combustible->id_vehiculo_combustible);
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
                $combustible = VehiculoCombustible::findOne($post['id_vehiculo_combustible']);
                $combustible->id_usuario_del = Yii::$app->user->getId();
                $combustible->fecha_del = Utils::getFechaActual();
                $combustible->ipmaq_del = Utils::obtenerIP();

                if (!$combustible->save()) {
                    Utils::show($combustible->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro producto");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            echo json_encode($combustible->id_vehiculo_combustible);
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
            $command = Yii::$app->db->createCommand('call listadoVehiculoCombustible(:row,:length,:buscar,@total)');
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
                "marca" => $row['marca'],
                "version" => $row['version'],
                "modelo" => $row['modelo'],
                "matricula" => $row['matricula'],
                "nombre" => $row['nombre'],
                "kilometraje" => '<span class="label label-light-warning label-inline font-weight-bolder">' . $row['kilometraje'] . '</span>',
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditarVehiculoCombustible(' . $row["id_vehiculo_combustible"] . ')"><i class="flaticon-edit"></i>Editar</button>
                             <button class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminarVehiculoCombustible(' . $row["id_vehiculo_combustible"] . ')"><i class="flaticon-delete"></i>Eliminar</button>',
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

            $pdf->MultiCell(0, 3, "TOTAL COMBUSTIBLE", '', 'C');
        }

        $pdf->Ln(5);
        $pdf->setX(0);
        $pdf->Ln(5);
        $pdf->SetFont('ARIAL', 'B', 9);

        $pdf->Ln(5);
        $pdf->SetTextColor(255);
        $header3 = [utf8_decode("ITEM"), utf8_decode("MARCA"), utf8_decode("VERSION"), utf8_decode("MODELO"), utf8_decode("MATRICULA"), utf8_decode("COMBUSTIBLE"), utf8_decode("KILOMETRAJE")];

        $command = Yii::$app->db->createCommand("select v.marca,
                                                           v.version,
                                                           v.modelo,
                                                           v.matricula,
                                                           c.nombre as combustible,
                                                           vc.kilometraje
                                                    from vehiculo_combustible vc
                                                             inner join combustible c on vc.id_combustible = c.id_combustible
                                                             inner join vehiculos v on vc.id_combustible = v.id_combustible
                                                    where vc.fecha_del is null");
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
        $w = array(10, 50, 30, 30, 20,30,18);
        // Header
        for ($i = 0; $i < count($header); $i++)
            $pdf->Cell($w[$i], 7, $header[$i], 1, 0, 'C', true);
        $pdf->Ln();

        // Data
        foreach ($data as $v => $row) {
            $pdf->SetTextColor(0);
            $pdf->Cell($w[0], 9, utf8_decode($v + 1), 1, 0, 'C');
            $pdf->Cell($w[1], 9, utf8_decode($row["marca"]), 1, 0, 'C');
            $pdf->Cell($w[2], 9, utf8_decode($row["version"]), 1, 0, 'C');
            $pdf->Cell($w[3], 9, utf8_decode($row["modelo"]), 1, 0, 'C');
            $pdf->Cell($w[4], 9, utf8_decode($row["matricula"]), 1, 0, 'C');
            $pdf->Cell($w[5], 9, utf8_decode($row["combustible"]), 1, 0, 'C');
            $pdf->Cell($w[6], 9, utf8_decode($row["kilometraje"]), 1, 0, 'C');

            $pdf->Ln();

        }
    }

    public function actionExportar()
    {

        $command = Yii::$app->db->createCommand("select v.marca,
                                                           v.version,
                                                           v.modelo,
                                                           v.matricula,
                                                           c.nombre as combustible,
                                                           vc.kilometraje
                                                    from vehiculo_combustible vc
                                                             inner join combustible c on vc.id_combustible = c.id_combustible
                                                             inner join vehiculos v on vc.id_combustible = v.id_combustible
                                                    where vc.fecha_del is null");
        $data = $command->queryAll();


        $filename = "Total Combustible Vehiculo.xlsx";

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

        $sheet->mergeCells("B2:F2");
        $sheet->setCellValue('B2', 'Total Combustible Vehiculo');
        $sheet->getStyle('B2')->applyFromArray(['font' => ['bold' => true, 'size' => 20], 'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER,]]);

        $sheet->getStyle('A6:G6')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('335593');
        $sheet->getStyle('A6:G6')->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_WHITE);
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
        $sheet->setCellValue('E6', 'MATRICULA');
        $sheet->setCellValue('F6', 'COMBUSTIBLE');
        $sheet->setCellValue('G6', 'KILOMETRAJE');

        $i = 7;
        $nu = 1;
        foreach ($data as $k => $v) {
            $sheet->setCellValue('A' . $i, $nu . '');
            $sheet->setCellValue('B' . $i, $v['marca']);
            $sheet->setCellValue('C' . $i, $v['version']);
            $sheet->setCellValue('D' . $i, $v['modelo']);
            $sheet->setCellValue('E' . $i, $v['matricula']);
            $sheet->setCellValue('F' . $i, $v['combustible']);
            $sheet->setCellValue('G' . $i, $v['kilometraje']);
            $nu = ($nu + 1);
            $i++;
        }

        $sheet->getStyle('A6' . ':G' . $i)->applyFromArray($styleBorder);

        foreach (range('A', 'G') as $columnID) {
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
