<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vehiculo_combustible".
 *
 * @property int $id_vehiculo_combustible
 * @property int $id_vehiculo
 * @property int $id_combustible
 * @property string $kilometraje
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
class VehiculoCombustible extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'vehiculo_combustible';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_vehiculo', 'id_combustible', 'kilometraje', 'id_usuario_reg', 'fecha_reg'], 'required'],
            [['id_vehiculo', 'id_combustible', 'id_usuario_reg', 'id_usuario_act', 'id_usuario_del'], 'integer'],
            [['kilometraje'], 'number'],
            [['fecha_reg', 'fecha_act', 'fecha_del'], 'safe'],
            [['ipmaq_reg', 'ipmaq_act', 'ipmaq_del'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_vehiculo_combustible' => 'Id Vehiculo Combustible',
            'id_vehiculo' => 'Id Vehiculo',
            'id_combustible' => 'Id Combustible',
            'kilometraje' => 'Kilometraje',
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
