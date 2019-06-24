<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-planUpdate-form" style="display: none;">
		<form id="planUpdateForm">
			<table
				class="table table-striped table-bplaned table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="id" id="input-Id2" value="" />
				<tr>
					<td><label for="planOrderid">产品自编号</label></td>
					<td><input id="input-planOrderid2" type="text" name="planOrderid" value=""
						class="text ui-widget-content ui-corner-all" readOnly="true"></td>
					<td><label for="planClientname">客户名称</label></td>
					<td><input id="input-planClientname2" type="text"
						name="planClientname" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="planProductname">产品名称</label></td>
					<td><input id="input-planProductname2" type="text"
						name="planProductname" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="planContractid">合同编号</label></td>
					<td><input id="input-planContractid2" type="text"
						name="planContractid" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="planImgid">图号</label></td>
					<td><input id="input-planImgid2" type="text" name="planImgid" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="planMaterialname">材料名称</label></td>
					<td><input id="input-planMaterialname2" type="text"
						name="planMaterialname" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="planCometime">来料预期</label></td>
					<td><input id="input-planCometime2" type="text" name="planCometime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
					<td><label for="planCommittime">合同交期</label></td>
					<td><input id="input-planCommittime2" type="text"
						name="planCommittime" value=""
						class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
				</tr>
				<tr>
					<td><label for="planWorkstarttime">生产开始</label></td>
					<td><input id="input-planWorkstarttime2" type="text" name="planWorkstarttime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
					<td><label for="planWorkendtime">生产结束</label></td>
					<td><input id="input-planWorkendtime2" type="text"
						name="planWorkendtime" value=""
						class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
				</tr>
				<tr>
					<td><label for="planInventorystatus">是否库存</label></td>
					<td><select id="input-planInventorystatus2" name="planInventorystatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
					<td><label for="planSalestatus">交货状态</label></td>
					<td><select id="input-planSalestatus2" name="planSalestatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="毛坯交货">毛坯交货</option>
							<option value="粗车交货">粗车交货</option>
							<option value="成品交货">成品交货</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="planMaterialsource">材料来源</label></td>
					<td><select id="input-planMaterialsource2" name="planMaterialsource"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="钢锭">钢锭</option>
							<option value="外协件">外协件</option>
							<option value="外购件">外购件</option>
					</select></td>
					<td><label for="planHurrystatus">是否特急</label></td>
					<td><select id="input-planHurrystatus2" name="planHurrystatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="planStatus">状态</label></td>
					<td><select id="input-planStatus2" disabled="disabled" name="planStatus"
						data-placeholder="选择状态" style="width: 150px;">
							<option value="1">启动</option>
							<option value="0">停止</option>
					</select></td>
					<td><label for="planMaterialdesc">材料情况</label></td>
					<td><input id="input-planMaterialdesc2" type="text" name="planMaterialdesc" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="planRemark">备注</label></td>
					<td><input id="input-planRemark2" type="text" name="planRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>