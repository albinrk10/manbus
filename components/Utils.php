<?php

namespace app\components;

class Utils {

    const ACTIVO = 1;
    const INACTIVO = 0;
    const ESTADO_SOLICITADO = "SOLICITADO";
    const ESTADO_DERIVADO = "DERIVADO";
    const ESTADO_ATENDIDO = "ATENDIDO";
    const ESTADO_FINALIZADO = "FINALIZADO";
    const ESTADO_PROGRAMADO = "PROGRAMADO";
    const PRIORIDAD_ALTA = "ALTA";
    const PRIORIDAD_MEDIA = "MEDIA";
    const PREORIDAD_BAJA = "BAJA";

    public static function encodeUrlTripleDes($string) {
        return str_replace(" ", "+", $string);
    }

    public static function show($data, $detenerProcesos = false, $titulo = 'Datos') {
        echo "<code class='code'><b>{$titulo} :</b></code>";
        echo "<pre>";
        print_r($data);
        echo '</pre>';
        if ($detenerProcesos) {
            die();
        }
    }

    /**
     * Funcion que encripta un valor para ser usado como token.
     * @param string $valor valor a ser encriptado
     * @return string valor encriptado
     */
    public static function token($valor) {
        return sha1(TripleDes::Encrypt($valor));
    }

    public static function validarToken($token, $valor) {
        if ($token === self::token($valor)) {
            return true;
        }
        return false;
    }

    public static function getFechaActual() {
        return date('Y-m-d H:i:s');
    }

    public static function obtenerIP() {
        if (isset($_SERVER["HTTP_CLIENT_IP"])) {
            return $_SERVER["HTTP_CLIENT_IP"];
        } elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
            return $_SERVER["HTTP_X_FORWARDED_FOR"];
        } elseif (isset($_SERVER["HTTP_X_FORWARDED"])) {
            return $_SERVER["HTTP_X_FORWARDED"];
        } elseif (isset($_SERVER["HTTP_FORWARDED_FOR"])) {
            return $_SERVER["HTTP_FORWARDED_FOR"];
        } elseif (isset($_SERVER["HTTP_FORWARDED"])) {
            return $_SERVER["HTTP_FORWARDED"];
        } elseif (isset($_SERVER["REMOTE_ADDR"])) {
            return $_SERVER["REMOTE_ADDR"];
        } else {
            return "000.000.000.000";
        }
    }

}
