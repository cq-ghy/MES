<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="dialog-product-form" style="display: none;">
		<form id="productForm">
			<table
				class="table table-striped table-bplaned table-hover dataTable no-footer"
				role="grid">
				<tr>
					<td><label for="materialImgid">图号</label></td>
					<td><input id="input-materialImgid" type="text" name="materialImgid" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="materialMaterialname">材料名称</label></td>
					<td><input id="input-materialMaterialname" type="text"
						name="materialMaterialname" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="materialMaterialsource">材料来源</label></td>
					<td><select id="input-materialMaterialsource" name="materialMaterialsource"
						data-placeholder="选择类型" style="width: 150px;">
							<option value="钢材">钢材</option>
							<option value="废料">废料</option>
					</select></td>
					<td><label for="materialTargetweight">工艺重量</label></td>
					<td><input id="input-materialTargetweight" type="number"
						name="materialTargetweight" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="materialRealweight">投料重量</label></td>
					<td><input id="input-materialRealweight" type="number"
						name="materialRealweight" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="materialIrontype">钢锭类别</label></td>
					<td><input id="input-materialIrontype" type="text"
						name="materialIrontype" value=""
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="materialIrontypeweight">锭型</label></td>
					<td><input id="input-materialIrontypeweight" type="number"
						name="materialIrontypeweight" value=""
						class="text ui-widget-content ui-corner-all"></td>
					<td><label for="materialRemark">备注</label></td>
					<td><input id="input-materialRemark" type="text" name="materialRemark"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="count">批量生成个数</label></td>
					<td><input id="input-count" type="number" name="count"
						value="" class="text ui-widget-content ui-corner-all"></td>
				</tr>
			</table>
		</form>
	</div>