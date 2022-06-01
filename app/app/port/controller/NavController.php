<?php
namespace app\port\controller;
use app\common\model\NavInfo;
use think\Controller;
use vae\controller\PortControllerBase;
use \think\Db;

class NavController extends PortControllerBase{

    //返回导航栏
    public function index(){
        $model = new NavInfo();
        $navList = $model->order("order",'desc')->select();
        return  $this->port(1,"success",$navList);
    }
}