<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-step-form" style="display: none;">
		<form id="stepForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="id" id="input-Id" value="" />
				<tr>
					<td><label for="stepName">步骤名称</label></td>
					<td><input id="input-stepName" type="text" name="stepName"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="stepRemark">备注</label></td>
					<td><input id="input-stepRemark" type="text" name="stepRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>