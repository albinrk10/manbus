<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "producto".
 *
 * @property int $id_producto
 * @property string $codigo_producto
 * @property string $nombre
 * @property string $descripcion
 * @property int $estado
 * @property string $precio
 * @property string $stock
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
class Producto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'producto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['codigo_producto', 'nombre', 'descripcion', 'estado', 'id_usuario_reg', 'fecha_reg'], 'required'],
            [['estado', 'id_usuario_reg', 'id_usuario_act', 'id_usuario_del'], 'integer'],
            [['precio', 'stock'], 'number'],
            [['fecha_reg', 'fecha_act', 'fecha_del'], 'safe'],
            [['codigo_producto', 'nombre', 'descripcion'], 'string', 'max' => 50],
            [['ipmaq_reg', 'ipmaq_act', 'ipmaq_del'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_producto' => 'Id Producto',
            'codigo_producto' => 'Codigo Producto',
            'nombre' => 'Nombre',
            'descripcion' => 'Descripcion',
            'estado' => 'Estado',
            'precio' => 'Precio',
            'stock' => 'Stock',
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
