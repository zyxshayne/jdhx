<?php
// +----------------------------------------------------------------------
// | vaeThink [ Programming makes me happy ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://www.vaeThink.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
// +---------------------------------------------------------------------
namespace app\admin\controller;
use app\common\model\Company;
use think\Request;
use vae\controller\AdminCheckAuth;
use think\Db;

class CompanyController extends AdminCheckAuth
{
    public function index()
    {
        $data = Company::get(['id' => 1]);
        $company = [
            'name'        => empty($data['name']) ? '' : $data['name'],
            'address'        => empty($data['address']) ? '' : $data['address'],
            'postcode'        => empty($data['postcode']) ? '' : $data['postcode'],
            'contact'        => empty($data['contact']) ? '' : $data['contact'],
            'mobile'        => empty($data['mobile']) ? '' : $data['mobile'],
            'tel'        => empty($data['tel']) ? '' : $data['tel'],
            'fax'        => empty($data['fax']) ? '' : $data['fax'],
            'email'        => empty($data['email']) ? '' : $data['email'],
            'qq'        => empty($data['qq']) ? '' : $data['qq'],
            'weixin'        => empty($data['weixin']) ? '' : $data['weixin'],
            'blicense'        => empty($data['blicense']) ? '' : $data['blicense'],

        ];
        return view('',['company'=>$company]);
    }

    public function edit(){
        $param = $this->request->post();
        if(!empty($param)){
            $record = Company::get(['id' => 1]);
            $record->allowField(true)->save($param);
            return vae_assign(1,'提交成功');
        }
        return vae_assign(0,'请完善信息');
    }

}
