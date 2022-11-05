<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "choque".
 *
 * @property int $id_choque
 * @property int $id_vehiculo
 * @property string $fecha
 * @property string $detalle
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
 */
class Choque extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'choque';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_vehiculo', 'id_usuario_reg', 'fecha_reg', 'ipmaq_reg'], 'required'],
            [['id_vehiculo', 'id_usuario_reg', 'id_usuario_act', 'id_usuario_del'], 'integer'],
            [['fecha', 'fecha_reg', 'fecha_act', 'fecha_del'], 'safe'],
            [['detalle'], 'string', 'max' => 200],
            [['ipmaq_reg', 'ipmaq_act', 'ipmaq_del', 'estado'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_choque' => 'Id Choque',
            'id_vehiculo' => 'Id Vehiculo',
            'fecha' => 'Fecha',
            'detalle' => 'Detalle',
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
        ];
    }
}
