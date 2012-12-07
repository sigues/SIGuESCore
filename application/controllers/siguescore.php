<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Siguescore extends CI_Controller {

	function index()
	{
                $this->load->library("xmlrpcs");
                $this->load->library("xmlrpc");
		$config['functions']['Greetings'] = array('function' => 'Siguescore.process');
		$config['functions']['getUsuarioByUserPass'] = array('function' => 'Siguescore.getUsuarioByUserPass');
	//	$config['debug'] = true;
                $this->xmlrpcs->initialize($config);
		$this->xmlrpcs->serve();
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

            //var_dump($db);
            //$this->xmlrpcs->serve();
        }

        /*
         * Esta función es para hacer el login de la aplicación en el core, no el login del usuario en la aplicación
         */
        function loginCore($request){
            $parameters = $request->output_parameters();
            $user=$parameters[sizeof($parameters)-2];
            $pass=$parameters[sizeof($parameters)-1];
            
            //echo "$user - $password <br>";
            $usuarioCore = $this->db->get_where("sigues",array("usuario"=>$user,"contrasena"=>$pass))->result();

            if(sizeof($usuarioCore)>0){
                $this->initCore($usuarioCore[0]);
                return $usuarioCore[0];
            }else{
                $this->xmlrpc->send_error_message('100', 'Invalid Access');
            }
            
            
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

        function getUsuarioByUserPass($request){
            
            $appInfo = $this->loginCore($request);
            $this->load->model("usuario");
            $usuarios = $this->usuario->get_all_usuarios();
            $response = convert_to_xmlrpc_values($usuarios);
            return $this->xmlrpc->send_response($response);

        }
        
        
}

function convert_to_xmlrpc_values($obj)
    {
        $return = $obj;
        $type = 'string';
        
        if (is_object($obj)) {
            $return = (array) $obj;
            $type = 'struct';
        } elseif (is_numeric($obj)) {
            $type = 'int';    
        } elseif (is_bool($obj)) {
            $type = 'bool';    
        } elseif (is_array($obj)) {
            $each = array();
            foreach ($obj as $key => $value) {
                if (is_object($value)) {
                    $each[$key] = convert_to_xmlrpc_values($value);
                } else {
                    $each[$key] = $value;    
                }
            }
            $return = $each;
            $type = 'array';
        }
        
        return array($return, $type);
    } 