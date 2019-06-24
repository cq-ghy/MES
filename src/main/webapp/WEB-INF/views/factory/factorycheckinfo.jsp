<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
	.product-form {
		padding: 20px
	}
	.product-title {
		font-size: 14px;
		border-bottom: 1px solid #ccc;
		line-height: 30px;
		margin-top: 0;
		color: #000
	}
	.product-title span {
		display: inline-block;
		border-bottom: 3px solid #66c9f3;
		position: relative;
		top: 1px;
	}
	.product-info{
		padding: 10px;
		font-size:12px;
		color: #000;
		height: 700px;
    	overflow-y: auto;
	}
	.product-info .info {
		padding-top: 10px
	}
	.product-info .info p{
		margin: 0;
		line-height: 30px;
		font-wight: bold;
	}
	.info-value {
		margin-left: 30px
	}
	.info-value2{
		margin-left: 10px
	}
	
</style>
<%@ include file="/common/backend_common.jsp" %>
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<form class="product-form" action="/factory/step_check.json" method="post">
		<h3 class="product-title"><span>产品信息</span></h3>
		<div class="product-info">
			<%@ include file="factoryForm/factoryTempForm.jsp" %>
			<div class="info">
				<p>
					客户名称:<span class="info-value">${dto.order.orderClientname}</span>
				</p>
				<p>
					零件名称:<span class="info-value">${dto.order.orderProductname}</span>
				</p>
				<p>
					合同编号:<span class="info-value">${dto.order.orderContractid}</span>
				</p>
				<p>
					承诺交期:<span class="info-value">${dto.order.orderCommittime}</span>
				</p>
				<p>
					产品自编:<span class="info-value">${dto.order.orderId}</span>
				</p>
				<p>
					备注信息:<span class="info-value">${dto.factoryRemark}</span>
				</p>
				<p>
					当前工厂:<span class="info-value">${dto.storage.storageName}</span>
				</p>
				<p>
					当前状态:<span id="factoryProstatus" data="${dto.factoryProstatus}" class="info-value">${dto.factoryProstatus}</span>
				</p>
				<p>
					当前工序:<span id="currentStep" data="${dto.step.stepName}" class="info-value">${dto.step.stepName}</span>
				</p>
			</div>
			<div class="info">
				<p>
					质检过程：
				</p>
				<div id="checkListInfo">
					<!-- <p>
						质检时间:<span class="info-value2">2019-09-09</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产环节:<span class="info-value2">粗车</span>
					   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检指标:<span class="info-value2">尺寸检查</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检结果+备注:<span class="info-value2">通过：尺寸存在0.01mmw误差</span>
					</p>
					<p>
						质检时间:<span class="info-value2">2019-09-09</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产环节:<span class="info-value2">粗车</span>
					   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检指标:<span class="info-value2">尺寸检查</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检结果+备注:<span class="info-value2">通过：尺寸存在0.01mmw误差</span>
					</p>
					<p>
						质检时间:<span class="info-value2">2019-09-09</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产环节:<span class="info-value2">粗车</span>
					   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检指标:<span class="info-value2">尺寸检查</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质检结果+备注:<span class="info-value2">通过：尺寸存在0.01mmw误差</span>
					</p> -->
				</div>
			</div>
			<div class="info">
				<p>
					质检指标：
				</p>
				<label><input type="radio" name="checkgoal" value="尺寸分析"/>尺寸分析</label>&nbsp;&nbsp;
				<label><input type="radio" name="checkgoal"  value="性能分析"/>性能分析</label>	
			</div>
			<div class="info">
				<p>
					质检结果：
				</p>
				<label><input class="checkresult" type="radio" name="checkresult" value="通过"/>通过</label>&nbsp;&nbsp;
				<label><input class="checkresult" id="needreturn" type="radio" name="checkresult"  value="需返工"/>需返工</label>&nbsp;&nbsp;	
				<select id="storageid1" name="storageid1" style="display:none">
						<option value="5">锻造车间</option>
						<option value="6">热处理车间</option>
						<option value="7">机加车间</option>
						<!-- <option value="1">原料库</option>
						<option value="2">半成品库</option>
						<option value="3">成品库</option>
						<option value="4">废料库</option> -->
				</select>
				<label><input class="checkresult" type="radio" name="checkresult"  value="产品作废"/>产品作废</label>&nbsp;&nbsp;
				<select id="storageid2" name="storageid2" style="display:none">
						<option value="4">废料库</option>
						<!-- <option value="5">锻造车间</option>
						<option value="6">热处理车间</option>
						<option value="7">机加车间</option> -->
						<option value="1">原料库</option>
						<option value="2">半成品库</option>
						<option value="3">成品库</option>
				</select>	 
			</div>
			<br/>
			<textarea name="chistoryRemark" cols="" rows="" class="textinput" placeholder="质检备注"></textarea>
			<br/>
			<input type="hidden" value="${dto.step.stepName}" name="chistoryStep"/>
			<input name="submit" class="btn btn-info btn-check" type="submit" value="质检"/>
		</div>
	</form>
<script src="factory_check.js"></script> 
</body>
</html>