<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-order-form" style="display: none;">
		<form id="orderForm">
			<table
				class="table table-striped table-bordered table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td><label for="stockMid">材料自编号</label></td>
					<td><input id="input-stockMid" type="text" name="stockMid"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="stockTargetweight">工艺重量</label></td>
					<td><input id="input-stockTargetweight" type="number"
						name="stockTargetweight" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				
				<tr>
					<td><label for="stockRealweight">投料重量</label></td>
					<td><input id="input-stockRealweight" type="number" name="stockRealweight"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="stockLeftweight">剩余重量</label></td>
					<td><input id="input-stockLeftweight" type="number" name="stockLeftweight" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="stockMaterialname">材料名称</label></td>
					<td><input id="input-stockMaterialname" type="text"
						name="stockMaterialname" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="stockIrontype">钢锭类别</label></td>
					<td><input id="input-stockIrontype" type="text"
						name="stockIrontype" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="stockIrontypeweight">钢锭锭型</label></td>
					<td><input id="input-stockIrontypeweight" type="number"
						name="stockIrontypeweight" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="stockImgid">材料图号</label></td>
					<td><select id="input-stockImgid" name="stockImgid"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="毛坯交货">毛坯交货</option>
							<option value="粗车交货">粗车交货</option>
							<option value="成品交货">成品交货</option>
					</select></td>
					<td><label for="stockMaterialsource">材料来源</label></td>
					<td><select id="input-stockMaterialsource" name="stockMaterialsource"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="钢锭">钢锭</option>
							<option value="外协件">外协件</option>
							<option value="外购件">外购件</option>
							<option value="钢材">钢材</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="stockStatus">启用状态</label></td>
					<td><select id="input-stockStatus" name="stockStatus"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
					<td><label for="stockCheck">质检备注</label></td>
					<td><input id="input-stockCheck" type="text" name="stockCheck"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="stockRemark">备注</label></td>
					<td><input id="input-stockRemark" type="text" name="stockRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
					<td><label for="stockStorageId">选择库房</label></td>
					<td><select id="input-stockStorageId" name="stockStorageId"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="1">原料库</option>
							<option value="2">半成品库</option>
							<option value="3">成品库</option>
							<option value="4">废料库</option>
							<option value="5">锻造车间</option>
							<option value="6">热处理车间</option>
							<option value="7">机加车间</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>