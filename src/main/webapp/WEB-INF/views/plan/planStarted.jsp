<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>计划查看</title>
<!-- jsp动态导入 -->
<%-- <jsp:include page="/common/backend_common.jsp" />
<jsp:include page="/common/page.jsp" />
<jsp:include page="/template/orderListTemplate.jsp" /> --%>
<%@ include file="/common/backend_common.jsp" %>
<%@ include file="/common/page.jsp" %>
<%@ include file="/template/planStartedListTemplate.jsp" %>
<script src="plan.js"></script> 
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />
	<div class="page-header">
		<h1>
			计划查看 <small><i class="ace-icon fa fa-angle-double-right"></i>
				查询与修改 </small>
		</h1>
	</div>
	<div class="main-content-inner">
		<div class="col-sm-12">
			<div class="col-xs-12">
				<div class="table-header">
					计划列表&nbsp;&nbsp; <!-- <a class="green" href="#"> <i
						class="ace-icon fa fa-plus-circle orange bigger-130 order-add"></i>
					</a>-->
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
											<option value="8">8</option>
									</select> 条记录
									</label> <input id="keyword" type="search" name="keyword"
										class="form-control input-sm" placeholder="关键词"
										aria-controls="dynamic-table">
										<input type="hidden" value="1" name="search_status" id="search_status"/>
									<!--  <label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否启用 <select
										id="search_status" name="search_status"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value="0">未启动</option>
											<option value="1">已启动</option>
									</select>
									</label>  -->
									 <label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;材料来源 <select
										id="search_msource" name="search_msource"
										aria-controls="dynamic-table" class="form-control input-sm">
											<option value=""></option>
											<option value="钢锭">钢锭</option>
											<option value="外协件">外协件</option>
											<option value="外购件">外购件</option>
											<option value="钢材">钢材</option>
									</select>
									</label> 
									<input id="fromTime" type="search" name="fromTime"
										class="form-control input-sm datepicker" placeholder="开始时间"
										aria-controls="dynamic-table"> ~ <input id="toTime"
										type="search" name="toTime"
										class="form-control input-sm datepicker" placeholder="结束时间"
										aria-controls="dynamic-table">
									&nbsp;&nbsp;&nbsp;&nbsp;
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
										colspan="1">合同</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">自编号</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">产品名称</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料来源</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">材料情况</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">图号</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">交货状态</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">来料预期</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">合同交期</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">生产开始</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">生产结束</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">当前环节</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">环节描述</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">状态</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">备注</th>
									<th class="sorting_disabled" rowspan="1" colspan="1"
										aria-label="">操作</th>
								</tr>
							</thead>
							<tbody id="planList"></tbody>
						</table>
						<div class="row" id="planPage"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="planForm/planUpdateForm.jsp" %>
	<%@ include file="planForm/planForm.jsp" %>
</body>
</html>