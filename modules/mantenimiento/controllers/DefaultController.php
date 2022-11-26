<?php

namespace app\modules\mantenimiento\controllers;

use app\components\Utils;
use app\models\Diagnostico;
use app\models\Mantenimiento;
use app\models\Vehiculo;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use yii\web\Controller;
use yii\web\HttpException;
use Yii;

/**
 * Default controller for the `mantenimiento` module
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
                $mantenimiento = new Mantenimiento();
                $mantenimiento->id_vehiculo = $post['vehiculo'];
                $mantenimiento->descripcion = $post['descripcion'];
                $mantenimiento->fecha = $post['fecha'];
                $mantenimiento->id_usuario_reg = Yii::$app->user->getId();
                $mantenimiento->fecha_reg = Utils::getFechaActual();
                $mantenimiento->ipmaq_reg = Utils::obtenerIP();

                if (!$mantenimiento->save()) {
                    Utils::show($mantenimiento->getErrors(), true);
                    throw new HttpException("No se puede guardar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $mantenimiento->id_mantenimiento;
        } else {
            throw new HttpException(404, 'The requested Item could not be found.');
        }
    }

    public function actionGetModalEdit($id)
    {
        $data = Mantenimiento::findOne($id);
        $vehiculos = Vehiculo::find()->where(["fecha_del" => null])->all();
        $plantilla = Yii::$app->controller->renderPartial("editar", [
            "vehiculos" => $vehiculos,
            "mantenimiento" => $data
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
                $mantenimiento = Mantenimiento::findOne($post['id_mantenimiento']);
                $mantenimiento->id_vehiculo = $post['vehiculo'];
                $mantenimiento->descripcion = $post['descripcion'];
                $mantenimiento->fecha = $post['fecha'];
                $mantenimiento->fecha_fin = $post['fecha_fin'];
                $mantenimiento->comentario = $post['comentario'];
                $mantenimiento->id_usuario_act = Yii::$app->user->getId();
                $mantenimiento->fecha_act = Utils::getFechaActual();
                $mantenimiento->ipmaq_act = Utils::obtenerIP();

                if (!$mantenimiento->save()) {
                    Utils::show($mantenimiento->getErrors(), true);
                    throw new HttpException("No se puede actualizar datos Persona");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }

            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $mantenimiento->id_mantenimiento;
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
                $mantenimiento = Mantenimiento::findOne($post['id_mantenimiento']);
                $mantenimiento->id_usuario_del = Yii::$app->user->getId();
                $mantenimiento->fecha_del = Utils::getFechaActual();
                $mantenimiento->ipmaq_del = Utils::obtenerIP();

                if (!$mantenimiento->save()) {
                    Utils::show($mantenimiento->getErrors(), true);
                    throw new HttpException("No se puede eliminar registro vehiculos");
                }

                $transaction->commit();
            } catch (Exception $ex) {
                Utils::show($ex, true);
                $transaction->rollback();
            }
            //  echo json_encode($vehiculos->id_direccion);
            Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            Yii::$app->response->data = $mantenimiento->id_mantenimiento;
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
            $command = Yii::$app->db->createCommand('call listadoMantenimiento(:row,:length,:buscar,@total)');
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

            $estado = '<span style="width: 108px;"><span class="label label-danger label-dot mr-2"></span><span class="font-weight-bold text-danger">En Reparación</span></span>';
            if ($row["fecha_fin"] != null) {
                $estado = '<span style="width: 108px;"><span class="label label-success label-dot mr-2"></span><span class="font-weight-bold text-success">Reparado</span></span>';
            }


            $data[] = [
                "vehiculo" => $row['marca'] . ' ' . $row['modelo'] . ' ' . $row['version'] . ' - ' . $row['matricula'],
                "denominacion_comercial" => $row['denominacion_comercial'],
                "fecha" => $row['fecha'],
                "descripcion" => $row['descripcion'],
                "estado" => $estado,
                "accion" => '<button class="btn btn-sm btn-light-success font-weight-bold mr-2" onclick="funcionEditarMantenimiento(' . $row["id_mantenimiento"] . ')"><i class="flaticon-edit"></i></button>
                              <button title="Eliminar" class="btn btn-sm btn-light-danger font-weight-bold mr-2" onclick="funcionEliminarMantenimiento(' . $row["id_mantenimiento"] . ')"><i class="flaticon-delete"></i></button>',
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
        $pdf->AddPage('L', 'A4');
        $pdf->SetFont('ARIAL', 'B', 9);
        $pdf->SetAutoPageBreak(true, 10);
        $pdf->SetFont('ARIAL', 'B', 10);
        $pdf->MultiCell(0, 3, "LISTA MANTENIMIENTO", '', 'C');


        $pdf->Ln(5);
        $pdf->setX(0);
        $pdf->Ln(5);
        $pdf->SetFont('ARIAL', 'B', 9);

        $pdf->Ln(5);
        $pdf->SetTextColor(255);
        $header3 = [
            utf8_decode("ITEM"),
            utf8_decode("MARCA"),
            utf8_decode("VERSION"),
            utf8_decode("MODELO"),
            utf8_decode("MATRICULA"),
            utf8_decode("DENOMINACION COMERCIAL"),
            utf8_decode("FECHA"),
            utf8_decode("DESCRIPCION"),
            utf8_decode("FECHA FIN"),
            utf8_decode("COMENTARIO")
        ];

        $command = Yii::$app->db->createCommand("select m.id_mantenimiento,
                                                           v.marca,
                                                           v.version,
                                                           v.modelo,
                                                           v.matricula,
                                                           v.denominacion_comercial,
                                                           m.fecha,
                                                           m.descripcion,
                                                           m.fecha_fin,
                                                           m.comentario
                                                    from mantenimiento m
                                                             inner join vehiculos v on m.id_vehiculo = v.id_vehiculo
                                                    where m.fecha_del is null");
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
        $w = array(10, 50, 25, 25, 25, 30, 15, 42, 15,40);
        // Header
        for ($i = 0; $i < count($header); $i++)
            $pdf->Cell($w[$i], 5, $header[$i], 1, 0, 'C', true);
        $pdf->Ln();

        // Data
        foreach ($data as $v => $row) {
            $pdf->SetTextColor(0);
            $pdf->Cell($w[0], 9, utf8_decode($v + 1), 1, 0, 'C');
            $pdf->Cell($w[1], 9, utf8_decode($row["marca"]), 1, 0, 'C');
            $pdf->Cell($w[2], 9, utf8_decode($row["version"]), 1, 0, 'C');
            $pdf->Cell($w[3], 9, utf8_decode($row["modelo"]), 1, 0, 'C');
            $pdf->Cell($w[4], 9, utf8_decode($row["matricula"]), 1, 0, 'C');
            $pdf->Cell($w[5], 9, utf8_decode($row["denominacion_comercial"]), 1, 0, 'C');
            $pdf->Cell($w[6], 9, utf8_decode($row["fecha"]), 1, 0, 'C');
            $pdf->Cell($w[7], 9, utf8_decode($row["descripcion"]), 1, 0, 'C');
            $pdf->Cell($w[8], 9, utf8_decode($row["fecha_fin"]), 1, 0, 'C');
            $pdf->Cell($w[9], 9, utf8_decode($row["comentario"]), 1, 0, 'C');

            $pdf->Ln();

        }
    }

    public function actionExportar()
    {

        $command = Yii::$app->db->createCommand("select m.id_mantenimiento,
                                                       v.marca,
                                                       v.version,
                                                       v.modelo,
                                                       v.matricula,
                                                       v.denominacion_comercial,
                                                       m.fecha,
                                                       m.descripcion,
                                                       m.fecha_fin,
                                                       m.comentario
                                                from mantenimiento m
                                                         inner join vehiculos v on m.id_vehiculo = v.id_vehiculo
                                                where m.fecha_del is null");
        $data = $command->queryAll();


        $filename = "Lista de mantenimiento.xlsx";

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

        $sheet->mergeCells("B2:J2");
        $sheet->setCellValue('B2', 'Lista de Mantenimiento');
        $sheet->getStyle('B2')->applyFromArray(['font' => ['bold' => true, 'size' => 20], 'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER,]]);

        $sheet->getStyle('A6:J6')->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('335593');
        $sheet->getStyle('A6:J6')->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_WHITE);
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
        $sheet->setCellValue('F6', 'DENOMINACION COMERCIAL');
        $sheet->setCellValue('G6', 'FECHA');
        $sheet->setCellValue('H6', 'DESCRIPCION');
        $sheet->setCellValue('I6', 'FECHA FIN');
        $sheet->setCellValue('J6', 'COMENTARIO');

        $i = 7;
        $nu = 1;
        foreach ($data as $k => $v) {
            $sheet->setCellValue('A' . $i, $nu . '');
            $sheet->setCellValue('B' . $i, $v['marca']);
            $sheet->setCellValue('C' . $i, $v['version']);
            $sheet->setCellValue('D' . $i, $v['modelo']);
            $sheet->setCellValue('E' . $i, $v['matricula']);
            $sheet->setCellValue('F' . $i, $v['denominacion_comercial']);
            $sheet->setCellValue('G' . $i, $v['fecha']);
            $sheet->setCellValue('H' . $i, $v['descripcion']);
            $sheet->setCellValue('I' . $i, $v['fecha_fin']);
            $sheet->setCellValue('J' . $i, $v['comentario']);
            $nu = ($nu + 1);
            $i++;
        }

        $sheet->getStyle('A6' . ':J' . $i)->applyFromArray($styleBorder);

        foreach (range('A', 'J') as $columnID) {
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
