$(function() {
	//返回加样式
	$(".checkresult").click(function(e){
        var temp=$(".checkresult").filter(":checked").val();
        if(temp=='需返工'){
        	$("#storageid1").css("display","inline-block");
        	$("#storageid2").css("display","none");
        }else if(temp=='产品作废'){
        	$("#storageid1").css("display","none");
        	$("#storageid2").css("display","inline-block");
        }else{
        	$("#storageid1").css("display","none");
        	$("#storageid2").css("display","none");
        }
	});
	//默认勾选状态
	defaultStyle();
	function defaultStyle(){
		//默认被选中
		$("input[name=checkgoal]").eq(0).attr("checked","checked");
		$("input[name=checkresult]").eq(0).attr("checked","checked");
	}
	//质检细节  checkinfo-list
	checkInfoList();
	function checkInfoList(){
		var id=$("#id").val();
		var checkInfoUrl="/factory/chistory.json";
		$.ajax({
			url : checkInfoUrl,
			data : {// 左面是数据名称-键，右面是值
				id:id
			},
			type : 'POST',
			success : function(result) {//{"k"，"v"，"k"，"v"}
				var chistoryTemp="";
				if(result.ret){
					$.each(result.data, function(i,chistory) {//java-增强for
						chistoryTemp+="<p>质检时间:<span class='info-value2'>"+new Date(chistory.chistoryTime).Format("yyyy-MM-dd")+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产环节:<span class='info-value2'>"+chistory.chistoryStep+
						"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检指标:<span class='info-value2'>"+chistory.chistoryGoal+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检结果+备注:<span class='info-value2'>"+chistory.chistoryResult+" : "+chistory.chistoryRemark+"</span></p>";
					});
					$("#checkListInfo").html(chistoryTemp);
				}
			}
		});
	}
	btnStyle();
	//状态为待派工时样式
	function btnStyle(){
		var status=$("#factoryProstatus").attr("data");
		if(status=='待质检'){
			$(".btn-check").css("display","inline-block");
		}else{
			$(".btn-check").css("display","none");
		}
	}
	
});