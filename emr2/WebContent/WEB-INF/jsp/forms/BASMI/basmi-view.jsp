<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>BAS-G Form</title>
	<meta charset="utf-8">
	
</head>

<body>

<div id="wrap">
<jsp:include page="../../headers/doctor-header.jsp">
	<jsp:param name="title" value="Doctor Home" />
	<jsp:param name="selected" value="patients" />
</jsp:include>

<div class="pageCtrl">
<ul class="ctrlBtn">
	<li><span class="btn">
		<form:form commandName="form" action="BASG_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_basg.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="delete_basg.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Delete" class="btnDel" onclick="myFunction()"/>
		</form:form>
	</span></li>
</ul>
</div>

<div class="pageCtrl">
</div>

<div class="content-wrap">
	
	<div class="wrapper">		

	
	<div class="tabs">
			<jsp:include page="../../headers/patient-header.jsp">
				<jsp:param name="selected" value="forms" />
			</jsp:include>
	
		<form class="crmForm">
			<div class="tab-content">
				<section class="settingBody clrfix">		
					<div class = "left">
						<jsp:include page="../../headers/patient-left.jsp" />
					</div>
					
						<div class="right">
					<p class="titles">Bath Ankylosing Spondylitis Metrology Index (BASMI)</p><br>	
				

					<br>
					<h3>Lateral lumbar flexion:</h3><br> Patient stands with heels and buttocks touching the wall, knees straight, shoulders
						back, hands by the side. The patient is then asked to bend to the right side as far as possible without lifting the
						left foot/heel or flexing the right knee, and maintaining a straight posture with heels, buttocks, and shoulders
						against the wall. The distance from the third fingertip to the floor when patient bends to the side, is subtracted
						from the distance when patient stands upright. The manoeuvre is repeated on the left side.<br><br>
					<table border="1px;">
					<tr>
					<td>Assessment:
					<td>0<br> 20
					<td>1<br>18-20
					<td>2<br>15,9-18,9
					<td>3<br>13,8-15,8
					<td>4<br>11,7-13,79
					<td>5<br>9,6-11,6
					<td>6<br>7,5-9,5
					<td>7<br>5,4-7,4
					<td>8<br>3,3-5,3
					<td>9<br>1,2-3,2
					<td>10<br>< 1,2
					</tr>
					
					<tr>
						<td>Score:</td>
						<td colspan="9">${form.q1 }</td>
					</tr>	
					</table>
					
					
					<h3>Tragus-to-wall distance</h3><br> Maintain same starting position as above. Ensure head in as neutral position (anatomical
					alignment) as possible, chin drawn in as far as possible. Measure distance between tragus of the ear
					and wall on both sides, using a rigid ruler. Ensure no cervical extension, rotation, flexion or side flexion occurs.<br><br>
					
										<table>
					<tr>
					<td>Assessment:
					<td>0<br>< 10
					<td>1<br>10-12
					<td>2<br>13-15
					<td>3<br>16-18
					<td>4<br>19-21
					<td>5<br>22-24
					<td>6<br>25-27
					<td>7<br>28-30
					<td>8<br>31-33
					<td>9<br>34-36
					<td>10<br>> 36
					</tr>
					
					<tr>
						<td>Score:</td>
						<td colspan="9">${form.q2 }</td>
					</tr>							
					</table>
					
					 
					
					<h3>Lumbar flexion (modified Schober)</h3><br>With the patient standing upright, place a mark at the lumbosacral
junction (at the level of the dimples of Venus on both sides). Further marks are placed 5 cm below and 10 cm
above . Measure the distraction of these two marks when the patient bends forward as far as possible, keeping
the knees traight.<br><br>


					<table>
					<tr>
					<td>Assessment:
					<td>0<br>> 7,0
					<td>1<br>6,4-7,0
					<td>2<br>5,7-6,3
					<td>3<br>5,0-5,6
					<td>4<br>4,3-4,9
					<td>5<br>3,6-4,2
					<td>6<br>2,9-3,5
					<td>7<br>2,2-2,8
					<td>8<br>1,5-2,1
					<td>9<br>0,8-1,4
					<td>10<br>< 0,8
					</tr>
					
					<tr>
						<td>Score:</td>
						<td colspan="9">${form.q3 }</td>
					</tr>							
					</table>
					
					 
					
					<h3>Maximal intermalleolar distance:</h3><br> Patient supine on the floor or a wide plinth, with the knees straight and the
feet pointing straight up. Patient is asked to separate legs along the resting surface as far as possible. Distance
between medial malleoli is measured.<br><br>
					
										<table>
					<tr>
					<td>Assessment:
					<td>0<br>> 119
					<td>1<br>110-119
					<td>2<br>100-109
					<td>3<br>90-99
					<td>4<br>80-89
					<td>5<br>70-79
					<td>6<br>60-69
					<td>7<br>50-59
					<td>8<br>40-49
					<td>9<br>30-39
					<td>10<br>< 30
					</tr>
					
					<tr>
						<td>Score:</td>
						<td colspan="9">${form.q4 }</td>
					</tr>								
					</table>
					
					 
					
					
					<h3>Cervical rotation:</h3><br> Patient supine on plinth, head in neutral position, forehead horizontal (if necessary head on
pillow or foam block to allow this, must be documented for future reassessments). Gravity goniometer placed
centrally on the forehead. Patient rotates head as far as possible, keeping shoulders still, ensure no neck flexion
or side flexion occurs.<br><br>
					
										<table>
					<tr>
					<td>Assessment:
					<td>0<br>> 85,0
					<td>1<br>76,6-85
					<td>2<br>68,1-76,5
					<td>3<br>59,6-68,0
					<td>4<br>51,1-59,5
					<td>5<br>42,6-51,0
					<td>6<br>34,1-42,5
					<td>7<br>25,6-34,0
					<td>8<br>17,1-25,5
					<td>9<br>8,6-17,0
					<td>10<br>< 8,6
					</tr>
					
					<tr>
						<td>Score:</td>
						<td colspan="9">${form.q5 }</td>
					</tr>							
					</table>
					<br><br>
					<h3>BASMI Score : ${form.score }</h3>
					 
	</div>
	
		</section>
		<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li> |
								<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li> |
								<li><label>Created By</label>:  <span>${ form.getRevisionHistory().getCreatedBy().getUsername() }</span></li>
							</ul>
						</section>
					</div>		
</div></form></div></div></div>
	
						
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
</body>
</html>