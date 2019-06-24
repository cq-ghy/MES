$(function() {
	var ids="";
	
	//出库
	$(".batchOut-btn").click(function(e){
		//阻止默认事件
        e.preventDefault();
		//阻止事件传播
        e.stopPropagation();
		//拿到当前被选中的input-checkbox
		var checks=$(".batchStart-check:checked");
		if(checks.length!=null&&checks.length>0){
			//拿到被选中的订单号
			//messtock-id
			$.each(checks,function(i,check){
				var id=$(check).closest("tr").attr("data-id");
				ids+=id+"&";
			});
//			console.log(ids.substr(0,ids.length-1));
			//拼装ids
			ids=ids.substr(0,ids.length-1);
			out(ids);
			ids="";//111&122&111&122
		}
	});
	
	function out(ids){
		$("#dialog-stockOut-form").dialog({
            model: true,
            title: "批量出库",
            open: function(event, ui) {
         	    $(".ui-dialog").css("width","600px");
                $(".ui-dialog-titlebar-close", $(this).parent()).hide();
              	//将form表单中的数据清空，使用jquery转dom对象
                $("#stockOutForm")[0].reset();
              	//拿到map中以键值对，id-order对象结构的对象,用来向form表单中传递数据
				$("#output-ids").val(ids);
            },
            buttons : {
            	"确定": function (data) {
            		$.ajax({
    					url : "/stock/batchOut.json",
    					data : $("#stockOutForm").serializeArray(),
    					type : 'POST',
    					success : function(result) {
    						$("#dialog-stockOut-form").dialog("close");
    						loadStockList();
    					}
    				});
                },
                "取消": function (data) {
					$("#dialog-stockOut-form").dialog("close");
                }
            }
        });
	}
	
	//入库
	$(".batchStart-btn").click(function(e){
		//阻止默认事件
        e.preventDefault();
		//阻止事件传播
        e.stopPropagation();
		//拿到当前被选中的input-checkbox
		var checks=$(".batchStart-check:checked");
		if(checks.length!=null&&checks.length>0){
			//拿到被选中的订单号
			//messtock-id
			$.each(checks,function(i,check){
				var id=$(check).closest("tr").attr("data-id");
				ids+=id+"&";
			});
//			console.log(ids.substr(0,ids.length-1));
			//拼装ids
			ids=ids.substr(0,ids.length-1);
			check(ids);
			ids="";//111&122&111&122
		}
	});
	
	function check(ids){
		$("#dialog-stockCheck-form").dialog({
            model: true,
            title: "批量质检",
            open: function(event, ui) {
         	    $(".ui-dialog").css("width","600px");
                $(".ui-dialog-titlebar-close", $(this).parent()).hide();
              	//将form表单中的数据清空，使用jquery转dom对象
                $("#stockCheckForm")[0].reset();
              	//拿到map中以键值对，id-order对象结构的对象,用来向form表单中传递数据
				$("#input-ids").val(ids);
            },
            buttons : {
            	"确定": function (data) {
            		$.ajax({
    					url : "/stock/batchCheck.json",
    					data : $("#stockCheckForm").serializeArray(),
    					type : 'POST',
    					success : function(result) {
    						$("#dialog-stockCheck-form").dialog("close");
    						loadStockList();
    					}
    				});
                },
                "取消": function (data) {
                    $("#dialog-stockCheck-form").dialog("close");
                }
            }
        });
	}

	$(".batchStart-th").click(function(){
		var checks=$(".batchStart-check");
		$.each(checks,function(i,input){
			//状态反选
			input.checked=input.checked==true?false:true;
		});
	});	
	
/////////////////////////////////////////////////////////
	//页面开始加载
			//执行分页逻辑
			//定义一些全局变量
			var stockMap = {};//准备一个map格式的仓库，等待存储从后台返回过来的数据
			var optionStr;//选项参数
			var pageSize;//页码条数
			var pageNo;//当前页
			var url;//查询url
			var keyword;//关键字
			var search_status;//查询状态
			var storagename;//查询状态
			var stock_status;
			var fromTime;
			var toTime;

			//加载模板内容进入html
			//01从模板中获取页面布局内容
			//orderListTemplate就是mustache模板的id值
			var stockListTemplate = $("#stockListTemplate").html();
			//02使用mustache模板加载这串内容
			//只是把准备好的页面模板拿出来，放在解析引擎中，准备让引擎往里面填充数据（渲染视图）
			Mustache.parse(stockListTemplate);
			//渲染分页列表
			//调用分页函数
			loadStockList();
			//点击刷新的时候也需要调用分页函数
			$(".research").click(function(e) {
				e.preventDefault();
				$("#stockPage .pageNo").val(1);
				loadStockList();
			});
			//定义调用分页函数，一定是当前的查询条件下（keyword，search_status。。）的分页
			function loadStockList(urlnew) {
				//获取页面当前需要查询的还留在页码上的信息
				//在当前页中找到需要调用的页码条数
				pageSize = $("#pageSize").val();
				//当前页
				pageNo = $("#stockPage .pageNo").val() || 1;
				if (urlnew) {
					url = urlnew;
				} else {
					url = "/stock/stock.json";
				}
				keyword = $("#keyword").val();
				fromTime = $("#fromTime").val();
				toTime = $("#toTime").val();
				storagename = $("#storagename").val();
				search_status = $("#search_status").val();
				stock_status=$("#stock_status").val();
				//发送请求
				$.ajax({
					url : url,
					data : {//左面是数据名称-键，右面是值
						pageNo : pageNo,
						pageSize : pageSize,
						keyword : keyword,
						fromTime : fromTime,
						toTime : toTime,
						search_status : search_status,
						storagename:storagename,
						stock_status:stock_status
					},
					type : 'POST',
					success : function(result) {//jsondata  jsondata.getData=pageResult  pageResult.getData=list
						//渲染order列表和页面--列表+分页一起填充数据显示条目
						renderStockListAndPage(result, url);
					}
				});
			}

			//渲染所有的mustache模板页面
			//result中的存储数据，就是一个list<MesOrder>集合,是由service访问数据库后返回给controller的数据模型
			function renderStockListAndPage(result, url) {
				//从数据库返回过来的数据集合result
				if (result.ret) {
					//再次初始化查询条件
					url = "/stock/stock.json";
					keyword = $("#keyword").val();
					fromTime = $("#fromTime").val();
					toTime = $("#toTime").val();
					search_status = $("#search_status").val();
					storagename = $("#storagename").val();
					stock_status=$("#stock_status").val();
					//如果查询到数据库中有符合条件的order列表
					if (result.data.total > 0) {
						//为订单赋值--在对orderlisttemplate模板进行数据填充--视图渲染
//						Mustache.render({"name":"李四","gender":"男"});
//						Mustache.render(list=new ArrayList<String>(){"a01","a02"},{"name":"list[i].name","gender":list[i].gender});
						var rendered = Mustache.render(
								stockListTemplate,//<script id="orderListTemplate" type="x-tmpl-mustache">
										{
											"stockList" : result.data.data,//{{#orderList}}--List-(result.data.data-list<MesOrder>)
											"come_date" : function() {
												return function(text, render) {
													return this.stockIntime==null?"":new Date(
															this.stockIntime).Format("yyyy-MM-dd");
												}
											},
											"commit_date" : function() {
												return function(text, render) {
													return this.stockOuttime==null?"":new Date(
															this.stockOuttime).Format("yyyy-MM-dd");
												}
											},
											"showStatus" : function() {
												return this.stockStoragestatus == 1 ? '待入库'
														: (this.stockStoragestatus == 2 ? '已入库'
																: '已出库');
											},
											"bold" : function() {
												return function(text, render) {
													var status = render(text);
													if (status == '待入库') {
														return "<span class='label label-sm label-success'>待入库</span>";
													} else if (status == '已入库') {
														return "<span class='label label-sm label-warning'>已入库</span>";
													} else {
														return "<span class='label'>已出库</span>";
													}
												}
											}
										});
						
						$.each(result.data.data, function(i, stock) {//java-增强for
//							stock.stockIntime = new Date(stock.stockIntime).Format("yyyy-MM-dd");
//							stock.stockOuttime = new Date(stock.stockOuttime).Format("yyyy-MM-dd");
							stockMap[stock.id] = stock;//result.data.data等同于List<mesOrder>
						});
						$('#stockList').html(rendered);
					} else {
						$('#stockList').html('');
					}
                    bindStockClick();//更新操作
					var pageSize = $("#pageSize").val();
					var pageNo = $("#stockPage .pageNo").val() || 1;
					//渲染页码
					renderPage(
							url,
							result.data.total,
							pageNo,
							pageSize,
							result.data.total > 0 ? result.data.data.length : 0,
							"stockPage", loadStockList);
				} else {
					showMessage("获取库存列表", result.msg, false);
				}
			}
			
			//////////////////////////////////////////////////////////////
			function bindStockClick(){
				   $(".stock-edit").click(function(e) {
					//阻止默认事件
		            e.preventDefault();
					//阻止事件传播
		            e.stopPropagation();
					//获取orderid
		            var orderId = $(this).attr("data-id");
					//弹出order的修改弹窗 
		            $("#dialog-orderupdate-form").dialog({
		                model: true,
		                title: "编辑库存",
		                open: function(event, ui) {
		             	    $(".ui-dialog").css("width","600px");
		                    $(".ui-dialog-titlebar-close", $(this).parent()).hide();
		                  	//将form表单中的数据清空，使用jquery转dom对象
		                    $("#orderUpdateForm")[0].reset();
		                  	//拿到map中以键值对，id-order对象结构的对象,用来向form表单中传递数据
		                    var targetOrder = orderMap[orderId];
		                  	//如果取出这个对象
		                    if (targetOrder) {
								/////////////////////////////////////////////////////////////////
								$("#input-Id2").val(targetOrder.id);
								$("#input-stockMid2").val(targetOrder.stockMid);
								$("#input-stockTargetweight2").val(targetOrder.stockTargetweight);
								$("#input-stockRealweight2").val(targetOrder.stockRealweight);
								$("#input-stockLeftweight2").val(targetOrder.stockLeftweight);
								$("#input-stockMaterialname2").val(targetOrder.stockMaterialname);
								$("#input-stockIrontype2").val(targetOrder.stockIrontype);
								$("#input-stockIrontypeweight2").val(targetOrder.stockIrontypeweight);
								$("#input-stockImgid2").val(targetOrder.stockImgid);
								$("#input-stockMaterialsource2").val(targetOrder.stockMaterialsource);
								$("#input-stockStatus2").val(targetOrder.stockStatus);
								$("#input-stockCheck2").val(targetOrder.stockCheck);
								$("#input-stockRemark2").val(targetOrder.stockRemark);
								$("#input-stockStorageId2").val(targetOrder.stockStorageId);
								/////////////////////////////////////////////////////////////////
		                    }
		                },
		                buttons : {
		                    "更新": function(e) {
		                        e.preventDefault();
		                        updateOrder(false, function (data) {
		                            $("#dialog-orderupdate-form").dialog("close");
		            				$("#orderPage .pageNo").val(1);
		                            loadOrderList();
		                        }, function (data) {
		                            showMessage("更新库存", data.msg, false);
		                        })
		                    },
		                    "取消": function (data) {
		                        $("#dialog-orderupdate-form").dialog("close");
		                    }
		                }
		            });
		        });
			   }  
			//////////////////////////////////////////////////////////////
			//新增和修改order的通用方法-dml
		//isCreate是否是新增订单(true,false)，如果不是，执行修改
		//successCallbak function(data)  failCallbak function(data)
		function updateOrder(isCreate, successCallbak, failCallbak) {
			$.ajax({
				url : isCreate ? "/stock/insert.json"
						: "/stock/update.json",
				data : isCreate ? $("#orderForm").serializeArray() : $(
						"#orderUpdateForm").serializeArray(),
				type : 'POST',
				success : function(result) {
					//数据执行成功返回的消息
					if (result.ret) {
	                	loadOrderList(); // 带参数回调
						//带参数回调
						if (successCallbak) {
							successCallbak(result);
						}
					} else {
						//执行失败后返回的内容
						if (failCallbak) {
							failCallbak(result);
						}
					}
				}
			});
		}
		//////////////////////////////////////////////////////////////
			//日期显示
			$('.datepicker').datepicker({
				dateFormat : 'yy-mm-dd',
				showOtherMonths : true,
				selectOtherMonths : false
			});

		});
