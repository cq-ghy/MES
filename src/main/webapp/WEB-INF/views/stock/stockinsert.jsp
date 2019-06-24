<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>计划管理</title>
<!-- jsp动态导入 -->
<%@ include file="/common/backend_common.jsp"%>
<%@ include file="/common/page.jsp"%>
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />
	<div class="page-header">
		<h1>
			材料管理 <small><i class="ace-icon fa fa-angle-double-right"></i>
				创建与查询 </small>
		</h1>
	</div>
	<div class="main-content-inner">
		<div class="col-sm-12">
			<div class="col-xs-12">
				<div class="table-header">
					材料列表&nbsp;&nbsp;
					<!-- <a class="green" href="#"> <i
						class="ace-icon fa fa-plus-circle orange bigger-130 material-add"></i>
					</a> -->
				</div>
				<div class="table-content">
					<form id="stockForm" method="post" action="/stock/insert.json">
						<table
							class="table table-striped table-bordered table-hover dataTable no-footer"
							role="grid">
							<tr>
								<td><label for="stockProductid">材料id</label></td>
								<td><input id="input-stockProductid" type="text"
									name="stockProductid" value=""
									class="text ui-widget-content ui-corner-all"></td>
								<td><label for="stockProductname">材料名称</label></td>
								<td><input id="input-stockProductname" type="text"
									name="stockProductname" value=""
									class="text ui-widget-content ui-corner-all"></td>
							</tr>
							<tr>
								<td><label for="stockImgid">材料图号</label></td>
								<td><input id="input-stockImgid" type="text"
									name="stockImgid" value=""
									class="text ui-widget-content ui-corner-all"></td>
								<td><label for="stockProductsource">材料来源</label></td>
								<td><select id="input-stockProductsource"
									name="stockProductsource" data-placeholder="选择类型"
									style="width: 150px;">
										<option value="钢材">钢材</option>
										<option value="外协件">外协件</option>
										<option value="外购件">外购件</option>
										<option value="钢锭">钢锭</option>
								</select></td>
							</tr>
							<tr>
								<td><label for="stockStatus">启用状态</label></td>
								<td><select id="input-stockStatus" name="stockStatus"
									data-placeholder="选择类型" style="width: 150px;">
										<option value="1">是</option>
										<option value="0">否</option>
								</select></td>
								<td><label for="stockCheckremark">质检备注</label></td>
								<td><input id="input-stockCheckremark" type="text"
									name="stockCheckremark" value=""
									class="text ui-widget-content ui-corner-all"></td>
							</tr>
							<tr>
								<td><label for="stockRemark">备注</label></td>
								<td><input id="input-stockRemark" type="text"
									name="stockRemark" value=""
									class="text ui-widget-content ui-corner-all"></td>
								<td><label for="stockStorageid">选择库房</label></td>
								<td><select id="input-stockStorageid" name="stockStorageid"
									data-placeholder="选择类型" style="width: 150px;">
										<option value="1">原料库</option>
										<option value="2">半成品库</option>
										<option value="3">成品库</option>
										<option value="4">废料库</option>
										<option value="5">锻造车间</option>
										<option value="6">热处理车间</option>
										<option value="7">机加车间</option>
								</select></td>
							</tr>
							<tr>
								<td><label for="submit">生成记录</label></td>
								<td><input type="submit" value="点击按钮"
									class="btn btn-info fa fa-check" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>