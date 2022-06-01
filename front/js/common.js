$('.header-nav').load("./nav.html")
$('.footerpage').load("./footer.html")
$(function () {
    $.ajax({
        url: confg.site+"port/nav/index",
        type: 'get',
        dataType: 'json',
        async: false,
        success: function (res) {
            if (res.code === 1) {
                //执行渲染banner
                // ShowBanner(res.data.banner)
                ShowNav(res.data)
            }
        }
    })
})
function  ShowNav(data){
    for (i=0;i<data.length;i++){

        if(data[i].children.length!=0){
            var str = '<li ><a href="'+data[i].src+'">'+data[i].title+'</a><ul class="dropdown animated-3s fadeIn">'
            for(j=0;j<data[i].children.length;j++){
                str += '<li><a href="'+data[i].children[j].src+'">'+data[i].children[j].title+'</a></li>'
            }
            str += '</ul></li>'
            $('.ownmenu').append(str)
        }else{
            $('.ownmenu').append('<li><a href="'+data[i].src+'">'+data[i].title+'</a></li>')
        }
    }
}

function getUrlParams(key) {
    var url = window.location.search.substr(1);
    if (url == '') {
        return false;
    }
    var paramsArr = url.split('&');
    for (var i = 0; i < paramsArr.length; i++) {
        var combina = paramsArr[i].split("=");
        if (combina[0] == key) {
            return combina[1];
        }
    }
    return false;
}