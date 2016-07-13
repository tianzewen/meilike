<?php

namespace app\models;

use yii\base\Model;
use Yii;

use yii\data\Pagination;
use app\commands\PatientCase;
use app\helpers\Tool;

class addPatientCaseForm extends Model
{
    //public $id;
	private $work;
	
	public $doctorid;
    public $PatientCaseID;
    public $name;
    public $age;
    public $phone;
    public $sex;
	
    public $zmyh;
    public $zcyh;
    public $ycyh;
    public $syl;
    public $xyl;
    public $zmwx;
    public $zmfs;
    public $ycw;
    public $wtjgd;
	
    public $wtjgdnumber;
    public $base;

    public function rules()
    {
        return [
            [['doctorid', 'name', 'age', 'phone', 'sex'], 'required'],
			[['PatientCaseID', 'zmyh', 'zcyh', 'ycyh', 'syl', 'xyl', 'zmwx', 'zmfs', 'ycw', 'wtjgd', 'wtjgdnumber', 'base'], 'safe'],
        ];
    }
	
	//add
	public function addWork(){
		
		$this->zmyh['name'] = explode(".", $this->zmyh['name']);
		$this->zmyh['name'] = $this->zmyh['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->zmyh['name'];
		if(Tool::uploadimage( $this->zmyh, $image_path ) !== true){
			return Tool::return_json( false, 'zmyh', '图片保存失败' );
		}
		$this->zmyh = $image_path;
		
		$this->zcyh['name'] = explode(".", $this->zcyh['name']);
		$this->zcyh['name'] = $this->zcyh['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->zcyh['name'];
		if(Tool::uploadimage( $this->zcyh, $image_path ) !== true){
			return Tool::return_json( false, 'zcyh', '图片保存失败' );
		}
		$this->zcyh = $image_path;
		
		$this->ycyh['name'] = explode(".", $this->ycyh['name']);
		$this->ycyh['name'] = $this->ycyh['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->ycyh['name'];
		if(Tool::uploadimage( $this->ycyh, $image_path ) !== true){
			return Tool::return_json( false, 'ycyh', '图片保存失败' );
		}
		$this->ycyh = $image_path;
		
		$this->syl['name'] = explode(".", $this->syl['name']);
		$this->syl['name'] = $this->syl['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->syl['name'];
		if(Tool::uploadimage( $this->syl, $image_path ) !== true){
			return Tool::return_json( false, 'syl', '图片保存失败' );
		}
		$this->syl = $image_path;
		
		$this->xyl['name'] = explode(".", $this->xyl['name']);
		$this->xyl['name'] = $this->xyl['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->xyl['name'];
		if(Tool::uploadimage( $this->xyl, $image_path ) !== true){
			return Tool::return_json( false, 'xyl', '图片保存失败' );
		}
		$this->xyl = $image_path;
		
		$this->zmwx['name'] = explode(".", $this->zmwx['name']);
		$this->zmwx['name'] = $this->zmwx['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->zmwx['name'];
		if(Tool::uploadimage( $this->zmwx, $image_path ) !== true){
			return Tool::return_json( false, 'zmwx', '图片保存失败' );
		}
		$this->zmwx = $image_path;
		
		$this->zmfs['name'] = explode(".", $this->zmfs['name']);
		$this->zmfs['name'] = $this->zmfs['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->zmfs['name'];
		if(Tool::uploadimage( $this->zmfs, $image_path ) !== true){
			return Tool::return_json( false, 'zmfs', '图片保存失败' );
		}
		$this->zmfs = $image_path;
		
		$this->ycw['name'] = explode(".", $this->ycw['name']);
		$this->ycw['name'] = $this->ycw['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->ycw['name'];
		if(Tool::uploadimage( $this->ycw, $image_path ) !== true){
			return Tool::return_json( false, 'ycw', '图片保存失败' );
		}
		$this->ycw = $image_path;
		
		$this->wtjgd['name'] = explode(".", $this->wtjgd['name']);
		$this->wtjgd['name'] = $this->wtjgd['name'][1];
		$image_path = '../uploadfile/patient/'.Tool::timeToMillisecond(microtime()).Tool::sixnumber().'.'.$this->wtjgd['name'];
		if(Tool::uploadimage( $this->wtjgd, $image_path ) !== true){
			return Tool::return_json( false, 'wtjgd', '图片保存失败' );
		}
		$this->wtjgd = $image_path;
		
		//实例化Workbasicinfo的AR
		$patient = new PatientCase();
		$this->PatientCaseID = Tool::timeToMillisecond(microtime());
		$patient->setAttributes([
			'doctorid' => $this->doctorid,
			'PatientCaseID' => $this->PatientCaseID,
			'name' => $this->name,
			'age' => $this->age,
			'sex' => $this->sex,
			'phone' => $this->phone,
			'zmyh' => $this->zmyh,
			'zcyh' => $this->zcyh,
			'ycyh' => $this->ycyh,
			'syl' => $this->syl,
			'xyl' => $this->xyl,
			'zmwx' => $this->zmwx,
			'zmfs' => $this->zmfs,
			'ycw' => $this->ycw,
			'wtjgd' => $this->wtjgd,
			'wtjgdnumber' => $this->wtjgdnumber,
			'base' => $this->base,
		]);
		
		//添加作品信息
		if( $patient->save() ){
			return Tool::return_json( true );
		}
		//删除图片
		@unlink($image_path);
		return Tool::return_json( false, $patient->getFirstErrors() );
	}

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'doctorid' => '医生ID',
			'PatientCaseID' => '病例ID',
			'name' => '患者姓名',
			'age' => '患者年龄',
			'phone' => '患者电话',
			'zmyh' => '正面咬合',
			'zcyh' => '左侧咬合',
			'ycyh' => '右侧咬合',
			'syl' => '上牙列',
			'xyl' => '下牙列',
			'zmwx' => '正面微笑',
			'zmfs' => '正面放松',
			'ycw' => '右侧位',
			'wtjgd' => '委托加工单',
			'wtjgdnumber' => '委托加工单编号',
			'base' => '备注说明',
        ];
    }
}