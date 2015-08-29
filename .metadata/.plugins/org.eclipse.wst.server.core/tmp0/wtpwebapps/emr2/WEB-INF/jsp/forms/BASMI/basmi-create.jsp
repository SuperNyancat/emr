<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create BASMI10e Form</title>
	<meta charset="utf-8">
</head>

<body>
<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl">

</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	<div class="wrapper prospects">
		<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="forms" />
			</jsp:include>
 
		<div class="tab-content">
			<section class="settingBody clrfix">		
						<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
			
			
			
			
			<div class="right">
			<p class="titles"></p><br>	
				<form:form action="basmi_create.it?id=${patient.id }" method="post" commandName="form">

				
<div class="right">
				<p class="titles">Bath Ankylosing Spondylitis Metrology Index</p><br>	
				

					<br>
					<h3>Lateral lumbar flexion:</h3><br> Patient stands with heels and buttocks touching the wall, knees straight, shoulders
						back, hands by the side. The patient is then asked to bend to the right side as far as possible without lifting the
						left foot/heel or flexing the right knee, and maintaining a straight posture with heels, buttocks, and shoulders
						against the wall. The distance from the third fingertip to the floor when patient bends to the side, is subtracted
						from the distance when patient stands upright. The manoeuvre is repeated on the left side.<br><br>
					<table border="1px;">
					<tr>
					<td>Assessment:
					<td><br> 20
					<td><br>18-20
					<td><br>15,9-18,9
					<td><br>13,8-15,8
					<td><br>11,7-13,79
					<td><br>9,6-11,6
					<td><br>7,5-9,5
					<td><br>5,4-7,4
					<td><br>3,3-5,3
					<td><br>1,2-3,2
					<td><br>< 1,2
					</tr>
					
					<tr>
					<td>Score:
					<td><form:radiobutton path="q1" value="0" style="margin-left:15px;" />0					
					<td><form:radiobutton path="q1" value="1" style="margin-left:15px;" />1
					<td><form:radiobutton path="q1" value="2" style="margin-left:15px;" />2
					<td><form:radiobutton path="q1" value="3" style="margin-left:15px;" />3
					<td><form:radiobutton path="q1" value="4" style="margin-left:15px;" />4
					<td><form:radiobutton path="q1" value="5" style="margin-left:15px;" />5
					<td><form:radiobutton path="q1" value="6" style="margin-left:15px;" />6
					<td><form:radiobutton path="q1" value="7" style="margin-left:15px;" />7
					<td><form:radiobutton path="q1" value="8" style="margin-left:15px;" />8
					<td><form:radiobutton path="q1" value="9" style="margin-left:15px;" />9
					<td><form:radiobutton path="q1" value="10" style="margin-left:15px;" />10

					</tr>	
					</table>
					
					
					<h3>Tragus-to-wall distance</h3><br> Maintain same starting position as above. Ensure head in as neutral position (anatomical
					alignment) as possible, chin drawn in as far as possible. Measure distance between tragus of the ear
					and wall on both sides, using a rigid ruler. Ensure no cervical extension, rotation, flexion or side flexion occurs.<br><br>
					
										<table>
					<tr>
					<td>Assessment:
					<td><br>< 10
					<td><br>10-12
					<td><br>13-15
					<td><br>16-18
					<td><br>19-21
					<td><br>22-24
					<td><br>25-27
					<td><br>28-30
					<td><br>31-33
					<td><br>34-36
					<td><br>> 36
					</tr>
					
					<tr>
					<td>Score:
					<td><form:radiobutton path="q2" value="0" style="margin-left:15px;" />0					
					<td><form:radiobutton path="q2" value="1" style="margin-left:15px;" />1
					<td><form:radiobutton path="q2" value="2" style="margin-left:15px;" />2
					<td><form:radiobutton path="q2" value="3" style="margin-left:15px;" />3
					<td><form:radiobutton path="q2" value="4" style="margin-left:15px;" />4
					<td><form:radiobutton path="q2" value="5" style="margin-left:15px;" />5
					<td><form:radiobutton path="q2" value="6" style="margin-left:15px;" />6
					<td><form:radiobutton path="q2" value="7" style="margin-left:15px;" />7
					<td><form:radiobutton path="q2" value="8" style="margin-left:15px;" />8
					<td><form:radiobutton path="q2" value="9" style="margin-left:15px;" />9
					<td><form:radiobutton path="q2" value="10" style="margin-left:15px;" />10

					</tr>								
					</table>
					
					 
					
					<h3>Lumbar flexion (modified Schober)</h3><br>With the patient standing upright, place a mark at the lumbosacral
