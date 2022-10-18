<%-- 
    Document   : barChart
    Created on : 15 oct. 2022, 18:50:49
    Author     : YC
--%>

<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.io.File"%>
<%@page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="org.jfree.chart.ChartRenderingInfo"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "1 Star"); map.put("y", 8889513); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2 Star"); map.put("y", 3168220); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "3 Star"); map.put("y", 6611718); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "4 Star"); map.put("y", 11331319); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "5 Star"); map.put("y", 43476553); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>
<%
            final DefaultPieDataset data = new DefaultPieDataset();
             data.setValue("one", new Double(29.26));
             data.setValue("two", (10.0));
            data.setValue("three", new Double(27.5));
               data.setValue("four", new Double(17.5));
             data.setValue("five", new Double(11.0));
             data.setValue("six", new Double(19.4));

              JFreeChart chart = ChartFactory.createPieChart
              ("Pie Chart ", data, true, true, false);

              try {
              final ChartRenderingInfo info = new 
                   ChartRenderingInfo(new StandardEntityCollection());

              final File file1 = new File(getServletContext().getRealPath(".") + "/piechart.png");
            ChartUtilities.saveChartAsPNG(
            file1, chart, 600, 400, info);
              } catch (Exception e) {
            out.println(e);
              }
           %>
        
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: "Facebook for Android - App Rating"
	},
	subtitles: [{
		text: "December 2017"
	}],
	axisY: {
		title: "Number of Users",
		labelFormatter: addSymbols
	},
	data: [{
		type: "bar",
		indexLabel: "{y}",
		indexLabelFontColor: "#444",
		indexLabelPlacement: "inside",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
function addSymbols(e) {
	var suffixes = ["", "K", "M", "B"];
 
	var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);
	if(order > suffixes.length - 1)
	order = suffixes.length - 1;
 
	var suffix = suffixes[order];
	return CanvasJS.formatNumber(e.value / Math.pow(1000, order)) + suffix;
}
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html> 
