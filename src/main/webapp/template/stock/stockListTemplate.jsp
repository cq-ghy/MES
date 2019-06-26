<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="stockListTemplate" type="x-tmpl-mustache">
{{#stockList}}
 <tr role="row" class="stock-name odd" data-id="{{id}}"><!--even -->
	<td><input name="checkbox" type="checkbox" class="batchStart-check"/></td>
	<td>{{storage.storageName}}</td>
	<td class="productId" data-id="{{product.id}}">{{product.productId}}</td>
	<td>{{stockOrdername}}</td>
	<td>{{stockImgid}}</td>
	<td>{{stockProductname}}</td>
	<td>{{stockProductsource}}</td>
	<td>{{#bold}}{{showStatus}}{{/bold}}</td> 
	<td>{{product.productRealweight}}</td>
	<td>{{product.productLeftweight}}</td>
	<td>{{product.productIrontypeweight}}</td>
	<td>{{stockCheckremark}}</td>
	<td>{{stockRemark}}</td>
	<td>{{#come_date}}{{/come_date}}</td>
	<td>{{#commit_date}}{{/commit_date}}</td>
	<td>{{stockOutobj}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			 <a class="blue stock-edit" href="#" data-id="{{id}}">
				  <i class="ace-icon fa fa-pencil bigger-100"></i>
			</a>
		</div>
	</td>
</tr>
{{/stockList}}
</script>