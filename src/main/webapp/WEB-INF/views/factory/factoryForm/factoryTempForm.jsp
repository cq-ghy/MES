<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div id="factoryTempform" style="display: none;">
	<input type="hidden" name="keyword" value="${searchParam.keyword}"/>
    <input type="hidden" name="fromTime" value="${searchParam.fromTime}"/>
    <input type="hidden" name="toTime" value="${searchParam.toTime}"/>
    <input type="hidden" name="storageid" value="${searchParam.storageid}"/>
    <input type="hidden" name="search_prostatus" value="${searchParam.search_prostatus}"/>
	<input type="hidden" name="pageNo" value="${page.pageNo}"/>
	<input type="hidden" name="pageSize" value="${page.pageSize}"/>
	<input type="hidden" name="offset" value="${page.offset}"/>
	<input id="id" type="hidden" name="id" value="${dto.id}"/>
</div>