


var adokmbgcolor = "#be0707"; //面板颜色
var ogmargintop = 180; //与顶边距离
var InterTime = 1;
var maxWidth = -1;
var minWidth = -140; //默认隐藏宽度
document.writeln("<style type=\"text/css\">");
document.writeln("html{overflow-x:hidden;}");
document.writeln("#adokkfp{font-size:13px;text-align:center;line-height:18px;_margin-right:-1px;z-index:9999}");
document.writeln("#adokkfp .adokobtn{float:left;width:16px;color:#FFF;background:"+adokmbgcolor+";margin:20px 0 0;padding:12px 6px;cursor:pointer;border-radius:5px 0 0 5px}");
document.writeln("#adokkfp .adokbox{float:left;width:130px;border:5px "+adokmbgcolor+" solid;background:#FFF;border-radius:5px}");
document.writeln("#adokkfp ul{list-style:none;width:110px;margin:0;padding:10px}");
document.writeln("#adokkfp li{margin:0;padding-top:8px}");
document.writeln("#adokkfp li img{vertical-align:middle;margin:-2px 4px 0 0;border:0}");
document.writeln("#adokkfp li a{color:#555;text-decoration:none}");
document.writeln("#adokkfp li strong,#adokkfp li a:hover{color:#F03}");
document.writeln("#adokkfp li span{color:#888}");
document.writeln("#adokkfp li.adokline{line-height:18px;text-align:left;margin-top:8px;border-top:1px #DDD solid;padding-left:8px}");
document.writeln("#adokkfp .adoktor{height:22px;line-height:22px;padding:0 6px;clear:both}");
document.writeln("#adokkfp .adoktor a{color:#AAA;font-size:12px;text-decoration:none;outline:none}");
document.writeln("</style>");
document.writeln("<div id=\"adokkfp\" onmouseover=\"toBig()\" onmouseout=\"toSmall()\">");
document.writeln("<div class=\"adokobtn\">在线客服</div>");
document.writeln("<div class=\"adokbox\">");
document.writeln("<ul>");
document.writeln('<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=64882881&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:64882881:45" />售前客服</a></li>');
document.writeln('<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=64882881&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:64882881:45" />售后客服</a></li>');
document.writeln('<li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=64882881&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:64882881:45" />技术支持</a></li>');
/*document.writeln('<li><a href="#" target="_blank"><img border="0" src="#" align="absmiddle" /><span>旺旺客服</span></a></li>');
document.writeln('<li><a href="#" target="_blank"><img border="0" src="#" align="absmiddle" /><span>旺旺客服</span></a></li>');*/
document.writeln('<li class="adokline"><span>客服热线电话：</span><br /><strong>400-600-6688</strong></li>');
document.writeln('<li class="adokline"><span>扫微信二维码：</span><br /><img src="./images/wb2wm.png" width="100" /></li>');
document.writeln('<li class="adokline"><a href="#">&gt;&gt;更多服务支持</a></li>');
document.writeln("</ul>");
document.writeln("<div class=\"adoktor\"><a href=\"javascript:scroll(0,0)\" style=\"float:left\">&uarr;顶部</a><a href=\"javascript:scroll(0,document.body.scrollHeight)\" style=\"float:right\">底部&darr;</a></div>");
document.writeln("</div>");
document.writeln("</div>");
var numInter = 8;
var BigInter;
var SmallInter;
var o = document.getElementById("adokkfp");
var i = parseInt(o.style.right);
function Big() {
    if (parseInt(o.style.right) < maxWidth) {
        i = parseInt(o.style.right);
        i += numInter;
        o.style.right = i + "px";
        if (i == maxWidth) clearInterval(BigInter);
    }
}
function toBig() {
    clearInterval(SmallInter);
    clearInterval(BigInter);
    BigInter = setInterval(Big, InterTime);
}
function Small() {
    if (parseInt(o.style.right) > minWidth) {
        i = parseInt(o.style.right);
        i -= numInter;
        o.style.right = i + "px";
        if (i == minWidth) clearInterval(SmallInter);
    }
}
function toSmall() {
    clearInterval(SmallInter);
    clearInterval(BigInter);
    SmallInter = setInterval(Small, InterTime);
}
adokkfpanel = function(id, _top, _right) {
    var me = id.charAt ? document.getElementById(id) : id,
    d1 = document.body,
    d2 = document.documentElement;
    d1.style.height = d2.style.height = '100%';
    me.style.top = _top ? _top + 'px': 0;
    me.style.right = _right + "px";
    me.style.position = 'absolute';
    setInterval(function() {
        me.style.top = parseInt(me.style.top) + (Math.max(d1.scrollTop, d2.scrollTop) + _top - parseInt(me.style.top)) * 0.1 + 'px';
    },
    10 + parseInt(Math.random() * 20));
    return arguments.callee;
};
window.onload = function() {
    adokkfpanel('adokkfp', ogmargintop, minWidth)
}