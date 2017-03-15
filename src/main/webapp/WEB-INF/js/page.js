$(function() {
	$(".page_list").click(function() {
		$(".page_list").removeClass("page_hover");
		$(this).addClass("page_hover");
	});
})
//page 	当前页
//total 	记录总数
//pageSize 每页的记录数
//boxNum   显示的点击盒子数量
//changPageFunc   翻页事件
function showPageStyle2(pageId,page,total,pageSize,boxNum,changePageFunc){
	//1.记录页总数
	var totalPage=Math.ceil(total/pageSize);
	//2.显示中心页号位置
	var position=parseInt(boxNum/2)+(boxNum%2);
	if(boxNum%2==0){
		position+=1;
	}
	//4.点击块起始位置
	var boxStart= (page-position)+1;
	if((boxStart+boxNum)>totalPage){//右越界检查
		boxStart=totalPage-boxNum+1;
	}
	if(boxStart<=0){//左越界检查
		boxStart=1;
	}
	//5.拼接分页
	var content="<div class='page_01 L'>";
	content+="<a class='page_prev firstPage' href='javascript:void(0)'>首页</a>";
	content+="<a class='page_prev prePage' href='javascript:void(0)'>上一页</a>";
	for(var i=boxStart;i<=totalPage && i<(boxStart+boxNum);i++){
		if(i==page){
			content+="<a class='page_list page_hover' href='javascript:void(0)'>"+i+"</a>";
		}else{
			content+="<a class='page_list' href='javascript:void(0)'>"+i+"</a>";
		}
	} 
	content+="<a class='page_next nextPage' href='javascript:void(0)'>下一页</a>";
	content+="<a class='page_next lastPage' href='javascript:void(0)'>尾页</a>";
	content+="</div>";
	
	content+="<div class='page_02 L'>";
	content+="<a href='javascript:void(0)'>共</a>";
	content+="<a href='javascript:void(0)' class='color_yellow'>"+totalPage+"</a>";
	content+="<a href='javascript:void(0)'>页</a>";
	content+="<a href='javascript:void(0)'>跳转到</a>";
	content+="<input type='text' class='page_text'>";
	content+="<a href='javascript:void(0)'>页</a>";
	content+="<a href='javascript:void(0)' class='button_go'>GO</a>"
	content+="</div>";
	$(pageId).html(content);
	//6.事件
	//首页
	$(pageId+" .firstPage").click(function(){
		changePageFunc(1);
	});
	//上一页
	$(pageId+" .prePage").click(function(){
		var page=parseInt($(pageId+" .page_hover").text())-1;
		if(page>0){
			changePageFunc(page);
		}
	});
	//点击框
	$(pageId+" .page_list").click(function(){
		var page=parseInt($(this).text());
		if(page>0){
			changePageFunc(page);
		}
	});
	//下一页
	$(pageId+" .nextPage").click(function(){
		var page=parseInt($(pageId+" .page_hover").text())+1;
		if(page<=totalPage){
			changePageFunc(page);
		}
	});
	//尾页
	$(pageId+" .lastPage").click(function(){
		if(totalPage!=0){
			changePageFunc(totalPage);
		}
	});
	//GO
	$(pageId+" .button_go").click(function(){
		var goPage=$(pageId+" .page_text").val();
		if(!isNaN(goPage)){
			goPage=parseInt(goPage);
			if(goPage>0&&goPage<=totalPage){
				changePageFunc(goPage);
			}
		}
		$(pageId+" .page_text").val("");
	});
}
