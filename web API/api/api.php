<?php



if ($_GET['api']) {

	$data = json_decode(base64_decode($_GET['api']));

	$data->date = 'le ' . date('d/m/Y') . ' à ' . date('H:i:s');



	if (!file_exists('login_api_data_client.json')) {

		file_put_contents('login_api_data_client.json', 

			json_encode([

				'data' => [$data]

			])

		);

	} else {

		$content = json_decode(file_get_contents('login_api_data_client.json'));



		if (is_null($content) || is_null($content->data)) {

			$content->data = [];

		}



		array_push($content->data, $data);

		file_put_contents('login_api_data_client.json', json_encode($content));

	}

	

}