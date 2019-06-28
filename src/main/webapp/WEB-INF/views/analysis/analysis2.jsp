<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0;padding:0;}
	.clear{zoom:1}
	.clear:after{clear:both;content:"";display:block;}
</style>
<script src="/js/echarts.min.js"></script>
</head>
<body>


	
	<div class="clear">
		<div id="main3" style="width: 550px; height: 400px;float:left;"></div>
		<div id="main4" style="width: 550px; height: 400px;float:left;"></div>
	</div>
	<script>
	var app = echarts.init(document.getElementById('main4'));

	var posList = [
	    'left', 'right', 'top', 'bottom',
	    'inside',
	    'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
	    'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
	];

	app.configParameters = {
	    rotate: {
	        min: -90,
	        max: 90
	    },
	    align: {
	        options: {
	            left: 'left',
	            center: 'center',
	            right: 'right'
	        }
	    },
	    verticalAlign: {
	        options: {
	            top: 'top',
	            middle: 'middle',
	            bottom: 'bottom'
	        }
	    },
	    position: {
	        options: echarts.util.reduce(posList, function (map, pos) {
	            map[pos] = pos;
	            return map;
	        }, {})
	    },
	    distance: {
	        min: 0,
	        max: 100
	    }
	};

	app.config = {
	    rotate: 90,
	    align: 'left',
	    verticalAlign: 'middle',
	    position: 'insideBottom',
	    distance: 15,
	    onChange: function () {
	        var labelOption = {
	            normal: {
	                rotate: app.config.rotate,
	                align: app.config.align,
	                verticalAlign: app.config.verticalAlign,
	                position: app.config.position,
	                distance: app.config.distance
	            }
	        };
	        myChart.setOption({
	            series: [{
	                label: labelOption
	            }, {
	                label: labelOption
	            }, {
	                label: labelOption
	            }, {
	                label: labelOption
	            }]
	        });
	    }
	};


	var labelOption = {
	    normal: {
	        show: true,
	        position: app.config.position,
	        distance: app.config.distance,
	        align: app.config.align,
	        verticalAlign: app.config.verticalAlign,
	        rotate: app.config.rotate,
	        formatter: '{c}  {name|{a}}',
	        fontSize: 16,
	        rich: {
	            name: {
	                textBorderColor: '#fff'
	            }
	        }
	    }
	};

	option = {
	    color: ['#003366', '#006699', '#4cabce', '#e5323e'],
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            type: 'shadow'
	        }
	    },
	    legend: {
	        data: ['成品', '半成品', '废品', '原料']
	    },
	    toolbox: {
	        show: true,
	        orient: 'vertical',
	        left: 'right',
	        top: 'center',
	        feature: {
	            mark: {show: true},
	            dataView: {show: true, readOnly: false},
	            magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	            restore: {show: true},
	            saveAsImage: {show: true}
	        }
	    },
	    calculable: true,
	    xAxis: [
	        {
	            type: 'category',
	            axisTick: {show: false},
	            data: ['一月', '二月', '三月', '四月', '五月']
	        }
	    ],
	    yAxis: [
	        {
	            type: 'value'
	        }
	    ],
	    series: [
	        {
	            name: 'Forest',
	            type: 'bar',
	            barGap: 0,
	            label: labelOption,
	            data: [320, 332, 301, 334, 390]
	        },
	        {
	            name: 'Steppe',
	            type: 'bar',
	            label: labelOption,
	            data: [220, 182, 191, 234, 290]
	        },
	        {
	            name: 'Desert',
	            type: 'bar',
	            label: labelOption,
	            data: [150, 232, 201, 154, 190]
	        },
	        {
	            name: 'Wetland',
	            type: 'bar',
	            label: labelOption,
	            data: [98, 77, 101, 99, 40]
	        }
	    ]
	};
	app.setOption(option);
	</script>
	<script>
		var myChart = echarts.init(document.getElementById('main3'));
		var option = {
			    legend: {},
			    tooltip: {},
			    dataset: {
			        source: [
			            ['product', '2012', '2013', '2014', '2015', '2016', '2017'],
			            ['订单', 41.1, 30.4, 65.1, 53.3, 83.8, 98.7],
			            ['计划', 86.5, 92.1, 85.7, 83.1, 73.4, 55.1],
			            ['材料', 24.1, 67.2, 79.5, 86.4, 65.2, 82.5],
			            ['库存', 55.2, 67.1, 69.2, 72.4, 53.9, 39.1]
			        ]
			    },
			    series: [{
			        type: 'pie',
			        radius: 60,
			        center: ['25%', '30%']
			        // No encode specified, by default, it is '2012'.
			    }, {
			        type: 'pie',
			        radius: 60,
			        center: ['75%', '30%'],
			        encode: {
			            itemName: 'product',
			            value: '2013'
			        }
			    }, {
			        type: 'pie',
			        radius: 60,
			        center: ['25%', '75%'],
			        encode: {
			            itemName: 'product',
			            value: '2014'
			        }
			    }, {
			        type: 'pie',
			        radius: 60,
			        center: ['75%', '75%'],
			        encode: {
			            itemName: 'product',
			            value: '2015'
			        }
			    }]
			};
		myChart.setOption(option);
	</script>
	<script>
		var myChart = echarts.init(document.getElementById('main2'));
		option = {
			    title: {
			        text: '分析'
			    },
			    tooltip : {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'cross',
			            label: {
			                backgroundColor: '#6a7985'
			            }
			        }
			    },
			    legend: {
			        data:['xxx','yyy','zzz','aaa','bbb']
			    },
			    toolbox: {
			        feature: {
			            saveAsImage: {}
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            data : ['周一','周二','周三','周四','周五','周六','周日']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'xxxx',
			            type:'line',
			            stack: '总量',
			            areaStyle: {},
			            data:[120, 132, 101, 134, 90, 230, 210]
			        },
			        {
			            name:'zzzz',
			            type:'line',
			            stack: '总量',
			            areaStyle: {},
			            data:[220, 182, 191, 234, 290, 330, 310]
			        },
			        {
			            name:'yyyy',
			            type:'line',
			            stack: '总量',
			            areaStyle: {},
			            data:[150, 232, 201, 154, 190, 330, 410]
			        },
			        {
			            name:'iiii',
			            type:'line',
			            stack: '总量',
			            areaStyle: {normal: {}},
			            data:[320, 332, 301, 334, 390, 330, 320]
			        },
			        {
			            name:'uuuu',
			            type:'line',
			            stack: '总量',
			            label: {
			                normal: {
			                    show: true,
			                    position: 'top'
			                }
			            },
			            areaStyle: {normal: {}},
			            data:[820, 932, 901, 934, 1290, 1330, 1320]
			        }
			    ]
			};
		myChart.setOption(option);
	</script>
	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '数据呈现模板'
			},
			tooltip : {},
			legend : {
				data : [ '数量' ]
			},
			xAxis : {
				data : [ "钢锭", "外购件", "外协件", "废料", "成品", "半成品" ]
			},
			yAxis : {},
			series : [ {
				name : '数量',
				type : 'bar',
				data : [ 5, 20, 36, 10, 10, 20 ]
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
	
	
</body>
</html>