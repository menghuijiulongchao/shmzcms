
$(function(){
	/*图片轮播*/
		var len=$(".b_img").length;
		$(".b_img").hide();
		$(".b_img").eq(0).show();
		var x=0;
		$(".banner_icon a").eq(0).addClass("icon_active");
		$(".banner_icon a").mouseover(function(){
			 x = $(".banner_icon a").index($(this));
			$(".b_img").hide();
			$(".b_img").eq(x).show();
			$(".banner_icon a").removeClass("icon_active");
			$(this).addClass("icon_active");
			})
		$(".banner_icon a").mouseout(function(){
			$(".banner_icon a").removeClass("icon_active");
			$(this).addClass("icon_active");
		})
			
		function change(){
			if(x>len-2){x=0;}
			else{x++;}
		$(".b_img").hide();
		$(".b_img").eq(x).show();
		$(".banner_icon a").removeClass("icon_active");
		$(".banner_icon a").eq(x).addClass("icon_active");
		}
		var time=setInterval (change,1500);
		$(".banner").hover(function(){
				clearInterval(time);
			},function(){
				 time=setInterval(change,1500);
			})
	/*图片轮播*/
	/*卡盘效果*/
	tabChange(".news_con",".news_nav p","currentS");
	/*首页基地活动展示*/
	$(".con_sec_in ul li:not(':last')").click(function(){
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
	/*内容页专家评语、项目进度、支出记录的详情页面
	 * 专家评语、项目进度、支出记录的切换*/
		var str = window.location.search;
		var aa = str.indexOf("?")
		index = str.substring(aa+1,aa+2);
		if (index!="" && index == 0 || index == 1 || index == 2) {
			$(".project .projectBottom .proDataLabel ul li").removeClass("onhere");
	 		$('.proNav0'+index).addClass("onhere");
	 		$('.project .projectBottom .pro_select').hide();
			$('.project .projectBottom .pro_select').eq(index).show();				
		}			
		$(".project .projectBottom .proDataLabel ul li").click(function() {
				$(".project .projectBottom .proDataLabel ul li").removeClass("onhere");
				$(this).addClass("onhere");
				
				var n = $(".project .projectBottom .proDataLabel ul li").index(this);
				$('.project .projectBottom .pro_select').hide();
				$('.project .projectBottom .pro_select').eq(n).show();
			})		

	//数字处理
		Num_Handle("#center_num_01");
		Num_Handle("#center_num_02");
		Num_Handle("#center_num_03");
		
})

//数字处理
	function Num_Handle(NumValue){
		var numValue=$(NumValue).html().split('');
		var text_html="<ul style='display:table;margin:0 auto;overflow:hidden;'>";
		for(var i=0;i<numValue.length;i++){
			text_html+="<li style='background:#fff;color: #5e96c9;font-size:18px;float:left;width:20px;height:28px;line-height:28px;text-align: center;	margin-left:1px;'>"+numValue[i]+"</li>"
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
