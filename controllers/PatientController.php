<?phpnamespace app\controllers;use Yii;use app\models\addPatientCaseForm;//use app\models\UserbasicinfoSearch;use yii\web\Controller;use yii\web\NotFoundHttpException;use yii\filters\VerbFilter;use app\helpers\Tool;class PatientController extends Controller{	//添加作品	public function actionAddpatient(){		$model = new addPatientCaseForm;				$session = Yii::$app->session;				$post = Yii::$app->request->post();				// if( empty($session['user'])|| $session['user']['id'] != $post['addPatientCaseForm']['id'] )		// {			// return Tool::return_json( false, 'makerid', '登录过期，请重新登录后发布' );		// }		if( empty($_FILES['zmyh']['name'])		|| empty($_FILES['zcyh']['name'])		|| empty($_FILES['ycyh']['name'])		|| empty($_FILES['syl']['name'])		|| empty($_FILES['xyl']['name'])		|| empty($_FILES['zmwx']['name'])		|| empty($_FILES['zmfs']['name'])		|| empty($_FILES['ycw']['name'])		|| empty($_FILES['wtjgd']['name'])){			return Tool::return_json( false, 'image', '图片不全' );		}		if ($model->load($post) && $model->validate()) {			$model->zmyh = $_FILES['zmyh'];			$model->zcyh = $_FILES['zcyh'];			$model->ycyh = $_FILES['ycyh'];			$model->syl = $_FILES['syl'];			$model->xyl = $_FILES['xyl'];			$model->zmwx = $_FILES['zmwx'];			$model->zmfs = $_FILES['zmfs'];			$model->ycw = $_FILES['ycw'];			$model->wtjgd = $_FILES['wtjgd'];			return $model->addwork();		} else {			//回馈到ajax的错误数组			return Tool::return_json( false, $model->getFirstErrors() );        }	}}