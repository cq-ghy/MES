<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-stockOut-form" style="display: none;">
	<form id="stockOutForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="ids" id="output-ids" value=""/>
				<tr>
					<td><label for="stockOutObj">出库对象</label></td>
					<td><select id="input-stockOutObj" name="stockOutObj"
						data-placeholder="对象类型" style="width: 150px;">
							<option value="原料库">原料库</option>
							<option value="半成品库">半成品库</option>
							<option value="成品库">成品库</option>
							<option value="废料库">废料库</option>
							<option value="锻造车间">锻造车间</option>
							<option value="热处理车间">热处理车间</option>
							<option value="机加车间">机加车间</option>
							<option value="交货">交货</option>
					</select></td>
					<td><label for="stockOutRemark">备注</label></td>
					<td><input id="input-stockOutRemark" type="text" name="stockOutRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>