$(function() {// 页面开始加载
	// 执行分页逻辑
	// 定义一些全局变量
	var factoryMap = {};// 准备一个map格式的仓库，等待存储从后台返回过来的数据
	var optionStr;// 选项参数
	var pageSize;// 页码条数
	var pageNo;// 当前页
	var url;// 查询url
	var keyword;// 关键字
	var fromTime;
	var toTime;
	var storageid;
	var search_prostatus;
	// 加载模板内容进入html
	// 01从模板中获取页面布局内容
	// orderListTemplate就是mustache模板的id值
	var factoryListTemplate = $("#factoryListTemplate").html();
	// 02使用mustache模板加载这串内容
	// 只是把准备好的页面模板拿出来，放在解析引擎中，准备让引擎往里面填充数据（渲染视图）
	Mustache.parse(factoryListTemplate);
	// 渲染分页列表
	// 调用分页函数
	loadFactoryList();
	// 点击刷新的时候也需要调用分页函数
	$(".research").click(function(e) {
		e.preventDefault();
		$("#factoryPage .pageNo").val(1);
		loadFactoryList();
	});
	// 定义调用分页函数，一定是当前的查询条件下（keyword，search_status。。）的分页
	function loadFactoryList(urlnew) {
		// 获取页面当前需要查询的还留在页码上的信息
		// 在当前页中找到需要调用的页码条数
		pageSize = $("#pageSize").val();
		// 当前页
		pageNo = $("#factoryPage .pageNo").val() || 1;
		if (urlnew) {
			url = urlnew;
		} else {
			url = "/factory/factoryhistory.json";
		}
		keyword = $("#keyword").val();
		fromTime = $("#fromTime").val();
		toTime = $("#toTime").val();
		storageid = $("#storageid").val();
		search_prostatus = $("#search_prostatus").val();
		// 发送请求
		$.ajax({
			url : url,
			data : {// 左面是数据名称-键，右面是值
				pageNo : pageNo,
				pageSize : pageSize,
				keyword : keyword,
				fromTime : fromTime,
				toTime : toTime,
				search_prostatus : search_prostatus,
				storageid : storageid
			},
			type : 'POST',
			success : function(result) {// jsondata jsondata.getData=pageResult
										// pageResult.getData=list
				// 渲染order列表和页面--列表+分页一起填充数据显示条目
				renderFactoryListAndPage(result, url);
			}
		});
	}

	// 渲染所有的mustache模板页面
	// result中的存储数据，就是一个list<MesOrder>集合,是由service访问数据库后返回给controller的数据模型
	function renderFactoryListAndPage(result, url) {
		// 从数据库返回过来的数据集合result
		if (result.ret) {
			// 再次初始化查询条件
			url = "/factory/factory.json";
			// 如果查询到数据库中有符合条件的order列表
			if (result.data.total > 0) {
				// 为订单赋值--在对orderlisttemplate模板进行数据填充--视图渲染
				// //Mustache.render({"name":"李四","gender":"男"});
				// //Mustache.render(list=new
				// ArrayList<String>(){"a01","a02"},{"name":"list[i].name","gender":list[i].gender});
				var rendered = Mustache.render(factoryListTemplate,
				{
					"factoryList" : result.data.data,// {{#orderList}}--List-(result.data.data-list<MesOrder>)
					"date" : function() {
						return function(text, render) {
							if(this.order!=null){
								return this.order.orderCommittime == null ? ""
										: new Date(this.order.orderCommittime)
								.Format("yyyy-MM-dd");
							}else{
								return "";
							}
						}
					}
				});

				$.each(result.data.data, function(i, factory) {// java-增强for
					factoryMap[factory.id] = factory;// result.data.data等同于List<mesOrder>
					// order.id-order map key-value
				});
				$('#factoryList').html(rendered);
			} else {
				$('#factoryList').html('');
			}
			factoryInfo();
			var pageSize = $("#pageSize").val();
			var pageNo = $("#factoryPage .pageNo").val() || 1;
			// 渲染页码
			renderPage(url, result.data.total, pageNo, pageSize,
					result.data.total > 0 ? result.data.data.length : 0,
					"factoryPage", loadFactoryList);
		} else {
			showMessage("获取订单列表", result.msg, false);
		}
	}
	// ////////////////////////////////////////////////////////////
	//生产过程详情页面跳转
	function factoryInfo(){
		$(".factory-info").click(function(e){
			//阻止默认事件
			e.preventDefault();
			//阻止事件传播
			e.stopPropagation();
			var id=$(this).attr("data-id");
//			var url="/factory/factoryInfoTemp.json";
//			window.location.href="/factory/factoryInfo.json?"+id;
			keyword = $("#keyword").val();
			fromTime = $("#fromTime").val();
			toTime = $("#toTime").val();
			storageid = $("#storageid").val();
			search_prostatus = $("#search_prostatus").val();
			// 发送请求
			window.location.href="/factory/factoryHistoryInfo.page?id="+id+"&keyword="+keyword+"&fromTime="+fromTime+"&toTime="+toTime+"&storageid="+storageid+"&search_prostatus="+search_prostatus;
		});
	}
	// ////////////////////////////////////////////////////////////
	// 日期显示
	$('.datepicker').datepicker({
		dateFormat : 'yy-mm-dd',
		showOtherMonths : true,
		selectOtherMonths : false
	});

});
