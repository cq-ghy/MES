<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="productBoundTemplate" type="x-tmpl-mustache">
{{#productBoundList}}
 <tr role="row" class="material-name odd" data-id="{{id}}"><!--even -->
	<td>{{productId}}</td>
	<td>{{productMaterialname}}</td>
	<td>{{productMaterialsource}}</td>
	<td>{{productTargetweight}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			<a class="btn btn-danger bound-edit" href="#" data-id="{{id}}" data-weight="{{productTargetweight}}">
				解除
			</a>
		</div>
	</td>
</tr>
{{/productBoundList}}
</script>