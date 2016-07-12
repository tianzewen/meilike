<?php

// comment out the following two lines when deployed to production
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

require(__DIR__ . '/../vendor/autoload.php');
require(__DIR__ . '/../vendor/yiisoft/yii2/Yii.php');

defined('INDEX_PATH') or define('INDEX_PATH', dirname(__FILE__));

$config = require(__DIR__ . '/../config/web.php');

//设置语言
$application = new yii\web\Application($config);
$application->language = isset(\Yii::$app->session['language'])?\Yii::$app->session['language']:'zh-CN';
$application->run();
//(new yii\web\Application($config))->run();