junction (at the level of the dimples of Venus on both sides). Further marks are placed 5 cm below and 10 cm
above . Measure the distraction of these two marks when the patient bends forward as far as possible, keeping
the knees traight.<br><br>


					<table>
					<tr>
					<td>Assessment:
					<td><br>> 7,0
					<td><br>6,4-7,0
					<td><br>5,7-6,3
					<td><br>5,0-5,6
					<td><br>4,3-4,9
					<td><br>3,6-4,2
					<td><br>2,9-3,5
					<td><br>2,2-2,8
					<td><br>1,5-2,1
					<td><br>0,8-1,4
					<td><br>< 0,8
					</tr>
					
					<tr>
					<td>Score:
					<td><form:radiobutton path="q3" value="0" style="margin-left:15px;" />0					
					<td><form:radiobutton path="q3" value="1" style="margin-left:15px;" />1
					<td><form:radiobutton path="q3" value="2" style="margin-left:15px;" />2
					<td><form:radiobutton path="q3" value="3" style="margin-left:15px;" />3
					<td><form:radiobutton path="q3" value="4" style="margin-left:15px;" />4
					<td><form:radiobutton path="q3" value="5" style="margin-left:15px;" />5
					<td><form:radiobutton path="q3" value="6" style="margin-left:15px;" />6
					<td><form:radiobutton path="q3" value="7" style="margin-left:15px;" />7
					<td><form:radiobutton path="q3" value="8" style="margin-left:15px;" />8
					<td><form:radiobutton path="q3" value="9" style="margin-left:15px;" />9
					<td><form:radiobutton path="q3" value="10" style="margin-left:15px;" />10

					</tr>								
					</table>
					
					 
					
					<h3>Maximal intermalleolar distance:</h3><br> Patient supine on the floor or a wide plinth, with the knees straight and the
feet pointing straight up. Patient is asked to separate legs along the resting surface as far as possible. Distance
between medial malleoli is measured.<br><br>
					
										<table>
					<tr>
					<td>Assessment:
					<td><br>> 119
					<td><br>110-119
					<td><br>100-109
					<td><br>90-99
					<td><br>80-89
					<td><br>70-79
					<td><br>60-69
					<td><br>50-59
					<td><br>40-49
					<td><br>30-39
					<td><br>< 30
					</tr>
					
					<tr>
					<td>Score:
					<td><form:radiobutton path="q4" value="0" style="margin-left:15px;" />0					
					<td><form:radiobutton path="q4" value="1" style="margin-left:15px;" />1
					<td><form:radiobutton path="q4" value="2" style="margin-left:15px;" />2
					<td><form:radiobutton path="q4" value="3" style="margin-left:15px;" />3
					<td><form:radiobutton path="q4" value="4" style="margin-left:15px;" />4
					<td><form:radiobutton path="q4" value="5" style="margin-left:15px;" />5
					<td><form:radiobutton path="q4" value="6" style="margin-left:15px;" />6
					<td><form:radiobutton path="q4" value="7" style="margin-left:15px;" />7
					<td><form:radiobutton path="q4" value="8" style="margin-left:15px;" />8
					<td><form:radiobutton path="q4" value="9" style="margin-left:15px;" />9
					<td><form:radiobutton path="q4" value="10" style="margin-left:15px;" />10

					</tr>								
					</table>
					
					 
					
					
					<h3>Cervical rotation:</h3><br> Patient supine on plinth, head in neutral position, forehead horizontal (if necessary head on
pillow or foam block to allow this, must be documented for future reassessments). Gravity goniometer placed
centrally on the forehead. Patient rotates head as far as possible, keeping shoulders still, ensure no neck flexion
or side flexion occurs.<br><br>
					
										<table>
					<tr>
					<td>Assessment:
					<td><br>> 85,0
					<td><br>76,6-85
					<td><br>68,1-76,5
					<td><br>59,6-68,0
					<td><br>51,1-59,5
					<td><br>42,6-51,0
					<td><br>34,1-42,5
					<td><br>25,6-34,0
					<td><br>17,1-25,5
					<td><br>8,6-17,0
					<td><br>< 8,6
					</tr>
					
					<tr>
					<td>Score:
					<td><form:radiobutton path="q5" value="0" style="margin-left:13px;" />0					
					<td><form:radiobutton path="q5" value="1" style="margin-left:15px;" />1
					<td><form:radiobutton path="q5" value="2" style="margin-left:15px;" />2
					<td><form:radiobutton path="q5" value="3" style="margin-left:15px;" />3
					<td><form:radiobutton path="q5" value="4" style="margin-left:15px;" />4
					<td><form:radiobutton path="q5" value="5" style="margin-left:15px;" />5
					<td><form:radiobutton path="q5" value="6" style="margin-left:15px;" />6
					<td><form:radiobutton path="q5" value="7" style="margin-left:15px;" />7
					<td><form:radiobutton path="q5" value="8" style="margin-left:15px;" />8
					<td><form:radiobutton path="q5" value="9" style="margin-left:15px;" />9
					<td><form:radiobutton path="q5" value="10" style="margin-left:13px;" />10

					</tr>								
					</table>
					
					 
					

					

				
					
			
			
			</div>				
				
				
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Add Form" class="btnSave"></span></li>
					<a href="basmi_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel"></span></a>
					<font style="padding-left:360px"></font>
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
				</ul>
			</section>
			</form:form>
			</div>
			</section>
		</div>
		</div>
	</div>		
</div>
		
<footer>
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
</body>
</html>