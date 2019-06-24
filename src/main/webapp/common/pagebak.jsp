<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script id="paginateTemplate" type="x-tmpl-mustache">
<div class="col-xs-6">
    <div class="dataTables_info" id="dynamic-table_info" role="status" aria-live="polite">
        总共 {{total}} 条中的 {{from}} ~ {{to}}条 当前第{{pageNo}}页
    </div>
</div>
<div class="col-xs-6">
    <div class="dataTables_paginate paging_simple_numbers" id="dynamic-table_paginate">
        <ul class="pagination">
            <li class="paginate_button previous {{^firstUrl}}disabled{{/firstUrl}}" aria-controls="dynamic-table" tabindex="0">
                <a href="#" data-target="1" data-url="{{firstUrl}}" class="page-action">首页</a>
            </li>
            <li class="paginate_button {{^beforeUrl}}disabled{{/beforeUrl}}" aria-controls="dynamic-table" tabindex="0">
                <a href="#" name="前一页" data-target="{{beforePageNo}}" data-url="{{beforeUrl}}" class="page-action">前一页</a>
            </li>
            <li class="paginate_button active" aria-controls="dynamic-table" tabindex="0">
                <a href="#" data-id="{{pageNo}}" >第{{pageNo}}页</a>
                <input type="hidden" class="pageNo" value="{{pageNo}}" />
            </li>
            <li class="paginate_button {{^nextUrl}}disabled{{/nextUrl}}" aria-controls="dynamic-table" tabindex="0">
                <a href="#" name="后一页" data-target="{{nextPageNo}}" data-url="{{nextUrl}}" class="page-action">后一页</a>
            </li>
            <li class="paginate_button next {{^lastUrl}}disabled{{/lastUrl}}" aria-controls="dynamic-table" tabindex="0">
                <a href="#" data-target="{{maxPageNo}}" data-url="{{lastUrl}}" class="page-action">尾页</a>
            </li>
        </ul>
    </div>
</div>
</script>
<!-- 不要求会写，但是希望你掌握-->
<script type="text/javascript">
	//01找到模板中的内容，把html中的数据封装到js自定义的变量中
	//paginationTemplate 分页模板的英文，自定义名字
	var paginateTemplate = $("#paginateTemplate").html();
	//02将页面变量内容交给mustache库,使用mustache技术加载指定模板
	Mustache.parse(paginateTemplate);
	//渲染分页的内容
	//url total pageNo pageSize currentSize idElement:将paginatetemplate加载到哪一个页面版块 预留一个回调函数
	function renderPage(url, total, pageNo, pageSize, currentSize, idElement,
			callback) {
		//得到最大的页码,使用向上取整的函数
		var maxPageNo = Math.ceil(total / pageSize);
		//url: /order/page.json?username=apple&age=100
		var paramStartChar = url.indexOf("?") > 0 ? "&" : "?";
		//数据从哪里开始
		var from = (pageNo - 1) * pageSize + 1;
		//处理当前页为数字类型
		var pageNo = parseInt(pageNo);
		//定义视图内容[1][2]当前页[前一页][后一页]...
		var view = {
			from : from > total ? total : from,
			to : (from + currentSize - 1) > total ? total
					: (from + currentSize - 1),
			total : total,
			pageNo : pageNo,
			maxPageNo : maxPageNo,
			nextPageNo : pageNo >= maxPageNo ? maxPageNo : (pageNo + 1),
			beforePageNo : pageNo == 1 ? 1 : (pageNo - 1),
			firstUrl : (pageNo == 1) ? '' : (url + paramStartChar
					+ "pageNo=1&pageSize=" + pageSize),
			beforeUrl : (pageNo == 1) ? '' : (url + paramStartChar + "pageNo="
					+ (pageNo - 1) + "&pageSize=" + pageSize),
			nextUrl : (pageNo >= maxPageNo) ? '' : (url + paramStartChar
					+ "pageNo=" + (pageNo + 1) + "&pageSize=" + pageSize),
			lastUrl : (pageNo >= maxPageNo) ? '' : (url + paramStartChar
					+ "pageNo=" + maxPageNo + "&pageSize=" + pageSize)
		};
		//idElement="orderPage"
		//找到页面中的<div class="row" id="orderPage"></div>
		//Mustache.render(paginateTemplate, view) 使用mustache模板，对指定模板进行数据填充
		$("#" + idElement).html(Mustache.render(paginateTemplate, view));
		//每一个页码按钮拥有一个点击事件
		$(".page-action").click(function(e) {
			//阻止默认事件，冒泡
			e.preventDefault();
			//给每一个按钮添加指定的值	
			$("#" + idElement + " .pageNo").val($(this).attr("data-target"));
			//填充每一个按钮上的url
			var targetUrl = $(this).attr("data-url");
			//让回调函数执行这个url
			if (targetUrl != '') {
				callback(targetUrl);//交由其他地方的ajax请求来传输页码,url以及数据
			}
		})
	}
</script>