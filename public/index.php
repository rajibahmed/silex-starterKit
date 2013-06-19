<?php

define('ROOT',dirname(__DIR__));
define('DS',DIRECTORY_SEPARATOR);
define('APP_PATH', ROOT.DS.'app');
define('PUBLIC_PATH', ROOT.DS.'public');

require_once(ROOT.DS.'vendor/autoload.php');


$app = require_once(APP_PATH.DS.'app.php');

$app->get('/', function() use ($app){
	$app->log('test');
	return 'test';
});
$app->run();
