<?php

namespace app\commands;

use yii\db\ActiveRecord;

class PatientCase extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'patientcase';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['doctorid', 'name', 'age', 'phone', 'sex'], 'required'],
			[['PatientCaseID', 'zmyh', 'zcyh', 'ycyh', 'syl', 'xyl', 'zmwx', 'zmfs', 'ycw', 'wtjgd', 'wtjgdnumber', 'base'], 'safe'],
        ];
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