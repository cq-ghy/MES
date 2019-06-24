<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>工序维护</title>
<!-- jsp动态导入 -->
<%-- <jsp:include page="/common/backend_common.jsp" />
<jsp:include page="/common/page.jsp" />
<jsp:include page="/template/orderListTemplate.jsp" /> --%>
<%@ include file="/common/backend_common.jsp" %>
<%@ include file="/common/page.jsp" %>
<%@ include file="/template/step/stepListTemplate.jsp" %>
<script src="step.js"></script> 
<%-- <jsp:include page="orderJs.jsp" />
 --%>
</head>
<body class="no-skin" youdao="bind" style="background: white">
	<input id="gritter-light" checked="" type="checkbox"
		class="ace ace-switch ace-switch-5" />
	<div class="page-header">
		<h1>
			工序维护 <small><i class="ace-icon fa fa-angle-double-right"></i>
				创建与查询 </small>
		</h1>
	</div>
	<div class="main-content-inner">
		<div class="col-sm-12">
			<div class="col-xs-12">
				<div class="table-header">
					工序列表&nbsp;&nbsp; <a class="green" href="#"> <i
						class="ace-icon fa fa-plus-circle orange bigger-130 step-add"></i>
					</a>
				</div>
				<div>
					<div id="dynamic-table_wrapper"
						class="dataTables_wrapper form-inline no-footer">
						<div class="row">

						</div>
						<table id="dynamic-table"
							class="table table-striped table-bordered table-hover dataTable no-footer"
							role="grid" aria-describedby="dynamic-table_info"
							style="font-size: 14px">
							<thead>
								<tr role="row">
									<input type="hidden" id="id" name="id" class="id" />
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">工序名称</th>
									<th tabindex="0" aria-controls="dynamic-table" rowspan="1"
										colspan="1">备注</th>
									<th class="sorting_disabled" rowspan="1" colspan="1"
										aria-label="" style="width:10%;">修改</th>
								</tr>
							</thead>
							<tbody id="stepList"></tbody>
						</table>
						<div class="row" id="stepPage"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="stepForm/stepUpdateForm.jsp" %>
	<%@ include file="stepForm/stepForm.jsp" %>
</body>
</html>