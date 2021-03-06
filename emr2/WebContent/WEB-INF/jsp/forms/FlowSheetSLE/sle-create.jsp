<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Create Systemic Lupus Erythematosus Flow Sheet</title>
	<meta charset="utf-8">
</head>

<body>
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
				<div>
				<p class="titles">Systematic Lupus Erythematosus Flow Sheet</p><br><br>
				</div>
				
			<ul>

<li>
<form:form action="create_SLE_flowsheet.it?id=${patient.getId() }" method="post" commandName="form">

<c:choose>

<c:when test="${previous == null }">
<table class="tablecontent2">

						<tr>
							
							<th class="navblank">&nbsp;</th>
							<th class="pro"><a href="">${date}</a></th>
						</tr>	
			
			<tr>
				<td class="pro">Weight (kg)</td>
					<td class="phn"><form:input path="weight" pattern="\\d+(\\.\\d+)?" required="true" /></td>
			</tr>	
			
			<tr>
				<td class="pro">Blood Pressure</td>
				<td class="phn"><form:input path="bloodPressure" required="true"  /></td>
			</tr>


<tr><td class="pro1"><br><h4>Laboratory</h4></td></tr>
	
				
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn"><form:input path="HgbOrHct" /></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
					<td class="phn"><form:input path="WBC" /></td>
			</tr>	
<tr>
				<td class="pro">Platelet/ESR</td>
				<td class="phn"><form:input path="PlateletOrESR" /></td>
			</tr>	
<tr>
				<td class="pro">Urine Protein</td>
				<td class="phn"><form:input path="urineProtein" /></td>
			</tr>	
<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp RBC</td>
				<td class="phn"><form:input path="RBC" /></td>
			</tr>
<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp WBC</td>
				<td class="phn"><form:input path="urineWBC" /></td>
			</tr>
<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp Casts</td>
				<td class="phn"><form:input path="casts" /></td>
			</tr>

<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp Others</td>
				<td class="phn"><form:input path="urineOthers" /></td>
			</tr>	

<tr>
				<td class="pro">Creatinine/CrCl</td>
				<td class="phn"><form:input path="crCl" /></td>
			</tr>

<tr>
				<td class="pro">C3</td>
				<td class="phn"><form:input path="c3" /></td>
			</tr>

<tr><td class="pro1"><br><h4>Clinical Data</h4></td></tr>	
	
			<tr>
				<td class="pro"></td>
				<td class="phn"><form:textarea path="clinicalData" class="textareatable" required="true" /></li></td>		
			</tr>	

<tr><td class="pro1"><br><h4>SLEDAI etc.</h4></td></tr>

			<tr>
				<td class="pro"></td>
				<td class="phn"><form:textarea path="SLEDAI" class="textareatable" /></li></td>		
			</tr>	

<tr><td class="pro1"><br><h4>Meds/Plans</h4></td></tr>

			
<tr>
				<td class="pro">Pred/methylpred</td>
				<td class="phn"><form:input path="methylpred" /></td>
			</tr>

<tr>
				<td class="pro">Hydroxychloroquine</td>
				<td class="phn"><form:input path="hydroxychloroquine" /></td>
			</tr>



			<tr>
				<td class="pro">Other Data</td>
				<td class="phn"><form:textarea path="plans" class="textareatable" /></td>		
			</tr>
			

		</table>
</c:when>











<c:when test="${previous.size() == 1 }">

<table class="tablecontent2">
					
			<tr>
				
				<th class="navblank">&nbsp;</th>
				<th class="pro"><a href="">${previous.get(0).getRevisionHistory().getDateCreated() }</a></th>
				<th class="phn"><a href="">${date}</a></th>
			</tr>	

<tr>
	<td class="pro">Weight (kg)</td>
	<td class="phn">${previous.get(0).getWeight()}</td>
		<td class="ind"><form:input path="weight" pattern="\\d+(\\.\\d+)?" required="true" /></td>
</tr>	

<tr>
	<td class="pro">Blood Pressure</td>
	<td class="phn">${previous.get(0).getBloodPressure() }</td>
	<td class="ind"><form:input path="bloodPressure" required="true" /></td>
			</tr>


<tr><td class="pro1"><br><h4>Laboratory</h4></td></tr>
	
				
			<tr>
				<td class="pro">Hgb/Hct</td>
				<td class="phn">${previous.get(0).getHgbOrHct() }</td>
	<td class="ind"><form:input path="HgbOrHct" /></td>
			</tr>	
<tr>
				<td class="pro">WBC</td>
				<td class="phn">${previous.get(0).getWBC() }</td>
		<td class="ind"><form:input path="WBC" /></td>
			</tr>	
