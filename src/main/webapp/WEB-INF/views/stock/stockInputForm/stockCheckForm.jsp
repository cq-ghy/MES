<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-stockCheck-form" style="display: none;">
	<form id="stockCheckForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="ids" id="input-ids" value=""/>
				<tr>
					<td><label for="stockCheck">质检备注</label></td>
					<td><input id="input-stockCheck" type="text" name="stockCheck"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<!-- <td><input id="input-stockSubmit" type="submit"
						name="stockSubmit" value="质检确认"
						class="text ui-widget-content ui-corner-all"></td> -->
				</tr>
			</table>
		</form>
	</div>