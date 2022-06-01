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
namespace app\common\model;
use think\Db;
use think\Model;
class NavInfo extends Model
{

    /**
     * 获取所有菜单的树形结构
     * @param $user
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getListAll(){
        $list = DB::name("nav_info")->field(['id','pid','title','src','param','status','order','pid as nid','create_time','update_time','1 as lev'])->order('order','desc')->select();
        return $list = self::getTree($list);
    }
    /**
     * 递归
     * @param $list
     * @param int $nid
     * @return array
     */
    public static function getTree($list,$nid=0){
        $tree = array();
        foreach($list as $k => $v) {
            if($v['pid'] == $nid) {
                if($v['nid'] > 0) $v['lev'] = 2;
                $v['children'] = [];
                $v['children'] = self::getTree($list, $v['id']);
                $tree[] = $v;
            }
        }
        return $tree;
    }
}