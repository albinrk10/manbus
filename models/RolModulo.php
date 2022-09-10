<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rol_modulo".
 *
 * @property int $id_rol_modulo
 * @property int $id_rol
 * @property int $id_modulo
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
class RolModulo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'rol_modulo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_rol', 'id_modulo', 'id_usuario_reg', 'fecha_reg', 'ipmaq_reg'], 'required'],
            [['id_rol', 'id_modulo', 'id_usuario_reg', 'id_usuario_act', 'id_usuario_del'], 'integer'],
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
            'id_rol_modulo' => 'Id Rol Modulo',
            'id_rol' => 'Id Rol',
            'id_modulo' => 'Id Modulo',
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
