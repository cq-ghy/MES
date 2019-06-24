<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="stepListTemplate" type="x-tmpl-mustache">
{{#stepList}}
 <tr role="row" class="step-name odd" data-id="{{id}}"><!--even -->
	<td>{{stepName}}</td>
	<td>{{stepRemark}}</td>
	<td>
		<div class="hidden-sm hidden-xs action-buttons">
			 <a class="blue step-edit" href="#" data-id="{{id}}">
				  <i class="ace-icon fa fa-pencil bigger-100"></i>
			</a>
		</div>
	</td>
</tr>
{{/stepList}}
</script>