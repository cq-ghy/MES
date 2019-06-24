<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="planListTemplate" type="x-tmpl-mustache">
{{#planList}}
 <tr role="row" class="plan-name odd" data-id="{{id}}"><!--even -->
	<td><input name="checkbox" type="checkbox" class="batchStart-check"/></td>
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
</tr>
{{/planList}}
</script>