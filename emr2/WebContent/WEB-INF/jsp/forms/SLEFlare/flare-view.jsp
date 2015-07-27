<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<title>SLE Flare</title>
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
		<form:form commandName="form" action="SLE_flare_table.it" method="GET">
			<form:hidden path="id" value="${patient.id }" />
			<input type="submit" value="Back To Forms" class="btnFet" />
		</form:form>
	</span></li>
	<li><span class="btn">
		<form:form commandName="form" action="edit_sle_flare.it" method="GET">
			<form:hidden path="patient.id" value="${patient.id }" />
			<form:hidden path="id" value="${form.id }" />
			<input type="submit" value="Edit" class="btnEdit" />
		</form:form>
	</span></li>
	
	<li><span class="btn"><input type="button" name="answer" value="Delete" onclick="showDiv()" class="btnDel"/></span></li>			
</ul>

	<div align="center" id="welcomeDiv"  style="display:none; background:red; padding-left:20px" class="answer_list" >
		<p style="color:white; font-size:15px; padding-top:10px;">Are you sure you want to delete?</p><br>
		<span class="btn">
			<form:form commandName="form" action="delete_flare.it" method="GET">
				<form:hidden path="patient.id" value="${patient.id }" />
				<form:hidden path="id" value="${form.id }" />
				<input type="submit" value="OK" class="btnDel"/>
			</form:form>	
		</span>
		<span class="btn"><input type="button" value="Cancel" onclick="hideDiv()" class="btnCancel"/></span>
		<br>
	</div>
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
				<div>
				<p class="titles">SLE Flare</p><br><br>
				</div>
				
			<ul>
			
			<form align="center">
				<c:forEach items="${form.getCheckbox() }" var="check">
					<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"> ${check }
				</c:forEach>
			</form><br><br/>

					<table class="tablecontent3">
					<tr>
							<th style="color:#006300;">Mild or Moderate Flare</a></td>
							<th style="color:#006300;">Sever Flare</a></td>
					</tr>
						<tr>					
							<td class="pro" align="center"><span>
							<c:choose><c:when test="${form.isMildOrMod_row1() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>Change in SLEDAI > 3 points</span></td>
							
							<td class="pro" align="center"><span><c:choose><c:when test="${form.isSevere_row1() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>Change in SLEDAI > 12</span></td>						
						</tr>
						
						
						<tr>					
							<td class="pro" align="center"><span><c:choose><c:when test="${form.isMildOrMod_row2() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>New/Worse discoid, photoscnsitive, profundus,
							cutaneous vasculitis, bullous lupus<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNasopharyngeal ulcers<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPleuritis<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPericarditis<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspArthritis<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspFever (SLE)</span></td>
							
							<td class="pro" align="center"><span><c:choose><c:when test="${form.isSevere_row2() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>New/Worse CNS-SLI:
							<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspVasculius <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNephritis <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspMyositis <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPk < 60.000<br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspHome anemia: Hb <7% or decrease in Hb > 3%<br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRequiring: double prednisone<br>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPrednisone>0.5 mg/kg/day hospitalization
							</span></td>						
						</tr>
						
						
						<tr>					
							<td class="pro" align="center"><span><c:choose><c:when test="${form.isMildOrMod_row3() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>Increase in Prednisone, but not to >0.5 mg/kg/day</span></td>
							
							<td class="pro" align="center"><span><c:choose><c:when test="${form.isSevere_row3() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>Prednisone >0.5 mg/kg/day</span></td>						
						</tr>
						
						
						<tr>					
							<td class="pro" align="center"><span><c:choose><c:when test="${form.isMildOrMod_row4() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>Added NSAID or Plaquenil<br>
							
							<c:choose><c:when test="${form.isMildOrMod_row5() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>≥1.0 Increase in PGA, but not to more than 2.5</span></td>
							
							<td class="pro" align="center"><span><c:choose><c:when test="${form.isSevere_row4() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>New Cytoxan, Azathioprine, Methotrexate, Hospitalization (SLE)<br>
							
							<c:choose><c:when test="${form.isSevere_row5() == true }">
								<img src="resources/images/check.png" alt="" style="width:20px; height:20px;"></c:when>
								<c:otherwise><img src="resources/images/x.png" alt="" style="width:20px; height:20px;"></c:otherwise>
							</c:choose>Increase in PGA to > 2.5</span></td>						
						</tr>						
										
					</table><br>
</ul>
			
			
			</div>
			</section>
			<div class="lowernav1">
						<section class="paging">
							<ul>
							<c:if test="${ form.getRevisionHistory().getDateModified() != null}">
								<li><label>Date Modified</label>:  <span>${ form.getRevisionHistory().getDateModified() }</span></li>|
								<li><label>Modified By</label>:  <span>${ form.getRevisionHistory().getModifiedBy().getUsername() }</span></li>
							</c:if>
								<br/>
								<li><label>Date Created</label>:  <span>${ form.getRevisionHistory().getDateCreated() }</span></li>|
								<li><label>Created By</label>:  <span>${ form.getRevisionHistory().getCreatedBy().getUsername() }</span></li>
							</ul>
						</section>
					</div>		
		</div>
		</div>
	</div>		
</div>
		
<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
<script>
	function showDiv() {
   document.getElementById('welcomeDiv').style.display = "block";
	}

	function hideDiv() {
   document.getElementById('welcomeDiv').style.display = "none";
	}
</script>
</body>
</html>