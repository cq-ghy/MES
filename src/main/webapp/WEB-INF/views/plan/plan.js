$(function() {
	var ids="";
	$(".batchStart-btn").click(function(){
		//拿到当前被选中的input-checkbox
		var checks=$(".batchStart-check:checked");
		var dates=$(".datepicker2");
		if(checks.length!=null&&checks.length>0){
//			console.log($(dates[0]).val());
			//拿到起始日期和结束日期
			if(dates==null){
				return false;
			}
			var startTime=$(dates[0]).val();//2018-12-05
			var endTime=$(dates[1]).val();//2018-12-06
			if(startTime==null||endTime==null||startTime==""||endTime==""){
				return false;
			}
			//拿到被选中的订单号
			//mesorder-id
			$.each(checks,function(i,check){
				var id=$(check).closest("tr").attr("data-id");
				ids+=id+"&";
			});
			//拼装ids
			ids=ids.substr(0,ids.length-1);
			ids=ids+","+startTime+"&"+endTime;
			//发送ajax请求
			$.ajax({
				url : "/plan/planBatchStart.json",
				data : {//左面是数据名称-键，右面是值
					ids:ids
				},
				type : 'POST',
				success : function(result) {//jsondata  jsondata.getData=pageResult  pageResult.getData=list
					loadPlanList();
				}
			});
			ids="";//111&122&111&122
		}
	});

	$(".batchStart-th").click(function(){
		var checks=$(".batchStart-check");
		$.each(checks,function(i,input){
			//状态反选
			input.checked=input.checked==true?false:true;
		});
	});
///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
	//执行分页逻辑
			//定义一些全局变量
			var planMap = {};//准备一个map格式的仓库，等待存储从后台返回过来的数据
			var optionStr;//选项参数
			var pageSize;//页码条数
			var pageNo;//当前页
			var url;//查询url
			var keyword;//关键字
			var search_status;//查询状态
			var search_msource;//材料来源
			var fromTime;
			var toTime;

			//加载模板内容进入html
			//01从模板中获取页面布局内容
			//planListTemplate就是mustache模板的id值
			var planListTemplate = $("#planListTemplate").html();
			//02使用mustache模板加载这串内容
			//只是把准备好的页面模板拿出来，放在解析引擎中，准备让引擎往里面填充数据（渲染视图）
			Mustache.parse(planListTemplate);
			//渲染分页列表
			//调用分页函数
			loadPlanList();
			//点击刷新的时候也需要调用分页函数
			$(".research").click(function(e) {
				e.preventDefault();
				$("#planPage .pageNo").val(1);
				loadPlanList();
			});
			//定义调用分页函数，一定是当前的查询条件下（keyword，search_status。。）的分页
			function loadPlanList(urlnew) {
				//获取页面当前需要查询的还留在页码上的信息
				//在当前页中找到需要调用的页码条数
				pageSize = $("#pageSize").val();
				//当前页
				pageNo = $("#planPage .pageNo").val() || 1;
				if (urlnew) {
					url = urlnew;
				} else {
					url = "/plan/plan.json";
				}
				keyword = $("#keyword").val();
				fromTime = $("#fromTime").val();
				toTime = $("#toTime").val();
				search_status = $("#search_status").val();
				search_msource = $("#search_msource").val();
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
						search_msource:search_msource
					},
					type : 'POST',
					success : function(result) {//jsondata  jsondata.getData=pageResult  pageResult.getData=list
						//渲染plan列表和页面--列表+分页一起填充数据显示条目
						renderPlanListAndPage(result, url);
					}
				});
			}

			//渲染所有的mustache模板页面
			//result中的存储数据，就是一个list<MesOrder>集合,是由service访问数据库后返回给controller的数据模型
			function renderPlanListAndPage(result, url) {
				//从数据库返回过来的数据集合result
				if (result.ret) {
					//再次初始化查询条件
					url = "/plan/plan.json";
					keyword = $("#keyword").val();
					fromTime = $("#fromTime").val();
					toTime = $("#toTime").val();
					search_status = $("#search_status").val();
					search_msource = $("#search_msource").val();
					//如果查询到数据库中有符合条件的plan列表
					if (result.data.total > 0) {
						//为订单赋值--在对planlisttemplate模板进行数据填充--视图渲染
//						Mustache.render({"name":"李四","gender":"男"});
//						Mustache.render(list=new ArrayList<String>(){"a01","a02"},{"name":"list[i].name","gender":list[i].gender});
						var rendered = Mustache.render(
										planListTemplate,//<script id="planListTemplate" type="x-tmpl-mustache">
										{
											"planList" : result.data.data,//{{#planList}}--List-(result.data.data-list<MesOrder>)
											"come_date" : function() {
												return function(text, render) {
													return new Date(
															this.planCometime)
															.Format("yyyy-MM-dd");
												}
											},
											"commit_date" : function() {
												return function(text, render) {
													return new Date(
															this.planCommittime)
															.Format("yyyy-MM-dd");
												}
											},
											"start_date" : function() {
												return function(text, render) {
													if(this.planWorkstarttime==null)return null;
													return new Date(
															this.planWorkstarttime)
															.Format("yyyy-MM-dd");
												}
											},
											"end_date" : function() {
												return function(text, render) {
													if(this.planWorkendtime==null)return null;
													return new Date(
															this.planWorkendtime)
															.Format("yyyy-MM-dd");
												}
											},
											"showStatus" : function() {
												return this.planStatus == 1 ? '有效'
														: (this.planStatus == 0 ? '无效'
																: '删除');
											},
											"bold" : function() {
												return function(text, render) {
													var status = render(text);
													if (status == '有效') {
														return "<span class='label label-sm label-success'>有效</span>";
													} else if (status == '无效') {
														return "<span class='label label-sm label-warning'>无效</span>";
													} else {
														return "<span class='label'>删除</span>";
													}
												}
											}
										});
						
						$.each(result.data.data, function(i, plan) {//java-增强for
							plan.planCometime = new Date(plan.planCometime)
									.Format("yyyy-MM-dd");
							plan.planCommittime = new Date(plan.planCommittime)
									.Format("yyyy-MM-dd");
							plan.planWorkstarttime = new Date(plan.planWorkstarttime)
									.Format("yyyy-MM-dd");
							plan.planWorkendtime = new Date(plan.planWorkendtime)
									.Format("yyyy-MM-dd");
							planMap[plan.id] = plan;//result.data.data等同于List<mesOrder>
							//plan.id-plan  map key-value
						});
						$('#planList').html(rendered);
					} else {
						$('#planList').html('');
					}
                    bindPlanClick();//更新操作
					var pageSize = $("#pageSize").val();
					var pageNo = $("#planPage .pageNo").val() || 1;
					//渲染页码
					renderPage(
							url,
							result.data.total,
							pageNo,
							pageSize,
							result.data.total > 0 ? result.data.data.length : 0,
							"planPage", loadPlanList);
				} else {
					showMessage("获取订单列表", result.msg, false);
				}
			}
			//////////////////////////////////////////////////////////////
			$(".plan-add").click(
			function() {
				//弹出框
				$("#dialog-plan-form").dialog(
						{
							model : true,//背景不可点击
							title : "新建订单",//模态框标题
							open : function(event, ui) {
								$(".ui-dialog").css("width", "700px");//增加模态框的宽高
								$(".ui-dialog-titlebar-close",
										$(this).parent()).hide();//关闭默认叉叉
								optionStr = "";
								$("#planForm")[0].reset();//清空模态框--jquery 将指定对象封装成了dom对象
							},
							buttons : {
								"添加" : function(e) {
									//阻止一下默认事件
									e.preventDefault();
									//发送新增plan的数据和接收添加后的回收信息
									updateOrder(true, function(data) {
										//增加成功了
										//提示增加用户成功信息
										showMessage("新增订单", data.msg,
												true);
										$("#dialog-plan-form").dialog(
												"close");
			                         	loadOrderList();//根据参数查看
									}, function(data) {
										//增加失败了
										//						alert("添加失败了");
										//信息显示
										showMessage("新增订单", data.msg,
												false);
										//						$("#dialog-plan-form").dialog("close");
									});
								},
								"取消" : function() {
									$("#dialog-plan-form").dialog(
											"close");
								}
							}
						});
			});			
			//////////////////////////////////////////////////////////////
			function bindPlanClick(){
				   $(".plan-edit").click(function(e) {
					//阻止默认事件
		            e.preventDefault();
					//阻止事件传播
		            e.stopPropagation();
					//获取planid
		            var planId = $(this).attr("data-id");
					//弹出plan的修改弹窗 
		            $("#dialog-planUpdate-form").dialog({
		                model: true,
		                title: "编辑订单",
		                open: function(event, ui) {
		             	    $(".ui-dialog").css("width","600px");
		                    $(".ui-dialog-titlebar-close", $(this).parent()).hide();
		                  	//将form表单中的数据清空，使用jquery转dom对象
		                    $("#planUpdateForm")[0].reset();
		                  	//拿到map中以键值对，id-plan对象结构的对象,用来向form表单中传递数据
		                    var targetOrder = planMap[planId];
		                  	//如果取出这个对象
		                    if (targetOrder) {
								/////////////////////////////////////////////////////////////////
								$("#input-Id2").val(targetOrder.id);
								$("#input-planOrderid2").val(targetOrder.planOrderid);
								$("#input-planClientname2").val(targetOrder.planClientname);
								$("#input-planProductname2").val(targetOrder.planProductname);
								$("#input-planContractid2").val(targetOrder.planContractid);
								$("#input-planImgid2").val(targetOrder.planImgid);
								$("#input-planMaterialname2").val(targetOrder.planMaterialname);
								$("#input-planMaterialdesc2").val(targetOrder.planMaterialdesc);
								$("#input-planCometime2").val(targetOrder.planCometime);
								$("#input-planCommittime2").val(targetOrder.planCommittime);
								$("#input-planWorkstarttime2").val(targetOrder.planWorkstarttime);
								$("#input-planWorkendtime2").val(targetOrder.planWorkendtime);
								$("#input-planInventorystatus2").val(targetOrder.planInventorystatus);
								$("#input-planSalestatus2").val(targetOrder.planSalestatus);
								$("#input-planMaterialsource2").val(targetOrder.planMaterialsource);
								$("#input-planHurrystatus2").val(targetOrder.planHurrystatus);
								$("#input-planStatus2").val(targetOrder.planStatus);
								$("#input-planRemark2").val(targetOrder.planRemark);
								/////////////////////////////////////////////////////////////////
		                    }
		                },
		                buttons : {
		                    "更新": function(e) {
		                        e.preventDefault();
		                        updateOrder(false, function (data) {
		                            $("#dialog-planUpdate-form").dialog("close");
		            				$("#planPage .pageNo").val(1);
		            				loadPlanList();
		                        }, function (data) {
		                            showMessage("更新订单", data.msg, false);
		                        })
		                    },
		                    "取消": function (data) {
		                        $("#dialog-planUpdate-form").dialog("close");
		                    }
		                }
		            });
		        });
			   }  
			//////////////////////////////////////////////////////////////
			//新增和修改plan的通用方法-dml
		//isCreate是否是新增订单(true,false)，如果不是，执行修改
		//successCallbak function(data)  failCallbak function(data)
		function updateOrder(isCreate, successCallbak, failCallbak) {
			$.ajax({
				url : isCreate ? "/plan/insert.json"
						: "/plan/update.json",
				data : isCreate ? $("#planForm").serializeArray() : $(
						"#planUpdateForm").serializeArray(),
				type : 'POST',
				success : function(result) {
					//数据执行成功返回的消息
					if (result.ret) {
						loadPlanList(); // 带参数回调
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
			
			$('.datepicker2').datepicker({
				dateFormat : 'yy-mm-dd',
				showOtherMonths : true,
				selectOtherMonths : false
			});
			
		});
