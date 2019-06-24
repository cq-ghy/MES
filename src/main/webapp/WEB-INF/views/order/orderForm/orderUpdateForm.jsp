<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-orderUpdate-form" style="display: none;">
		<form id="orderUpdateForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="id" id="input-Id2" value="" />
				<tr>
					<td><label for="orderId">订单id</label></td>
					<td><input id="input-orderId2" type="text" name="orderId"
						value="" class="text ui-widget-content ui-corner-all" readonly="true"></td>
				</tr>
				<tr>
					<td><label for="orderClientname">客户名称</label></td>
					<td><input id="input-orderClientname2" type="text" name="orderClientname"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="orderProductname">零件名称</label></td>
					<td><input id="input-orderProductname2" type="text"
						name="orderProductname" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="orderContractid">合同编号</label></td>
					<td><input id="input-orderContractid2" type="text" name="orderContractid"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="orderImgid">图号</label></td>
					<td><input id="input-orderImgid2" type="text" name="orderImgid" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="orderMaterialname">材料名称</label></td>
					<td><input id="input-orderMaterialname2" type="text"
						name="orderMaterialname" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="orderCometime">来料预期</label></td>
					<td><input id="input-orderCometime2" type="text" name="comeTime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
				</tr>
				<tr>
					<td><label for="orderCommittime">合同交期</label></td>
					<td><input id="input-orderCommittime2" type="text" name="commitTime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
					<td><label for="orderInventorystatus">是否库存</label></td>
					<td><select id="input-orderInventorystatus2" name="orderInventorystatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="orderSalestatus">交货状态</label></td>
					<td><select id="input-orderSalestatus2" name="orderSalestatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="毛坯交货">毛坯交货</option>
							<option value="粗车交货">粗车交货</option>
							<option value="成品交货">成品交货</option>
					</select></td>
					<td><label for="orderMaterialsource">材料来源</label></td>
					<td><select id="input-orderMaterialsource2" name="orderMaterialsource"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="钢锭">钢锭</option>
							<option value="外协件">外协件</option>
							<option value="外购件">外购件</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="orderHurrystatus">是否特急</label></td>
					<td><select id="input-orderHurrystatus2" name="orderHurrystatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
					<td><label for="orderStatus">状态</label></td>
					<td><select id="input-orderStatus2" name="orderStatus"
						data-placeholder="选择状态" style="width: 150px;">
							<option value="0">停止</option>
							<option value="1">启动</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="orderRemark">备注</label></td>
					<td><input id="input-orderRemark2" type="text" name="orderRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>