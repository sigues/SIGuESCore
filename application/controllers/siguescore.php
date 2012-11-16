<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Siguescore extends CI_Controller {

	function index()
	{
		$config['functions']['Greetings'] = array('function' => 'Siguescore.process');
		$config['functions']['getUsuarioByUserPass'] = array('function' => 'Siguescore.getUsuarioByUserPass');
		$this->xmlrpcs->initialize($config);
		$this->xmlrpcs->serve();
                $parameters = $request->output_parameters();
                $user=$parameters[sizeof($parameters)-2];
                $pass=$parameters[sizeof($parameters)-1];
                $appInfo = $this->loginCore($user,$pass);
                if($appInfo != false){
                    $db['siguesapp']['hostname'] = 'localhost';
                    $db['siguesapp']['username'] = $appInfo["db_usuario"];
                    $db['siguesapp']['password'] = $appInfo["db_contrasena"];
                    $db['siguesapp']['database'] = $appInfo["db_base"];
                    $db['siguesapp']['hostname'] = 'localhost';
                    $db['siguesapp']['dbdriver'] = 'mysql';
                    $db['siguesapp']['dbprefix'] = '';
                    $db['siguesapp']['pconnect'] = TRUE;
                    $db['siguesapp']['db_debug'] = TRUE;
                    $db['siguesapp']['cache_on'] = FALSE;
                    $db['siguesapp']['cachedir'] = '';
                    $db['siguesapp']['char_set'] = 'utf8';
                    $db['siguesapp']['dbcollat'] = 'utf8_general_ci';
                    $db['siguesapp']['swap_pre'] = '';
                    $db['siguesapp']['autoinit'] = TRUE;
                    $db['siguesapp']['stricton'] = FALSE;
                    $this->load->database('legacy', true);
                }else{
                    return false;
                }
	}

        /*
         * Esta función es para hacer el login de la aplicación en el core, no el login del usuario en la aplicación
         */
        function loginCore($user,$password){
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

