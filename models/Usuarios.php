<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuarios".
 *
 * @property int $id_usuario
 * @property int $id_empleado
 * @property int $id_area
 * @property int $id_rol
 * @property string $usuario
 * @property string $password
 * @property string $correo
 * @property int $id_usuario_reg
 * @property string $fecha_reg
 * @property string $ipmaq_reg
 * @property int $id_usuario_act
 * @property string $fecha_act
 * @property string $ipmaq_act
 * @property int $id_usuario_del
 * @property string $fecha_del
 * @property string $ipmaq_del
 * @property int $estado
 */
class Usuarios extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'usuarios';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_empleado', 'id_rol', 'usuario', 'password', 'id_usuario_reg', 'fecha_reg', 'ipmaq_reg'], 'required'],
            [['id_empleado', 'id_area', 'id_rol', 'id_usuario_reg', 'id_usuario_act', 'id_usuario_del', 'estado'], 'integer'],
            [['fecha_reg', 'fecha_act', 'fecha_del'], 'safe'],
            [['usuario', 'correo'], 'string', 'max' => 100],
            [['password'], 'string', 'max' => 200],
            [['ipmaq_reg', 'ipmaq_act', 'ipmaq_del'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_usuario' => 'Id Usuario',
            'id_empleado' => 'Id Empleado',
            'id_area' => 'Id Area',
            'id_rol' => 'Id Rol',
            'usuario' => 'Usuario',
            'password' => 'Password',
            'correo' => 'Correo',
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
