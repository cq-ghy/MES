$(function() {
	//////////////////////////////////////////////////
	//控制提交按钮
	var prostatus=$("#factoryProstatus").attr("data");
	if(prostatus=='待派工'){
		$(".btn-end").hide();
		$(".btn-start").show();
	}else if(prostatus=='派工中'){
		$(".btn-end").show();
		$(".btn-start").hide();
	}else{
		$(".btn-end").hide();
		$(".btn-start").hide();
	}
	//////////////////////////////////////////////////
	var id=$("#id").val();
	var fhistorysUrl="/factory/fhistorys.json";
	fhistorysInfo();//调用
	function fhistorysInfo(){
		$.ajax({
			url : fhistorysUrl,
			data : {// 左面是数据名称-键，右面是值
				id:id
			},
			type : 'POST',
			success : function(result) {//{"k"，"v"，"k"，"v"}
				var fhistoryTemp="";
				if(result.ret){
					$.each(result.data, function(i,fhistory) {//java-增强for
						var startTime=fhistory.fhistoryStarttime==null?"":new Date(fhistory.fhistoryStarttime).Format("yyyy-MM-dd");
						var endTime=fhistory.fhistoryEndtime==null?"":new Date(fhistory.fhistoryEndtime).Format("yyyy-MM-dd");
						if(fhistory.fhistoryStep=='工序结束'){
							fhistoryTemp+="<p>结束时间:<span class='info-value2'>"+startTime+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前状态:<span class='info-value2'>生产结束</span>";
						}else{
							fhistoryTemp+="<p>开始时间:<span class='info-value2'>"+startTime+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间:<span class='info-value2'>"+endTime+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;派工环节:<span class='info-value2'>"+fhistory.fhistoryStep+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产备注:<span class='info-value2'>"+fhistory.fhistoryRemark+"</span></p>";
						}
					});
					$("#stepListInfo").html(fhistoryTemp);
				}
			}
		});
	}
	//////////////////////////////////////////////////
	//这里预留当前工序
	var currentStep=$("#currentStep").attr("data");
	url="/step/stepall.json";
	//用户点击radio体验升级
	$("label").click(function(e){
		//阻止默认事件
        e.preventDefault();
		//阻止事件传播
        e.stopPropagation();
        $(this).children("input").attr("checked","checked");
	});
	//stepsInfo();
	
	function stepsInfo(){
		//显示生产工序步骤列表
		$.ajax({
			url : url,
			data : {// 左面是数据名称-键，右面是值
				currentStep:currentStep
			},
			type : 'POST',
			success : function(result) {//{"k"，"v"，"k"，"v"}
				var stepTemp="选择生产环节:&nbsp;";
				if(result.ret){
					
					$.each(result.data, function(i, step) {//java-增强for
						if(currentStep==null||currentStep==""){
							if(i==0){
								stepTemp+="<label style='margin-right:8px;'><input type='radio' checked='checked' name='step' value='"+step.stepName+"'/>"+step.stepName+"</label>";
							}else{
								stepTemp+="<label style='margin-right:8px;'><input type='radio' name='step' value='"+step.stepName+"'/>"+step.stepName+"</label>";
							}
						}else{
							if(currentStep==step.stepName){
								stepTemp+="<label style='margin-right:8px;'><input type='radio' checked='checked' name='step' value='"+step.stepName+"'/>"+step.stepName+"</label>";
							}else{
								stepTemp+="<label style='margin-right:8px;'><input type='radio' name='step' value='"+step.stepName+"'/>"+step.stepName+"</label>";
							}
						}
					});
					if(currentStep=='工序结束'){
						stepTemp+="<label><input class='endstep' type='radio' checked='checked' name='step' value='工序结束'/>工序结束</label>";
					}else{
						stepTemp+="<label><input class='endstep' type='radio' name='step' value='工序结束'/>工序结束</label>";
					}
	//				if(currentStep==null||currentStep==""){
	//					//TODO
	//				}
					//在工序结束后面添加流转库房信息
					stepTemp+="&nbsp;&nbsp;&nbsp;<select id='outstorageid' name='outstorageid' >";
					stepTemp+="<option value='2'>半成品库</option>";
					stepTemp+="<option value='3'>成品库</option>";
					stepTemp+="<option value='4'>废料库</option>";
					stepTemp+="<option value='1'>原料库</option></select>";
					$("#stepList").html(stepTemp);
					
				}
			}
		});
	}
});