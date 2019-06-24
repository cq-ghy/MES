<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="orderListTemplate" type="x-tmpl-mustache">
{{#orderList}}
 <tr role="row" class="order-name odd" data-id="{{id}}"><!--even -->
	<td><a href="#" data-id="{{orderId}}">{{orderId}}</a></td>
	<td>{{orderProductname}}</td>
	<td>{{orderImgid}}</td>
	<td>{{orderMaterialname}}</td>
	<td>{{orderMaterialsource}}</td>
	<td>{{#come_date}}{{/come_date}}</td>
	<td>{{#commit_date}}{{/commit_date}}</td>
	<td>{{#bold}}{{showStatus}}{{/bold}}</td> 
	<td>{{orderRemark}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			 <a class="blue order-edit" href="#" data-id="{{id}}">
				  <i class="ace-icon fa fa-pencil bigger-100"></i>
			</a>
		</div>
	</td>
</tr>
{{/orderList}}
</script>