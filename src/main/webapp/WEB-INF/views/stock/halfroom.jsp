<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>半成品库</title>
<!-- jsp动态导入 -->
<%-- <jsp:include page="/common/backend_common.jsp" />
<jsp:include page="/common/page.jsp" />
<jsp:include page="/template/orderListTemplate.jsp" /> --%>
<%@ include file="/common/backend_common.jsp" %>
<%@ include file="/common/page.jsp" %>
<%@ include file="/template/stock/stockListTemplate.jsp" %>
<script src="stock.js"></script> 
<%-- <jsp:include page="orderJs.jsp" />
 --%>
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />
	<div class="page-header">
		<h1>
			半成品管理 <small><i class="ace-icon fa fa-angle-double-right"></i>
				创建与查询 </small>
		</h1>
	</div>
	<div class="main-content-inner">
		<div class="col-sm-12">
			<div class="col-xs-12">
				<div class="table-header">
					库存列表&nbsp;&nbsp; <!-- <a class="green" href="#"> <i
						class="ace-icon fa fa-plus-circle orange bigger-130 order-add"></i>
					</a> -->
				</div>
				<div>
					<div id="dynamic-table_wrapper"
						class="dataTables_wrapper form-inline no-footer">
						
						<div class="row">
							<div class="col-xs-12">
								<div class="dataTables_length" id="dynamic-table_length">
									<label> 展示 <select id="pageSize"
										name="dynamic-table_length" aria-controls="dynamic-table"
										class="form-control input-sm">
											<option value="10">10</option>
									</select> 条记录
									</label> <input id="keyword" type="search" name="keyword"
										class="form-control input-sm" placeholder="关键词"
										aria-controls="dynamic-table">
									<!--  -->
									<label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
									
									<input type="hidden" name="storagename" id="storagename" value="2"/>
								<!-- 	<select
										id="storagename" name="storagename"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value="1">原料库</option>
									</select> -->
									
									</label>
									<!--  -->
									<label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库存状态<select
										id="stock_status" name="stock_status"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value="0"></option>
											<option value="1">待入库</option>
											<option value="2">已入库</option>
											<option value="3">已出库</option>
									</select>
									</label>
									<!--  -->
									<input type="hidden" id="search_status" name="search_status" value="1"/>
									<!-- <label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否启用 <select
										id="search_status" name="search_status"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value="1">已启动</option>
											<option value="0">未启动</option>
									</select> -->
									</label> <input id="fromTime" type="search" name="fromTime"
										class="form-control input-sm datepicker" placeholder="开始时间"
										aria-controls="dynamic-table"> ~ <input id="toTime"
										type="search" name="toTime"
										class="form-control input-sm datepicker" placeholder="结束时间"
										aria-controls="dynamic-table">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-info fa fa-check research"
										style="margin-bottom: 6px;" type="button">刷新</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-12">
								<div class="dataTables_length" id="dynamic-table_length">
										<button class="btn btn-info fa fa-check batchStart-btn pull-left"
											style="margin-bottom: 6px;" type="button">批量质检入库</button>
										<button class="btn btn-info fa fa-check batchOut-btn pull-right"
											style="margin-bottom: 6px;" type="button">批量出库</button>
								</div>
							</div>
						</div>
						
						<table id="dynamic-table"
							class="table table-striped table-bordered table-hover dataTable no-footer"
							role="grid" aria-describedby="dynamic-table_info"
							style="font-size: 14px">
							<thead>
								<tr role="row">
									<input type="hidden" id="id" name="id" class="id" />
									<th class="batchStart-th" tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">选择</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">库房</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料自编号</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">产品名称</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">图号</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料名称</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料来源</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">库存状态</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">投料重量</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">剩余重量</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">钢锭锭型</th>										
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">入库质检</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">备注</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">入库时间</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">出库时间</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">出库对象</th>
									<th class="sorting_disabled" rowspan="1" colspan="1"
										aria-label="">锻造关系</th>
								</tr>
							</thead>
							<tbody id="stockList"></tbody>
						</table>
						<div class="row" id="stockPage"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="stockInputForm/stockUpdateForm.jsp" %>
	<%@ include file="stockInputForm/stockCheckForm.jsp" %>
	<%@ include file="stockInputForm/stockOutForm.jsp" %>
</body>
</html>