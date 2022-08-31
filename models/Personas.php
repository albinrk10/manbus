<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "personas".
 *
 * @property int $id_persona
 * @property string $dni
 * @property string $nombres
 * @property string $apellido_paterno
 * @property string $apellido_materno
 * @property string $sexo
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
class Personas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'personas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['dni', 'nombres', 'apellido_paterno', 'apellido_materno', 'sexo', 'id_usuario_reg', 'fecha_reg', 'ipmaq_reg'], 'required'],
            [['id_usuario_reg', 'id_usuario_act', 'id_usuario_del'], 'integer'],
            [['fecha_reg', 'fecha_act', 'fecha_del'], 'safe'],
            [['dni'], 'string', 'max' => 8],
            [['nombres'], 'string', 'max' => 50],
            [['apellido_paterno', 'apellido_materno'], 'string', 'max' => 200],
            [['sexo', 'ipmaq_reg', 'ipmaq_act', 'ipmaq_del'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_persona' => 'Id Persona',
            'dni' => 'Dni',
            'nombres' => 'Nombres',
            'apellido_paterno' => 'Apellido Paterno',
            'apellido_materno' => 'Apellido Materno',
            'sexo' => 'Sexo',
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
