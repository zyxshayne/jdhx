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
use think\Config;
use think\Db;

class SiteController extends AdminCheckAuth
{
    //网站信息
    public function index()
    {
        $conf = Config::get('webconfig');
        $webConf = [
            'title'        => empty($conf['title']) ? '' : $conf['title'],
            'keywords'     => empty($conf['keywords']) ? '' : $conf['keywords'],
            'desc'         => empty($conf['desc']) ? '' : $conf['desc'],
            'logo'         => empty($conf['logo']) ? '' : $conf['logo'],
            'admin_title'  => empty($conf['admin_title']) ? '' : $conf['admin_title'],
            'icp'          => empty($conf['icp']) ? '' : $conf['icp'],
            'code'         => empty($conf['code']) ? '' : $conf['code'],
            'domain'       => empty($conf['domain']) ? '' : $conf['domain'],
            'port_cache_time' => empty($conf['port_cache_time']) ? '' : $conf['port_cache_time'],
            'email' => empty($conf['email']) ? '' : $conf['email'],
            'email_code' => empty($conf['email_code']) ? '' : $conf['email_code'],
        ];
        return view('',['webConf'=>$webConf]);
    }

    //提交网站信息
    public function edit()
    {
        if($this->request->isPost()){
            $param = vae_get_param();
            $result = $this->validate($param, 'app\admin\validate\Conf.webConf');
            if ($result !== true) {
                return vae_assign(0,$result);
            } else {
                $conf = "<?php return ['admin_title'=>'{$param["admin_title"]}','title'=>'{$param["title"]}','keywords'=>'{$param["keywords"]}','email'=> '{$param["email"]}','email_code' => '{$param["email_code"]}','logo'=>'{$param["logo"]}','desc'=>'{$param["desc"]}','icp'=>'{$param["icp"]}','code'=>'{$param["code"]}','domain'=>'{$param["domain"]}','port_cache_time'=>'{$param["port_cache_time"]}'];";
                file_put_contents(VAE_ROOT . "data/conf/extra/webconfig.php",$conf);
                return vae_assign();
            }
        }
    }

}
