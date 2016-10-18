$(function() {
	
	/*卡盘效果*/
	tabChange(".news_con", ".news_nav p", "currentS");
	tabChange(".ad_conUl li", ".ad_conTag li", "ad_currentLi");

	$(".con_sec_in ul li").click(function() {
		/*换当前项*/
		$(".con_sec_in ul li").removeClass("cur_li");
		$(this).addClass("cur_li");
		/*换内容*/
		var n = $(".con_sec_in ul li").index(this);
		$('.con_sec .acbox .Activity').css('display', 'none');
		$('.con_sec .acbox .Activity').eq(n).css('display', 'inline-block');
	})
	$(".acver .acverR .acverQueryBox .acverLabel a").click(function() {
		$(".acver .acverR .acverQueryBox .acverLabel a").removeClass("acverdd");
		$(this).addClass("acverdd");

		var n = $(".acver .acverR .acverQueryBox .acverLabel a").index(this);
		$('.acver .acverR .acverFormBox').css('display', 'none');
		$('.acver .acverR .acverFormBox').eq(n).css('display', 'block');
	})

	//数字处理
	Num_Handle("#center_num_01");
	Num_Handle("#center_num_02");
	Num_Handle("#center_num_03");
	//海报轮播
	swiper();

	
})

//数字处理
function Num_Handle(NumValue) {
	var numValue = $(NumValue).html().split('');
	var text_html = "<ul style='display:table;margin:0 auto;overflow:hidden;'>";
	for(var i = 0; i < numValue.length; i++) {
		text_html += "<li style='background:#fff;color: #5e96c9;font-size:24px;float:left;width:30px;height:38px;line-height:38px;text-align: center;	margin-left:1px;'>" + numValue[i] + "</li>"
	}
	text_html += "</ul>"
	$(NumValue).html(text_html);
}

//tab切换效果
function tabChange(tag, tagCon, currentClass) { //tag 用于切换的标签，tagCon用于切换的内容，currentClass更换的样式值
	$(tag).hide();
	$(tag).eq(0).show();
	$(tagCon).click(function() {
		/*换当前项*/
		$(tagCon).removeClass(currentClass);
		$(this).addClass(currentClass);
		/*换内容*/
		var n = $(tagCon).index(this);
		$(tag).hide();
		$(tag).eq(n).show();
	})
}
function swiper() {
		var swiper = new Swiper('.banner', {
			loop: true,
			pagination: '.banner_icon',
			paginationClickable: true,
			autoplay: 5000
		})
	}