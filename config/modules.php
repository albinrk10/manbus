<?php

return [
    'gii' => [
        'class' => 'yii\gii\Module',
        'allowedIPs' => ['127.0.0.1', '::1'],
    ],
    'rbac' => [
        'class' => 'johnitvn\rbacplus\Module',
        'as access' => [
            'class' => 'yii\filters\AccessControl',
            'rules' => [
                [
                    'allow' => true,
                    'roles' => ['admin'],
                ],
            ],
        ],
    ],
    'main' => [
        'class' => 'app\modules\main\Main',
    ],
    'login' => [
        'class' => 'app\modules\login\LoginModule',
    ],
    'persona' => [
        'class' => 'app\modules\persona\Persona',
    ],
    'seguridad' => [
        'class' => 'app\modules\seguridad\Seguridad',
    ],
    'producto' => [
        'class' => 'app\modules\producto\Producto',
    ],
    'taller' => [
        'class' => 'app\modules\taller\Taller',
    ],
    'almacen' => [
        'class' => 'app\modules\almacen\Almacen',
    ],
    'vehiculo' => [
        'class' => 'app\modules\vehiculo\Vehiculo',
    ],
];
