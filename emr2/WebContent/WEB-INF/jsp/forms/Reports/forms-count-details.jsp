<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Interactive Line Graph</title>
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.6.1.min.js"></script>
        
        
        <%@ page import="java.util.List" %>
         <%@ page import="com.ust.emr.model.forms.BASDAI;" %>
        
        <script>
            var graph;
            var xPadding = 30;
            var yPadding = 30;
            
           /*var data = { values:[
                { X: "8/7/12", Y: 21 },
                { X: "8/8/12", Y: 32 },
                { X: "8/9/12", Y: 62 },
                { X: "8/10/12", Y: 8 },
                { X: "8/11/12", Y: 40 },
                { X: "8/12/12", Y: 12 },
                { X: "8/13/12", Y: 14 },
                { X: "8/14/12", Y: 72 },
                { X: "8/15/12", Y: 11 },
                { X: "8/16/12", Y: 98 },
				
            ]};*/
            
            var datess = new Array();
            <%
            String[] dates = request.getParameterValues("dates");
            for(int i=0; i < 2; i++) { %>
          	 	datess[<%= i %> ] = '<%=dates[i] %>';
            <%}%>
            
            var scoress = new Array();
            <%
            String[] scores = request.getParameterValues("scores");
            for(int i=0; i < scores.length; i++) { %>
           	 scoress[<%= i %> ] = '<%=scores[i] %>';
  	   	 <%}%>	  
                     
  	  		 var data = { values:[
             <%for(int i=0; i < scores.length; i++) { %>            
                  { X: datess[<%= i %> ], Y: scoress[<%= i %> ] },
                 
              <%}%>
              ]};
            /*
            var data = { values:[
			<c:forEach items="${monthForms}" var="form" varStatus="status">  
			    {X: "${form.revisionHistory.dateCreated}",
			    Y: "${form.score}", 	  
			    }
            </c:forEach> 
            ]};)*/

            
       
            
            
            // Returns the max Y value in our data list
            function getMaxY() {
                var max = 0;
                
                for(var i = 0; i < data.values.length; i ++) {
                    if(data.values[i].Y > max) {
                        max = data.values[i].Y;
                    }
                }
                
                max += 10 - max % 10;
                return max;
            }
            
            // Return the x pixel for a graph point
            function getXPixel(val) {
                return ((graph.width() - xPadding) / data.values.length) * val + (xPadding * 1.5);
            }
            
            // Return the y pixel for a graph point
            function getYPixel(val) {
                return graph.height() - (((graph.height() - yPadding) / getMaxY()) * val) - yPadding;
            }

            $(document).ready(function() {
                graph = $('#graph');
                var c = graph[0].getContext('2d');            
                
                c.lineWidth = 2;
                c.strokeStyle = '#333';
                c.font = 'italic 8pt sans-serif';
                c.textAlign = "center";
                
                // Draw the axises
                c.beginPath();
                c.moveTo(xPadding, 0);
                c.lineTo(xPadding, graph.height() - yPadding);
                c.lineTo(graph.width(), graph.height() - yPadding);
                c.stroke();
                
                // Draw the X value texts
                for(var i = 0; i < data.values.length; i ++) {
                    c.fillText(data.values[i].X, getXPixel(i), graph.height() - yPadding + 20);
                }
                
                // Draw the Y value texts
                c.textAlign = "right"
                c.textBaseline = "middle";
                
                for(var i = 0; i < getMaxY(); i += 10) {
                    c.fillText(i, xPadding - 10, getYPixel(i));
                }
                
                c.strokeStyle = '#f00';
                
                // Draw the line graph
                c.beginPath();
                c.moveTo(getXPixel(0), getYPixel(data.values[0].Y));
                for(var i = 1; i < data.values.length; i ++) {
                    c.lineTo(getXPixel(i), getYPixel(data.values[i].Y));
                }
                c.stroke();
                
                // Draw the dots
                c.fillStyle = '#333';
                
                for(var i = 0; i < data.values.length; i ++) {  
                    c.beginPath();
                    c.arc(getXPixel(i), getYPixel(data.values[i].Y), 4, 0, Math.PI * 2, true);
                    c.fill();
                }
            });
        </script>
    </head>
    <body>
        <canvas id="graph" style="padding-left:100px;" width="500" height="550">   
        </canvas> 
    </body>
</html>