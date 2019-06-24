$(function() {//页面开始加载
			//执行分页逻辑
			//定义一些全局变量
			var stepMap = {};//准备一个map格式的仓库，等待存储从后台返回过来的数据
			var optionStr;//选项参数
			var pageSize;//页码条数
			var pageNo;//当前页
			var url;//查询url
			//加载模板内容进入html
			//01从模板中获取页面布局内容
			//orderListTemplate就是mustache模板的id值
			var stepListTemplate = $("#stepListTemplate").html();
			//02使用mustache模板加载这串内容
			//只是把准备好的页面模板拿出来，放在解析引擎中，准备让引擎往里面填充数据（渲染视图）
			Mustache.parse(stepListTemplate);
			//渲染分页列表
			//调用分页函数
			loadStepList();
			//定义调用分页函数，一定是当前的查询条件下（keyword，search_status。。）的分页
			function loadStepList(urlnew) {
				if (urlnew) {
					url = urlnew;
				} else {
					url = "/step/step.json";
				}
				//发送请求
				$.ajax({
					url : url,
					data : {//左面是数据名称-键，右面是值
						pageNo : 1,
						pageSize : 1000000
					},
					type : 'POST',
					success : function(result) {//jsondata  jsondata.getData=pageResult  pageResult.getData=list
						//渲染order列表和页面--列表+分页一起填充数据显示条目
						renderStepListAndPage(result, url);
					}
				});
			}
			//渲染所有的mustache模板页面
			//result中的存储数据，就是一个list<MesOrder>集合,是由service访问数据库后返回给controller的数据模型
			function renderStepListAndPage(result, url) {
				//从数据库返回过来的数据集合result
				if (result.ret) {
					//再次初始化查询条件
					url = "/step/step.json";
					//如果查询到数据库中有符合条件的order列表
					if (result.data.total > 0) {
						var rendered = Mustache.render(stepListTemplate,{"stepList":result.data.data});
						$.each(result.data.data, function(i, step) {//java-增强for
							stepMap[step.id] = step;//result.data.data等同于List<mesOrder>
						});
						$('#stepList').html(rendered);
					} else {
						$('#stepList').html('');
					}
					bindStepClick();//更新操作
					/*var pageSize = 10000000;
					var pageNo = 1;
					//渲染页码
					renderPage(
							url,
							result.data.total,
							pageNo,
							pageSize,
							result.data.total > 0 ? result.data.data.length : 0,
							"stepPage", loadStepList);*/
				} else {
					showMessage("获取订单列表", result.msg, false);
				}
			}
			//////////////////////////////////////////////////////////////
			$(".step-add").click(function() {
				//弹出框
				$("#dialog-step-form").dialog(
						{
							model : true,//背景不可点击
							title : "新建工序",//模态框标题
							open : function(event, ui) {
								$(".ui-dialog").css("width", "700px");//增加模态框的宽高
								$(".ui-dialog-titlebar-close",
										$(this).parent()).hide();//关闭默认叉叉
								optionStr = "";
								$("#stepForm")[0].reset();//清空模态框--jquery 将指定对象封装成了dom对象
							},
							buttons : {
								"添加" : function(e) {
									//阻止一下默认事件
									e.preventDefault();
									//发送新增order的数据和接收添加后的回收信息
									updateOrder(true, function(data) {
										//增加成功了
										//提示增加用户成功信息
										showMessage("新增库房", data.msg,
												true);
										$("#dialog-step-form").dialog(
												"close");
										loadStepList();//根据参数查看
									}, function(data) {
										//增加失败了
										//						alert("添加失败了");
										//信息显示
										showMessage("新增库房", data.msg,
												false);
										//						$("#dialog-order-form").dialog("close");
									});
								},
								"取消" : function() {
									$("#dialog-step-form").dialog(
											"close");
								}
							}
						});
			});			
			//////////////////////////////////////////////////////////////
			function bindStepClick(){
				   $(".step-edit").click(function(e) {
					//阻止默认事件
		            e.preventDefault();
					//阻止事件传播
		            e.stopPropagation();
					//获取orderid
		            var stepId = $(this).attr("data-id");
					//弹出order的修改弹窗 
		            $("#dialog-stepUpdate-form").dialog({
		                model: true,
		                title: "编辑订单",
		                open: function(event, ui) {
		             	    $(".ui-dialog").css("width","600px");
		                    $(".ui-dialog-titlebar-close", $(this).parent()).hide();
		                  	//将form表单中的数据清空，使用jquery转dom对象
		                    $("#stepUpdateForm")[0].reset();
		                  	//拿到map中以键值对，id-order对象结构的对象,用来向form表单中传递数据
		                    var targetStep = stepMap[stepId];
		                  	//如果取出这个对象
		                    if (targetStep) {
								/////////////////////////////////////////////////////////////////
								$("#input-Id2").val(targetStep.id);
								$("#input-stepName2").val(targetStep.stepName);
								$("#input-stepRemark2").val(targetStep.stepRemark);
								/////////////////////////////////////////////////////////////////
		                    }
		                },
		                buttons : {
		                    "更新": function(e) {
		                        e.preventDefault();
		                        updateOrder(false, function (data) {
		                            $("#dialog-stepUpdate-form").dialog("close");
		            				$("#stepPage .pageNo").val(1);
		            				loadStepList ();
		                        }, function (data) {
		                            showMessage("更新库房", data.msg, false);
		                        })
		                    },
		                    "取消": function (data) {
		                        $("#dialog-stepUpdate-form").dialog("close");
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
				url : isCreate ? "/step/insert.json"
						: "/step/update.json",
				data : isCreate ? $("#stepForm").serializeArray() : $(
						"#stepUpdateForm").serializeArray(),
				type : 'POST',
				success : function(result) {
					//数据执行成功返回的消息
					if (result.ret) {
						loadStepList(); // 带参数回调
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
