<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-plan-form" style="display: none;">
		<form id="planForm">
			<table
				class="table table-striped table-bplaned table-hover dataTable no-footer"
				role="grid">
				<input type="hidden" name="id" id="input-Id" value="" />
				<tr>
					<td><label for="clientname">客户名称</label></td>
					<td><input id="input-Clientname" type="text" name="clientname"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="productname">零件名称</label></td>
					<td><input id="input-Productname" type="text"
						name="productname" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="contractid">合同编号</label></td>
					<td><input id="input-Contractid" type="text" name="contractid"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="imgid">图号</label></td>
					<td><input id="input-Imgid" type="text" name="imgid" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="materialname">材料名称</label></td>
					<td><input id="input-Materialname" type="text"
						name="materialname" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="comeTime">来料预期</label></td>
					<td><input id="input-ComeTime" type="text" name="comeTime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
				</tr>
				<tr>
					<td><label for="commitTime">合同交期</label></td>
					<td><input id="input-CommitTime" type="text" name="commitTime"
						value="" class="datepicker text ui-widget-content ui-corner-all"
						readonly="true"></td>
				</tr>
				<tr>
					<td><label for="isinventory">是否库存</label></td>
					<td><select id="input-Isinventory" name="isinventory"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="isout">交货状态</label></td>
					<td><select id="input-Isout" name="isout"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="毛坯交货">毛坯交货</option>
							<option value="粗车交货">粗车交货</option>
							<option value="成品交货">成品交货</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="msource">材料来源</label></td>
					<td><select id="input-Msource" name="msource"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="钢锭">钢锭</option>
							<option value="外协件">外协件</option>
							<option value="外购件">外购件</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="ishurry">是否特急</label></td>
					<td><select id="input-Ishurry" name="ishurry"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="status">状态</label></td>
					<td><select id="input-Status" name="status"
						data-placeholder="选择状态" style="width: 150px;">
							<option value="0">停止</option>
							<option value="1">启动</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="remark">备注</label></td>
					<td><input id="input-Remark" type="text" name="remark"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="count">批量生成个数</label></td>
					<td><input id="input-count" type="number" name="count"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>