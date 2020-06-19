<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body{
	width:99%;
	height:98%;
}
div{
float:left;
	width:50%;
	height:50%;
}
</style>
</head>
<body>
<div id = "div1" ></div>
<div id = "div2" ></div>
<div id = "div3" ></div>
<div id = "div4" ></div>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript" src= "static/echarts/echarts.min.js"></script>
<script type="text/javascript">
var $ = layui.$;
$.ajaxSettings.async = false;
// 基于准备好的dom，初始化echarts实例
var myChart1 = echarts.init(document.getElementById('div1'));
var myChart2 = echarts.init(document.getElementById('div2'));
var myChart3 = echarts.init(document.getElementById('div3'));
var myChart4 = echarts.init(document.getElementById('div4'));

var tabledata1;
$.post("total_sales",function(d){
	tabledata1=d;
});
var tabledata2;
$.post("cust_total_sales",function(d){
	tabledata2=d;
});
var tabledata3;
$.post("total_count",function(d){
	tabledata3=d;
});
var tabledata4;
$.post("month_sales",function(d){
	tabledata4=d;
	//console.log(tabledata3.name);
	//console.log(tabledata3.count);
});
// 指定图表的配置项和数据
var option1 = {
	title : {
		text : '业务员销售总额'
	},
	/* 用于右上角的三个按钮 */
	toolbox: {
        feature: {
            dataView: {readOnly: false},
            restore: {},
            saveAsImage: {}
        }
    },
	tooltip : {},
	legend : {
		data : tabledata1.name
	},
	xAxis : {
		data : tabledata1.name
	},
	yAxis : {},
	series : [ {
		label: {
            show: true,
            position: 'inside'
        },
		name : '销量',
		type : 'bar',
		data : tabledata1.money
	} ]
};


var option2 = {
		title : {
			text : '当年每月销售额度',
			subtext: '未显示的月份销售金额为0'
		},
		/* 用于右上角的三个按钮 */
		toolbox: {
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
		tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c}"
	    },
	    xAxis: {
	        type: 'category',
	        data: tabledata4.month
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [{
	    	name:'本月销售总金额',
            type:'funnel',
            left: '-5%',//靠左显示
            top: 60,//离顶部多少
            //x2: 80,
            bottom: 60,
            width: '100%',
            gap: 2,
            labelLine: {
                length: 10,
                lineStyle: {
                    width: 1,
                    type: 'normal'
                }
            },
            itemStyle: {
                borderColor: '#fff',
                borderWidth: 1
            },
            emphasis: {
                label: {
                    fontSize: 20
                }
            },
	        data: tabledata4.month_sales,
	        type: 'line'
	    }]
	};

var option3 = {
	    title: {
	        text: '客户付款总额',
	        //subtext: '纯属虚构'
	        left: '10%'
	    },
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c}元"
	    },
	    toolbox: {
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    }, legend: {
	    	 orient: 'vertical',//表头垂直
	    	 top:25,
		        right: 5,
		        data:tabledata2.name
	    },
	    series: [
	        {
	            name:'该客户付款总额',
	            type:'funnel',
	            left: '5%',//靠左显示
	            top: 60,//离顶部多少
	            //x2: 80,
	            bottom: 60,
	            width: '80%',
	            // height: {totalHeight} - y - y2,
	            min: 0,
	            max: 200000,
	            minSize: '0%',
	            maxSize: '100%',
	            sort: 'descending',
	            gap: 2,
	            label: {
	                show: true,
	                position: 'inside'
	            },
	            labelLine: {
	                length: 10,
	                lineStyle: {
	                    width: 1,
	                    type: 'solid'
	                }
	            },
	            itemStyle: {
	                borderColor: '#fff',
	                borderWidth: 1
	            },
	            emphasis: {
	                label: {
	                    fontSize: 20
	                }
	            },
	            data: tabledata2.zong
	        }
	    ]
	};
var option4 = {
		 title: {
		        text: '业务员的回访总量',
		        //subtext: '纯属虚构'
		        left: '10%'
		    },
	    tooltip: {
	        trigger: 'item',
	        formatter: '{a} <br/>{b}: {c} ({d}%)'
	    },
	    
	    toolbox: {
	        feature: {
	            dataView: {readOnly: false},
	            restore: {},
	            saveAsImage: {}
	        }
	    }, 
	    legend: {
	    	orient: 'vertical',//表头垂直
	    	 top:25,
		        right: 5,
	        data: tabledata3.name
	    },
	    series: [
	        {
	            name: '该业务员的回访总量',
	            type: 'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: false,
	            label: {
	                show: false,
	                position: 'center'
	            },
	            emphasis: {
	                label: {
	                    show: true,
	                    fontSize: '30',
	                    fontWeight: 'bold'
	                }
	            },
	            labelLine: {
	                show: false
	            },
	            data: tabledata3.count
	        }
	    ]
	};

// 使用刚指定的配置项和数据显示图表。
myChart1.setOption(option1);
myChart2.setOption(option2);
myChart3.setOption(option3);
myChart4.setOption(option4);


</script>
</body>
</html>