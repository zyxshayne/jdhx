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
use app\common\model\Company;
use app\common\model\Nav;
use app\common\model\Slide;
use app\common\model\SlideInfo;
use app\common\model\User;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use vae\controller\PortControllerBase;
use think\Config;
use think\Db;
class IndexController extends PortControllerBase
{
   public function index()
   {
       //查询轮播图
       $model= new SlideInfo();
       $banner = $model->select();
       //查询服务范围
       $cateModel  = new ArticleCate();
       $service = $cateModel->field(['title','desc','id'])->where("pid","in",function ($query){
           $query->table("wy_article_cate")->where("title","服务范畴")->field('id');
       })->select();
       $aboutus = Article::get(['title' => "关于我们"]);
       $product =  Db::table('wy_article')
           ->alias('a')
           ->field(['a.*'])
           ->where('b.pid' ,'=',17)
           ->order(['a.create_time' => 'desc'])
           ->join('wy_article_cate b','a.article_cate_id = b.id','left')
           ->limit(6)
           ->select();
       $project =  Db::table('wy_article')
           ->alias('a')
           ->field(['a.*'])
           ->where('b.pid' ,'=',2)
           ->order(['a.create_time' => 'desc'])
           ->join('wy_article_cate b','a.article_cate_id = b.id','left')
           ->limit(4)
           ->select();

       return  $this->port(
           1,"success",['banner' => $banner,"service" => $service,'about' => $aboutus,'product'=>$product,'project' => $project,]
       );
   }
   //返回轮播图
   public function banner(){
       $model= new SlideInfo();
       $banner = $model->select();
       return  $this->port(
           1,"success",$banner
       );
   }

   //获取公司信息与站点信息
    public function siteAndCompany(){
       $company = Company::get(['id' => 1]);
       $site = Config::get('webconfig');
        $news = Db::table('wy_article')
            ->alias('a')
            ->field(['a.*'])
            ->where('article_cate_id' ,'in',[11,12])
            ->order(['a.create_time' => 'desc'])
            ->limit(4)
            ->select();
       return $this->port(1,'success',['site' => $site,'company' => $company,'news' => $news]);
    }


    public function sendMail(){
       $param = request()->param();
        $mail = new PHPMailer(true);
        try {
            $conf = Config::get('webconfig');
            $mail->isSMTP();
            $mail->CharSet = "utf8";
            $mail->Host = 'smtp.163.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth = true;                                   //Enable SMTP authentication
            $mail->Username = $conf['email'];                     //SMTP username
            $mail->Password = $conf['email_code'];                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port = 994;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
            //Recipients
            $mail->setFrom($param['email'], $param['name']);
            $mail->addAddress($conf['email'], "顾客联系");     //Add a recipient
            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = "顾客联系";
            $mail->Body = $param['message'];
            $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
            $mail->send();
            $this->port(1,'success');
        } catch (Exception $e) {
            $this->port(0,$e->getMessage());
//            file_put_contents('/usr/local/src/test.txt',$e->getMessage()."\n",FILE_APPEND);
        }
    }
}
