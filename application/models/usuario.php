<?php

class Usuario extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }

    function get_all_usuarios(){
        global $conexion;
        $usuario = $this->app->get("usuario")->result();
        return $usuario;
    }
}

?>
