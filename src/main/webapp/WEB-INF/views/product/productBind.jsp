<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>材料管理</title>
<!-- jsp动态导入 -->
<%-- <jsp:include page="/common/backend_common.jsp" />
<jsp:include page="/common/page.jsp" />
<jsp:include page="/template/orderListTemplate.jsp" /> --%>
<%@ include file="/common/backend_common.jsp"%>
<%@ include file="/common/page.jsp"%>
<%@ include file="/template/product/productBindTemplate.jsp"%>
<%@ include file="/template/product/productBoundTemplate.jsp"%>
<script src="productBind.js"></script>
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />
	<div class="page-header">
		<h1>
			材料绑定 <small><i class="ace-icon fa fa-angle-double-right"></i>
				创建与查询 </small>
		</h1>
	</div>
	<div class="main-content-inner">
		<div class="col-sm-12 col-md-12 col-lg-12">

			<div class="col-xs-6 col-md-6 col-lg-6">
				<div class="table-header">
					未绑定材料列表&nbsp;&nbsp; <a class="green" href="#">
						<!--  <i
						class="ace-icon fa fa-plus-circle orange bigger-130 material-add"></i> -->
					</a>
				</div>
				<div>
					<div id="dynamic-table_wrapper"
						class="dataTables_wrapper form-inline no-footer">
						<div class="row" style="position: relative;height: 90%">
							<div class="col-xs-12">
								<div class="dataTables_length" id="dynamic-table_length">
									<input  type="hidden" class="bind-id" value="${product.id}"/>
									原料编号<input id="keyword" type="search" name="keyword"
										class="form-control input-sm" placeholder="关键词"
										aria-controls="dynamic-table" readonly="readonly" value="${product.productId}">
									理论剩余重量<input class="leftback-weight" type="text" readonly="readonly" value="${product.productBakweight}"/>
									<br/>剩余重量<input class="left-weight" type="text" readonly="readonly" value="${product.productLeftweight}"/>
									<!-- 
									<label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否有效<select
										id="search_status" name="search_status"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value="0">未到库</option>
											<option value="1">已到库</option>
									</select>
									</label>
									-->
									<input id="search_status" type="hidden" name="search_status" value="0" /> <label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;材料来源 <select
										id="search_source" name="search_source"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value="钢锭">钢锭</option>
											<option value="钢材">钢材</option>
											<option value="废料">废料</option>
											<option value="外购件">外购件</option>
											<option value="外协件">外协件</option>
									</select>
									</label> &nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-info fa fa-check research"
										style="margin-bottom: 6px;" type="button">刷新</button>
								</div>
							</div>
							<table id="dynamic-table"
								class="table table-striped table-bordered table-hover dataTable no-footer"
								role="grid" aria-describedby="dynamic-table_info"
								style="font-size: 14px">
								<thead>
									<tr role="row">
										<input type="hidden" id="id" name="id" class="id" />
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">材料自编号</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">材料名称</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">材料来源</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">工艺重量</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">操作</th>
									</tr>
								</thead>
							</table>
							<div style="overflow: auto;position: absolute;bottom: 20px;top: 124px;right: 0;left: 0">
							<table class="table table-striped table-bordered table-hover dataTable no-footer">
								<tbody id="productList"></tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ######################################### -->
			<div class="col-xs-6 col-md-6 col-lg-6">
				<div class="table-header">
					已绑定材料列表&nbsp;&nbsp; <a class="green" href="#">
						<!--  <i
						class="ace-icon fa fa-plus-circle orange bigger-130 material-add"></i> -->
					</a>
				</div>
				<div>
					<div id="dynamic-table_wrapper"
						class="dataTables_wrapper form-inline no-footer">
						<div class="row" style="height: 90%; position: relative;">
							<table id="dynamic-table"
								class="table table-striped table-bordered table-hover dataTable no-footer"
								role="grid" aria-describedby="dynamic-table_info"
								style="font-size: 14px">
								<thead>
									<tr role="row">
										<input type="hidden" id="id" name="id" class="id" />
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">材料自编号</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">材料名称</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">材料来源</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">工艺重量</th>
										<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
											colspan="1">操作</th>
									</tr>
								</thead>
							</table>
							<div style="overflow: auto;position: absolute;bottom: 20px;top: 49px;right: 0;left: 0">
							<table class="table table-striped table-bordered table-hover dataTable no-footer">
								<tbody id="productBoundList"></tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ######################################### -->
		</div>
		<%@ include file="productForm/productForm.jsp"%>
		<%@ include file="productForm/productUpdateForm.jsp"%>
</body>
</html>