<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="productListTemplate" type="x-tmpl-mustache">
{{#productList}}
 <tr role="row" class="material-name odd" data-id="{{id}}"><!--even -->
	<td><input name="checkbox" type="checkbox" class="batchStart-check"/></td>
	<td>{{materialId}}</td>
	<td>{{parentPro.materialId}}</td>
	<td>{{materialMaterialname}}</td>
	<td>{{materialMaterialsource}}</td>
	<td>{{materialTargetweight}}</td>
	<td>{{materialRealweight}}</td>
	<td>{{materialImgid}}</td>
	<td>{{materialIrontype}}</td>
	<td>{{materialIrontypeweight}}</td>
	<td>{{#bold}}{{showStatus}}{{/bold}}</td> 
	<td>{{materialRemark}}</td>
</tr>
{{/productList}}
</script>