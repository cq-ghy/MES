<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="planListTemplate" type="x-tmpl-mustache">
{{#planList}}
 <tr role="row" class="plan-name odd" data-id="{{id}}"><!--even -->
	<td>{{planContractid}}</td>
	<td><a href="#" data-id="{{planOrderid}}">{{planOrderid}}</a></td>
	<td>{{planProductname}}</td>
	<td>{{planMaterialname}}</td>
	<td>{{planMaterialsource}}</td>
	<td>{{planMaterialdesc}}</td>
	<td>{{planImgid}}</td>
	<td>{{planSalestatus}}</td>
	<td>{{#come_date}}{{/come_date}}</td>
	<td>{{#commit_date}}{{/commit_date}}</td>
	<td>{{#start_date}}{{/start_date}}</td>
	<td>{{#end_date}}{{/end_date}}</td>
	<td>{{planCurrentstatus}}</td>
	<td>{{planCurrentremark}}</td>
	<td>{{#bold}}{{showStatus}}{{/bold}}</td> 
	<td>{{planRemark}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			 <a class="blue plan-edit" href="#" data-id="{{id}}">
				  <i class="ace-icon fa fa-pencil bigger-100"></i>
			</a>
		</div>
	</td>
</tr>
{{/planList}}
</script>