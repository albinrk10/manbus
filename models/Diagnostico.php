<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "diagnostico".
 *
 * @property int $id_diagnostico
 * @property int $id_vehiculo
 * @property string $descripcion
 * @property int $id_usuario_reg
 * @property string $fecha_reg
 * @property string $ipmaq_reg
 * @property int $id_usuario_act
 * @property string $fecha_act
 * @property string $ipmaq_act
 * @property int $id_usuario_del
 * @property string $fecha_del
 * @property string $ipmaq_del
 */
class Diagnostico extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'diagnostico';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_vehiculo', 'id_usuario_reg', 'fecha_reg', 'ipmaq_reg'], 'required'],
            [['id_vehiculo', 'id_usuario_reg', 'id_usuario_act', 'id_usuario_del'], 'integer'],
            [['fecha_reg', 'fecha_act', 'fecha_del'], 'safe'],
            [['descripcion'], 'string', 'max' => 200],
            [['ipmaq_reg', 'ipmaq_act', 'ipmaq_del'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_diagnostico' => 'Id Diagnostico',
            'id_vehiculo' => 'Id Vehiculo',
            'descripcion' => 'Descripcion',
            'id_usuario_reg' => 'Id Usuario Reg',
            'fecha_reg' => 'Fecha Reg',
            'ipmaq_reg' => 'Ipmaq Reg',
            'id_usuario_act' => 'Id Usuario Act',
            'fecha_act' => 'Fecha Act',
            'ipmaq_act' => 'Ipmaq Act',
            'id_usuario_del' => 'Id Usuario Del',
            'fecha_del' => 'Fecha Del',
            'ipmaq_del' => 'Ipmaq Del',
        ];
    }
}