<tr>
				<td class="pro">Platelet/ESR</td>
				<td class="phn">${previous.get(0).getPlateletOrESR() }</td>
	<td class="ind"><form:input path="PlateletOrESR" /></td>
			</tr>	
<tr>
				<td class="pro">Urine Protein</td>
				<td class="phn">${previous.get(0).getUrineProtein() }</td>
	<td class="ind"><form:input path="urineProtein" /></td>
			</tr>	
<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp RBC</td>
				<td class="phn">${previous.get(0).getRBC() }</td>
	<td class="ind"><form:input path="RBC" /></td>
			</tr>
<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp WBC</td>
				<td class="phn">${previous.get(0).getUrineWBC() }</td>
	<td class="ind"><form:input path="urineWBC" /></td>
			</tr>
<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp Casts</td>
				<td class="phn">${previous.get(0).getCasts() }</td>
	<td class="ind"><form:input path="casts" /></td>
			</tr>

<tr>
				<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp Others</td>
				<td class="phn">${previous.get(0).getUrineOthers() }</td>
	<td class="ind"><form:input path="urineOthers" /></td>
			</tr>	

<tr>
				<td class="pro">Creatinine/CrCl</td>
				<td class="phn">${previous.get(0).getCrCl() }</td>
	<td class="ind"><form:input path="crCl" /></td>
			</tr>

<tr>
				<td class="pro">C3</td>
				<td class="phn">${previous.get(0).getC3() }</td>
	<td class="ind"><form:input path="c3" /></td>
			</tr>

<tr><td class="pro1"><br><h4>Clinical Data</h4></td></tr>	
	
			<tr>
				<td class="pro"></td>
				<td class="phn">${previous.get(0).getClinicalData() }</td>
	<td class="ind"><form:textarea path="clinicalData" class="textareatable" required="true" /></li></td>		
			</tr>	

<tr><td class="pro1"><br><h4>SLEDAI etc.</h4></td></tr>

			<tr>
				<td class="pro"></td>
				<td class="phn">${previous.get(0).getSLEDAI() }</td>
	<td class="ind"><form:textarea path="SLEDAI" class="textareatable" /></li></td>		
			</tr>	

<tr><td class="pro1"><br><h4>Meds/Plans</h4></td></tr>

			
<tr>
				<td class="pro">Pred/methylpred</td>
				<td class="phn">${previous.get(0).getMethylpred() }</td>
	<td class="ind"><form:input path="methylpred" /></td>
			</tr>

<tr>
				<td class="pro">Hydroxychloroquine</td>
				<td class="phn">${previous.get(0).getHydroxychloroquine() }</td>
	<td class="ind"><form:input path="hydroxychloroquine" /></td>
</tr>



<tr>
	<td class="pro">Other Data</td>
	<td class="phn">${previous.get(0).getPlans() }</td>
	<td class="ind"><form:textarea path="plans" class="textareatable" /></td>		
	</tr>
	

</table>
</c:when>









