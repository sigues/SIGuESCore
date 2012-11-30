<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Siguescore extends CI_Controller {

	function index()
	{
		$config['functions']['Greetings'] = array('function' => 'Siguescore.process');
		$config['functions']['getUsuarioByUserPass'] = array('function' => 'Siguescore.getUsuarioByUserPass');
		$config['debug'] = true;
                $this->xmlrpcs->initialize($config);
		$parameters = $request->output_parameters();
                $user=$parameters[sizeof($parameters)-2];
                $pass=$parameters[sizeof($parameters)-1];
                $appInfo = $this->loginCore($user,$pass);
                if($appInfo != false){
                    $this->initCore($appInfo);
                }else{
                    return false;
                }
	}

        /*
         * Método que inicia el core desde el explorador, solo para pruebas cuando no se usa cliente
         */

        function initWeb(){
            $usuario = $this->uri->segment(3);
            $contrasena = md5($this->uri->segment(4));
            $appInfo = $this->loginCore($usuario,$contrasena);
            if($appInfo != false){
                $this->initCore($appInfo);
                $this->load->model("usuario");
                $usuarios = $this->usuario->get_all_usuarios();
                var_dump($usuarios);
            }else{
                echo "hubo un error al recuperar la información del usuario";
                return false;
            }
        }

        function initCore($appInfo){
            $db['hostname'] = 'localhost';
            $db['username'] = $appInfo->db_usuario;
            $db['password'] = $appInfo->db_contrasena;
            $db['database'] = $appInfo->db_base;
            $db['hostname'] = 'localhost';
            $db['dbdriver'] = 'mysql';
            $db['dbprefix'] = '';
            $db['pconnect'] = TRUE;
            $db['db_debug'] = TRUE;
            $db['cache_on'] = FALSE;
            $db['cachedir'] = '';
            $db['char_set'] = 'utf8';
            $db['dbcollat'] = 'utf8_general_ci';
            $db['swap_pre'] = '';
            $db['autoinit'] = TRUE;
            $db['stricton'] = FALSE;

            $conexion = $this->load->database($db,TRUE);

            
            $CI =& get_instance();
            $CI->app=$conexion;


            global $conexion;
            $conexion = $this->load->database($db,TRUE);
            return $conexion;
            //var_dump($db);
            //$this->xmlrpcs->serve();
        }

        /*
         * Esta función es para hacer el login de la aplicación en el core, no el login del usuario en la aplicación
         */
        function loginCore($user,$password){
            echo "$user - $password <br>";
            $usuarioCore = $this->db->get_where("sigues",array("usuario"=>$user,"contrasena"=>$password))->result();
            return (sizeof($usuarioCore)>0) ? $usuarioCore[0] : false;
        }

	function process($request)
	{
		$parameters = $request->output_parameters();
                
		$response = array(
                                array(
                                    'you_said'  => $parameters['0'],
                                    'i_respond' => 'Not bad at all.',
                                    'user' => $parameters[sizeof($parameters)-2],
                                    'pass' => $parameters[sizeof($parameters)-1]
                                    ),
                                'struct');

		return $this->xmlrpc->send_response($response);
	}

        function getUsuarioByUserPass(){
            $parameters = $request->output_parameters();
            


        }
}

