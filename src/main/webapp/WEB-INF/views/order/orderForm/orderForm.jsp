<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-order-form" style="display: none;">
		<form id="orderForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="id" id="input-Id" value="" />
				<tr>
					<td><label for="orderClientname">客户名称</label></td>
					<td><input id="input-orderClientname" type="text" name="orderClientname"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="orderProductname">零件名称</label></td>
					<td><input id="input-orderProductname" type="text"
						name="orderProductname" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="orderContractid">合同编号</label></td>
					<td><input id="input-orderContractid" type="text" name="orderContractid"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="orderImgid">图号</label></td>
					<td><input id="input-orderImgid" type="text" name="orderImgid" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="orderMaterialname">材料名称</label></td>
					<td><input id="input-orderMaterialname" type="text"
						name="orderMaterialname" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="orderCometime">来料预期</label></td>
					<td><input id="input-orderCometime" type="text" name="comeTime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
				</tr>
				<tr>
					<td><label for="orderCommittime">合同交期</label></td>
					<td><input id="input-orderCommittime" type="text" name="commitTime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
					<td><label for="orderInventorystatus">是否库存</label></td>
					<td><select id="input-orderInventorystatus" name="orderInventorystatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="orderSalestatus">交货状态</label></td>
					<td><select id="input-orderSalestatus" name="orderSalestatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="毛坯交货">毛坯交货</option>
							<option value="粗车交货">粗车交货</option>
							<option value="成品交货">成品交货</option>
					</select></td>
					<td><label for="orderMaterialsource">材料来源</label></td>
					<td><select id="input-orderMaterialsource" name="orderMaterialsource"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="钢锭">钢锭</option>
							<option value="外协件">外协件</option>
							<option value="外购件">外购件</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="orderHurrystatus">是否特急</label></td>
					<td><select id="input-orderHurrystatus" name="orderHurrystatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
					<td><label for="orderStatus">状态</label></td>
					<td><select id="input-orderStatus" name="orderStatus"
						data-placeholder="选择状态" style="width: 150px;">
							<option value="0">停止</option>
							<option value="1">启动</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="orderRemark">备注</label></td>
					<td><input id="input-orderRemark" type="text" name="orderRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="count">批量生成个数</label></td>
					<td><input id="input-count" type="number" name="count"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>