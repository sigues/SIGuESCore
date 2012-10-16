<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Siguescore extends CI_Controller {

	function index()
	{
		$config['functions']['Greetings'] = array('function' => 'Siguescore.process');
		$this->xmlrpcs->initialize($config);
		$this->xmlrpcs->serve();
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
}

