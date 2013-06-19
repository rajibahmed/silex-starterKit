<?php

define('ROOT',dirname(__DIR__));
define('DS',DIRECTORY_SEPARATOR);
define('APP_PATH', ROOT.'app');

echo APP_PATH;

require_once(ROOT.DS.'vendor/autoload.php');

$app = require(APP_PATH.DS.'app.php');
$app['debug']= true;
require(ROOT.DS.'config/prod.php');
require(ROOT.DS.'config/assetic.php');
require(APP_PATH.DS.'routes.php');

if($app['debug']){
	$app->run();
}else{
	$app['http_cache']->run();
}
