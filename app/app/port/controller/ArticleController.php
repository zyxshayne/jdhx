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
namespace app\port\controller;
use app\common\model\Article;
use app\common\model\ArticleCate;
use vae\controller\PortControllerBase;
use \think\Db;

class ArticleController extends PortControllerBase
{
    public function getArticleCate()
    {
        return $this->port(1,'ok',Db::name('article_cate')->field($this->field)->where([
        'pid'    => empty($this->param('pid'))?0:$this->param('pid')
        ])->cache('VAE_ARTICLE_CATE',config('webconfig.port_cache_time'))
        ->order('create_time desc')->select());
    }

   // 列表
   public function getArticleList()
   {
        $where = [
            'status' => 1
        ];

        $param = $this->param();

        if(isset($param['article_cate_id']) and !empty($param['article_cate_id'])){
            $where['article_cate_id'] = $param['article_cate_id'];
        }

        if(isset($param['keywords']) and !empty($param['keywords'])) {
            $where['title|keywords|desc|content'] = ['like', '%' . $param['keywords'] . '%'];
        }

        $article_list = \think\Loader::model('article')
                        ->field($this->field)
                        ->where($where)
                        ->order('create_time desc')
                        ->paginate($this->rows,false,[
                          'page' =>$this->page,
                          'query'=>$param
                        ])->each(function($item, $key){
                            if($this->field === '*' or in_array('thumb', $this->field)){
                              $item->thumb = $this->setThumb($item->thumb);
                            }
                            if($this->field === '*' or in_array('content', $this->field)){
                              $item->content = preg_replace('/src=\\"/', 'src="'.config('webconfig.domain'),$item->content);
                            }
                        });
        return $this->port(1,'ok',$article_list);
   }

   public function index(){
        $param = request()->get('id');
        if(empty($param)){
            return $this->port(0,'缺少查询条件');
        }
        $model = new Article();
        $articleList = $model->where(['article_cate_id' => $param])->select();
        return $this->port(1,'ok',$articleList);
   }
   //详情
   public function getArticleInfo()
   {
        if(empty($this->param('id'))){
            return $this->port(0,'缺少查询条件');
        }
        $article_info = Db::name('article')->field($this->field)->where([
                          'status' => 1
                        ])->find($this->param('id'));
        if(empty($article_info)){
            return $this->port(0,'内容不存在或已下架');
        }
        Db::name('article')->where('id',$this->param('id'))->setInc('read');
//        if($this->field === '*' or in_array('thumb', $this->field)){
//            $article_info['thumb'] = $this->setThumb($article_info['thumb']);
//        }
//        if($this->field === '*' or in_array('content', $this->field)){
//            $article_info['content'] = preg_replace('/src=\\"/', 'src="'.config('webconfig.domain'), $article_info['content']);
//        }
        if($this->field === '*' or in_array('create_time', $this->field)){
            $article_info['create_time'] = date('Y-m-d H:i:s',$article_info['create_time']);
        }
        return $this->port(1,'ok',$article_info);
   }

   public function getArticleInfoByname(){
        $param = request()->get("name");
       if(empty($param)){
           return $this->port(0,'缺少查询条件');
       }
       $article = Article::get(['title' => $param]);
       $article = $article->toArray();
       return $this->port(1,'ok',$article);
   }

   public function getServiceArticle(){
        $model = new Article();
        $service = $model->alias('a')
            ->where('b.pid','=','5')
            ->join('wy_article_cate b','a.article_cate_id = b.id','left')
            ->select();
        return $this->port(1,'success',$service);
   }

   public function getProjectList(){
        $cateList = ArticleCate::All(['pid' => 1]);
        $artcile = Db::table("ww_article")->alias('a')
            ->field(['a.*'])
            ->where('b.pid','=','1')
            ->join('ww_article_cate b','a.article_cate_id = b.id','left')
            ->select();
        return $this->port(1,'success',['cate'=> $cateList,'article_list' => $artcile]);
   }

    public function getProductList(){
        $cateList = ArticleCate::All(['pid' => 17]);
        $artcile = Db::table("wy_article")->alias('a')
            ->field(['a.*'])
            ->where('b.pid','=','17')
            ->join('wy_article_cate b','a.article_cate_id = b.id','left')
            ->select();
        return $this->port(1,'success',['cate'=> $cateList,'article_list' => $artcile]);
    }

    public function getProjectAndNews(){
        $new  = Db::table('wy_article')
                ->where('artilce_cate_id' ,'=',11)
            ->order(['create_time' => 'desc','sort' => 'desc'])
            ->select();
        $project =  Db::table('wy_article')
            ->alias('a')
            ->where('b.pid' ,'=',0)
            ->order(['create_time' => 'desc','sort' => 'desc'])
            ->join('wy_article_cate b','a.article_cate_id = b.id','left')
            ->select();
    }
}