<c:when test="${previous.size() >= 2 }">
								<table class="tablecontent2">
					
								<tr>
									
									<th class="navblank">&nbsp;</th>
									<th class="pro"><a href="">${previous.get(0).getRevisionHistory().getDateCreated() }</a></th>
									<th class="phn"><a href="">${previous.get(1).getRevisionHistory().getDateCreated() }</a></th>
									<th class="ind"><a href="">${date}</a></th>
								</tr>	
							
								<tr>
									<td class="pro">Weight (kg)</td>
									<td class="phn">${previous.get(0).getWeight()}</td>
									<td class="ind">${previous.get(1).getWeight()}</td>
									<td class="web"><form:input path="weight" pattern="\\d+(\\.\\d+)?" required="true" /></td>
								</tr>	
								
								<tr>
									<td class="pro">Blood Pressure</td>
									<td class="phn">${previous.get(0).getBloodPressure() }</td>
									<td class="ind">${previous.get(1).getBloodPressure() }</td>
									<td class="web"><form:input path="bloodPressure" required="true" /></td>
								</tr>
					
					
					<tr><td class="pro1"><br><h4>Laboratory</h4></td></tr>
						
									
								<tr>
									<td class="pro">Hgb/Hct</td>
									<td class="phn">${previous.get(0).getHgbOrHct() }</td>
									<td class="ind">${previous.get(1).getHgbOrHct() }</td>
									<td class="web"><form:input path="HgbOrHct" /></td>
								</tr>	
					<tr>
									<td class="pro">WBC</td>
									<td class="phn">${previous.get(0).getWBC() }</td>
									<td class="ind">${previous.get(1).getWBC() }</td>
									<td class="web"><form:input path="WBC" /></td>
								</tr>	
					<tr>
									<td class="pro">Platelet/ESR</td>
									<td class="phn">${previous.get(0).getPlateletOrESR() }</td>
									<td class="ind">${previous.get(1).getPlateletOrESR() }</td>
									<td class="web"><form:input path="PlateletOrESR" /></td>
								</tr>	
					<tr>
									<td class="pro">Urine Protein</td>
									<td class="phn">${previous.get(0).getUrineProtein() }</td>
									<td class="ind">${previous.get(1).getUrineProtein() }</td>
									<td class="web"><form:input path="urineProtein" /></td>
								</tr>	
					<tr>
									<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp RBC</td>
									<td class="phn">${previous.get(0).getRBC() }</td>
									<td class="ind">${previous.get(1).getRBC() }</td>
									<td class="web"><form:input path="RBC" /></td>
								</tr>
					<tr>
									<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp WBC</td>
									<td class="phn">${previous.get(0).getUrineWBC() }</td>
									<td class="ind">${previous.get(1).getUrineWBC() }</td>
									<td class="web"><form:input path="urineWBC" /></td>
								</tr>
					<tr>
									<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp Casts</td>
									<td class="phn">${previous.get(0).getCasts() }</td>
									<td class="ind">${previous.get(1).getCasts() }</td>
									<td class="web"><form:input path="casts" /></td>
								</tr>
					
					<tr>
									<td class="pro">&nbsp&nbsp&nbsp&nbsp&nbsp Others</td>
									<td class="phn">${previous.get(0).getUrineOthers() }</td>
									<td class="ind">${previous.get(1).getUrineOthers() }</td>
									<td class="web"><form:input path="urineOthers" /></td>
								</tr>	
					
					<tr>
									<td class="pro">Creatinine/CrCl</td>
									<td class="phn">${previous.get(0).getCrCl() }</td>
									<td class="ind">${previous.get(1).getCrCl() }</td>
									<td class="web"><form:input path="crCl" /></td>
								</tr>
					
					<tr>
									<td class="pro">C3</td>
									<td class="phn">${previous.get(0).getC3() }</td>
									<td class="ind">${previous.get(1).getC3() }</td>
									<td class="web"><form:input path="c3" /></td>
								</tr>
					
					<tr><td class="pro1"><br><h4>Clinical Data</h4></td></tr>	
						
								<tr>
									<td class="pro"></td>
									<td class="phn">${previous.get(0).getClinicalData() }</td>
									<td class="ind">${previous.get(1).getClinicalData() }</td>
									<td class="web"><form:textarea path="clinicalData" class="textareatable" required="true" /></li></td>		
								</tr>	
					
					<tr><td class="pro1"><br><h4>SLEDAI etc.</h4></td></tr>
					
								<tr>
									<td class="pro"></td>
									<td class="phn">${previous.get(0).getSLEDAI() }</td>
									<td class="ind">${previous.get(1).getSLEDAI() }</td>
									<td class="web"><form:textarea path="SLEDAI" class="textareatable" /></li></td>		
								</tr>	
					
					<tr><td class="pro1"><br><h4>Meds/Plans</h4></td></tr>
					
								
					<tr>
									<td class="pro">Pred/methylpred</td>
									<td class="phn">${previous.get(0).getMethylpred() }</td>
									<td class="ind">${previous.get(1).getMethylpred() }</td>
									<td class="web"><form:input path="methylpred" /></td>
								</tr>
					
					<tr>
									<td class="pro">Hydroxychloroquine</td>
									<td class="phn">${previous.get(0).getHydroxychloroquine() }</td>
									<td class="ind">${previous.get(1).getHydroxychloroquine() }</td>
									<td class="web"><form:input path="hydroxychloroquine" /></td>
								</tr>
					
					
					
								<tr>
									<td class="pro">Other Data</td>
									<td class="phn">${previous.get(0).getPlans() }</td>
									<td class="ind">${previous.get(1).getPlans() }</td>
									<td class="web"><form:textarea path="plans" class="textareatable" /></td>		
								</tr>
								
					
							</table>
</c:when>
</c:choose><br/><br/><br/><br/>
			<section>
				<ul class="btnForm">
					<span class="btn"><input type="submit"
							value="Add Form" class="btnSave"></span>
					<a href="SLE_flowsheet_table.it?id=${patient.getId() }"><span class="btn"><input type="button"
							value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
					<font style="padding-left:360px"></font>
					<span class="btn"><input type="button"
						value="Back to Top" class="btnTop"></span>
				</ul>
			</section>
</form:form>	
</li>

</ul>
			
			
			
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