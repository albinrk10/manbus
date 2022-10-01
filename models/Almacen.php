<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "almacen".
 *
 * @property int $id_almacen
 * @property string $id_producto
 * @property string $cantidad_entrada
 * @property string $cantidad_salida
 * @property string $cantidad_actual
 * @property int $id_usuario_reg
 * @property string $fecha_reg
 * @property string $ipmaq_reg
 * @property int $id_usuario_act
 * @property string $fecha_act
 * @property string $ipmaq_act
 * @property int $id_usuario_del
 * @property string $fecha_del
 * @property string $ipmaq_del
 * @property string $fecha_ingreso
 */
class Almacen extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'almacen';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_producto', 'id_usuario_reg', 'fecha_reg'], 'required'],
            [['cantidad_entrada', 'cantidad_salida', 'cantidad_actual'], 'number'],
            [['id_usuario_reg', 'id_usuario_act', 'id_usuario_del'], 'integer'],
            [['fecha_reg', 'fecha_act', 'fecha_del', 'fecha_ingreso'], 'safe'],
            [['id_producto'], 'string', 'max' => 50],
            [['ipmaq_reg', 'ipmaq_act', 'ipmaq_del'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_almacen' => 'Id Almacen',
            'id_producto' => 'Id Producto',
            'cantidad_entrada' => 'Cantidad Entrada',
            'cantidad_salida' => 'Cantidad Salida',
            'cantidad_actual' => 'Cantidad Actual',
            'id_usuario_reg' => 'Id Usuario Reg',
            'fecha_reg' => 'Fecha Reg',
            'ipmaq_reg' => 'Ipmaq Reg',
            'id_usuario_act' => 'Id Usuario Act',
            'fecha_act' => 'Fecha Act',
            'ipmaq_act' => 'Ipmaq Act',
            'id_usuario_del' => 'Id Usuario Del',
            'fecha_del' => 'Fecha Del',
            'ipmaq_del' => 'Ipmaq Del',
            'fecha_ingreso' => 'Fecha Ingreso',
        ];
    }
}
