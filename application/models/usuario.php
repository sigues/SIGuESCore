<?php

class Usuario extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }

    function get_all_usuarios(){
        $usuario = $this->app->get("usuario")->result();
        return $usuario;
    }

    function getUsuarioByUserPass($user,$password){
        $usuario = $this->app->get_where("usuario",array("usuario"=>$user,"contrasena"=>md5($password)))->result();
        return $usuario;
    }
}

?>
