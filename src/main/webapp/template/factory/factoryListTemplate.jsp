<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="factoryListTemplate" type="x-tmpl-mustache">
{{#factoryList}}
 <tr role="row" class="factory-name odd" data-id="{{id}}"><!--even -->
	<td>{{product.productId}}</td>
	<td>{{order.orderId}}</td>
	<td>{{product.productMaterialname}}</td>
	<td>{{product.productMaterialsource}}</td>
	<td>{{order.orderClientname}}</td>
	<td>{{order.orderContractid}}</td>
	<td>{{#date}}{{/date}}</td>
	<td>{{product.productTargetweight}}</td> 
	<td>{{product.productRealweight}}</td> 
	<td>{{product.productLeftweight}}</td> 
	<td>{{factoryProstatus}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			 <a class="btn btn-info blue factory-info" href="#" data-id="{{id}}">
				  <i class="ace-icon fa fa-pencil bigger-100">生产环节确认</i>
			</a>
		</div>
	</td>
</tr>
{{/factoryList}}
</script>