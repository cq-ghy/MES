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
		color: #000
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
	<form class="product-form" action="/factory/step_start.json" method="post">
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
					当前工序:<span id="currentStep" data="${dto.step.stepName}" class="info-value">${dto.step.stepName}</span>
				</p>
				<p>
					当前状态:<span id="factoryProstatus" data="${dto.factoryProstatus}" class="info-value">${dto.factoryProstatus}</span>
				</p>
			</div>
			<div class="info">
				<p>
					派工过程：
				</p>
				<div id="stepListInfo">
					
				</div>
				<!-- 
				<p>
					开始时间:<span class="info-value2">2019-09-09</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间:<span class="info-value2">2019-09-09</span>
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前环节:<span class="info-value2">锻造工序</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产备注:<span class="info-value2">嘿嘿嘿</span>
				</p>
				<p>
					开始时间:<span class="info-value2">2019-09-09</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间:<span class="info-value2">2019-09-09</span>
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前环节:<span class="info-value2">热处理工序</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产备注:<span class="info-value2">嘿嘿嘿</span>
				</p>
				<p>
					开始时间:<span class="info-value2">2019-09-09</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间:<span class="info-value2">2019-09-09</span>
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前环节:<span class="info-value2">机加工序</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产备注:<span class="info-value2">嘿嘿嘿</span>
				</p> -->
			</div>
			<br/>
			<div id="stepList">
			</div>
			<br/>
			<input type="text" name="fhistoryRemark" placeholder="生产备注"/>
			<br/>
			<br/>
			<input name="submit" class="btn btn-info btn-start" type="submit" value="工序派工"/>
			<input name="submit" class="btn btn-info btn-end" type="submit" value="申请质检"/>
		</div>
	</form>
<script src="factory_step.js"></script> 
</body>
</html>