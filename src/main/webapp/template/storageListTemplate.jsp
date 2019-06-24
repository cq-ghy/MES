<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="orderListTemplate" type="x-tmpl-mustache">
{{#orderList}}
 <tr role="row" class="order-name odd" data-id="{{id}}"><!--even -->
	<td>{{storageName}}</td>
	<td>{{storageRemark}}</td>
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