<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="productListTemplate" type="x-tmpl-mustache">
{{#productList}}
 <tr role="row" class="material-name odd" data-id="{{id}}"><!--even -->
	<td>{{productId}}</td>
	<td>{{parent.productId}}</td>
	<td>{{productMaterialname}}</td>
	<td>{{productMaterialsource}}</td>
	<td>{{productTargetweight}}</td>
	<td>{{productRealweight}}</td>
	<td>{{productLeftweight}}</td>
	<td>{{productBakweight}}</td>
	<td>{{productImgid}}</td>
	<td>{{productIrontype}}</td>
	<td>{{productIrontypeweight}}</td>
	<td>{{#bold}}{{showStatus}}{{/bold}}</td> 
	<td>{{productRemark}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			<a class="btn blue product-bind" href="#" data-id="{{id}}" data-weight="{{productLeftweight}}">
				 点击绑定
			</a>
		</div>
	</td>
</tr>
{{/productList}}
</script>