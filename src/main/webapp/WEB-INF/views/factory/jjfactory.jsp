<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>机加车间生产记录</title>
<!-- jsp动态导入 -->
<%-- <jsp:include page="/common/backend_common.jsp" />
<jsp:include page="/common/page.jsp" />
<jsp:include page="/template/orderListTemplate.jsp" /> --%>
<%@ include file="/common/backend_common.jsp" %>
<%@ include file="/common/page.jsp" %>
<%@ include file="/template/factory/factoryListTemplate.jsp" %>
<script src="factory.js"></script> 
<%-- <jsp:include page="orderJs.jsp" />
 --%>
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />
	<div class="page-header">
		<h1>
			机加生产查询 <small><i class="ace-icon fa fa-angle-double-right"></i>
				查询与修改 </small>
		</h1>
	</div>
	<div class="main-content-inner">
		<div class="col-sm-12">
			<div class="col-xs-12">
				<div class="table-header">
					生产列表&nbsp;&nbsp; <!-- <a class="green" href="#"> <i
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
										aria-controls="dynamic-table"> <label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									生产状态 <select
										id="search_prostatus" name="search_prostatus"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value=""></option>
											<option value="待派工">待派工</option>
											<option value="已派工">已派工</option>
											<option value="待质检">待质检</option>
									</select>
									</label> 
									<input id="storageid" type="hidden" name="storageid" value="7"/>
									查询时间<input id="fromTime" type="search" name="fromTime"
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
										colspan="1">订单编号</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料名称</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料来源</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">客户名称</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">合同号</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">承诺交期</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">工艺重量</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">投料重量</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">剩余重量</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">生产状态</th>
									<th class="sorting_disabled" rowspan="1" colspan="1"
										aria-label="">操作</th>
								</tr>
							</thead>
							<tbody id="factoryList"></tbody>
						</table>
						<div class="row" id="factoryPage"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>