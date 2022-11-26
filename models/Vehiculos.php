<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vehiculos".
 *
 * @property int $id_vehiculo
 * @property string $marca
 * @property string $version
 * @property string $modelo
 * @property string $matricula
 * @property string $denominacion_comercial
 * @property string $medidas_neumaticos
 * @property string $altura
 * @property string $anchura
 * @property string $longitud
 * @property string $distancia_entre_ejes
 * @property string $masa_maxima_autorizada
 * @property string $tipo_motor
 * @property string $numero_cilindros
 * @property string $cilindarada
 * @property string $potencia_expresada_en_cv
 * @property string $potencia_expresada_en_kw
 * @property string $numero_bastidor
 * @property string $numero_plazas
 * @property string $tara
 * @property string $descripcion
 * @property string $incripcion
 * @property string $config_vehicular
 * @property int $flg_estado
 * @property int $id_usuario_reg
 * @property string $fecha_reg
 * @property string $ipmaq_reg
 * @property int $id_usuario_act
 * @property string $fecha_act
 * @property string $ipmaq_act
 * @property int $id_usuario_del
 * @property string $fecha_del
 * @property string $ipmaq_del
 * @property string $estado
 * @property int $flg_inspeccion_tecnica
 * @property int $flg_soat
 * @property int $id_combustible
 */
class Vehiculos extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'vehiculos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['marca', 'flg_estado', 'id_usuario_reg', 'fecha_reg', 'ipmaq_reg'], 'required'],
            [['flg_estado', 'id_usuario_reg', 'id_usuario_act', 'id_usuario_del', 'flg_inspeccion_tecnica', 'flg_soat', 'id_combustible'], 'integer'],
            [['fecha_reg', 'fecha_act', 'fecha_del'], 'safe'],
            [['marca'], 'string', 'max' => 100],
            [['version', 'modelo', 'matricula', 'denominacion_comercial', 'medidas_neumaticos', 'altura', 'anchura', 'longitud', 'distancia_entre_ejes', 'masa_maxima_autorizada', 'tipo_motor', 'numero_cilindros', 'cilindarada', 'potencia_expresada_en_cv', 'potencia_expresada_en_kw', 'numero_bastidor', 'numero_plazas', 'tara', 'config_vehicular'], 'string', 'max' => 255],
            [['descripcion', 'incripcion'], 'string', 'max' => 200],
            [['ipmaq_reg', 'ipmaq_act', 'ipmaq_del'], 'string', 'max' => 20],
            [['estado'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_vehiculo' => 'Id Vehiculo',
            'marca' => 'Marca',
            'version' => 'Version',
            'modelo' => 'Modelo',
            'matricula' => 'Matricula',
            'denominacion_comercial' => 'Denominacion Comercial',
            'medidas_neumaticos' => 'Medidas Neumaticos',
            'altura' => 'Altura',
            'anchura' => 'Anchura',
            'longitud' => 'Longitud',
            'distancia_entre_ejes' => 'Distancia Entre Ejes',
            'masa_maxima_autorizada' => 'Masa Maxima Autorizada',
            'tipo_motor' => 'Tipo Motor',
            'numero_cilindros' => 'Numero Cilindros',
            'cilindarada' => 'Cilindarada',
            'potencia_expresada_en_cv' => 'Potencia Expresada En Cv',
            'potencia_expresada_en_kw' => 'Potencia Expresada En Kw',
            'numero_bastidor' => 'Numero Bastidor',
            'numero_plazas' => 'Numero Plazas',
            'tara' => 'Tara',
            'descripcion' => 'Descripcion',
            'incripcion' => 'Incripcion',
            'config_vehicular' => 'Config Vehicular',
            'flg_estado' => 'Flg Estado',
            'id_usuario_reg' => 'Id Usuario Reg',
            'fecha_reg' => 'Fecha Reg',
            'ipmaq_reg' => 'Ipmaq Reg',
            'id_usuario_act' => 'Id Usuario Act',
            'fecha_act' => 'Fecha Act',
            'ipmaq_act' => 'Ipmaq Act',
            'id_usuario_del' => 'Id Usuario Del',
            'fecha_del' => 'Fecha Del',
            'ipmaq_del' => 'Ipmaq Del',
            'estado' => 'Estado',
            'flg_inspeccion_tecnica' => 'Flg Inspeccion Tecnica',
            'flg_soat' => 'Flg Soat',
            'id_combustible' => 'Id Combustible',
        ];
    }
}
