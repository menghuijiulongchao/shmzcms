var basepath = "";
function changeTab(ct) {
	
	if(ct==1) {
		$("#tabmore").attr("href",basepath+"/article-xxgg-1"); 
	}else if(ct==2) {
		$("#tabmore").attr("href",basepath+"/article-zywh-1"); 
	}else if(ct==3) {
		$("#tabmore").attr("href",basepath+"/article-zcwg-1"); 
	}
}

$(function(){
	basepath = $("#basepath").val();
	
	/*卡盘效果*/
	tabChange(".news_con",".news_nav p","currentS");
	tabChange(".ad_conUl li",".ad_conTag li","ad_currentLi");
	/*首页基地活动展示*/
	$(".con_sec_in ul li").click(function(){
			/*换当前项*/
			$(".con_sec_in ul li").removeClass("cur_li");
			$(this).addClass("cur_li");
			/*换内容*/
			var n = $(".con_sec_in ul li").index(this);
			$('.con_sec .acbox .acbox_jh').css('display','none');
			$('.con_sec .acbox .acbox_jh').eq(n).css('display','inline-block');				
		})
	/*首页护照查询切换*/
	$(".acver .acverR .acverQueryBox .acverLabel a").click(function() {
			$(".acver .acverR .acverQueryBox .acverLabel a").removeClass("acverdd");
			$(this).addClass("acverdd");
			
			var n = $(".acver .acverR .acverQueryBox .acverLabel a").index(this);			
			$('.acver .acverR .acverFormBox').css('display','none');
			$('.acver .acverR .acverFormBox').eq(n).css('display','block');
		})
	/*详情页（详情、参与者、赞助者、话题）切换 */
	$(".dConBox .dConBox-L .dConBox-Bottom .dConBox-Btit ul li").click(function() {
			$(".dConBox .dConBox-L .dConBox-Bottom .dConBox-Btit ul li").removeClass("btit_c");
			$(this).addClass("btit_c");
			
			var n = $(".dConBox .dConBox-L .dConBox-Bottom .dConBox-Btit ul li").index(this);			
			$('.dConBox .dConBox-L .dConBox-Bottom .btit_select').removeClass("btit_sl");
			$('.dConBox .dConBox-L .dConBox-Bottom .btit_select').eq(n).addClass("btit_sl");
		})

	//数字处理
		Num_Handle("#center_num_01");
		Num_Handle("#center_num_02");
		Num_Handle("#center_num_03");
	//海报轮播
		swiper();
})

//数字处理
	function Num_Handle(NumValue){
		var numValue=$(NumValue).html().split('');
		var text_html="<ul style='display:table;margin:0 auto;overflow:hidden;'>";
		for(var i=0;i<numValue.length;i++){
			text_html+="<li style='background:#fff;color: #5e96c9;font-size:24px;float:left;width:30px;height:38px;line-height:38px;text-align: center;	margin-left:1px;'>"+numValue[i]+"</li>"
		}
		text_html+="</ul>"
		$(NumValue).html(text_html);
	}
//tab切换效果
function tabChange(tag,tagCon,currentClass){//tag 用于切换的标签，tagCon用于切换的内容，currentClass更换的样式值
		$(tag).hide();
		$(tag).eq(0).show();
		$(tagCon).click(function(){
		/*换当前项*/
		$(tagCon).removeClass(currentClass);
		$(this).addClass(currentClass);
		/*换内容*/
		var n = $(tagCon).index(this);
		$(tag).hide();
		$(tag).eq(n).show();
		})
}
//海报轮播
function swiper() {
	var swiper = new Swiper('.banner', {
		loop: true,
		pagination: '.banner_icon',
		paginationClickable: true,
		autoplay: 5000
	})
}

