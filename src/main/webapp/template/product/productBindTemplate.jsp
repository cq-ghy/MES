<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="productListTemplate" type="x-tmpl-mustache">
{{#productList}}
 <tr role="row" class="product-name odd" data-id="{{id}}"><!--even -->
	<td>{{productId}}</td>
	<td>{{productMaterialname}}</td>
	<td>{{productMaterialsource}}</td>
	<td>{{productTargetweight}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			<a class="btn btn-info product-bind" href="#" data-id="{{id}}" data-weight="{{productTargetweight}}">
				绑定
			</a>
		</div>
	</td>
</tr>
{{/productList}}
</script>