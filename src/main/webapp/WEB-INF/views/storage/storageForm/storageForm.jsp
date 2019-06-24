<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-order-form" style="display: none;">
		<form id="orderForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="id" id="input-Id" value="" />
				<tr>
					<td><label for="storageName">库房名称</label></td>
					<td><input id="input-storageName" type="text" name="storageName"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="storageRemark">备注</label></td>
					<td><input id="input-storageRemark" type="text" name="storageRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>