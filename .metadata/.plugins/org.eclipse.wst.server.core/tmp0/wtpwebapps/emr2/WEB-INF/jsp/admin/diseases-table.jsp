<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
</head>

<body>

<div id="wrap">
<jsp:include page="../headers/admin-header.jsp">
	<jsp:param name="title" value="Diseases" />
	<jsp:param name="selected" value="diseases" />
</jsp:include>

<div class="pageCtrl">
 <c:choose>
	<c:when test="${errorSearch != null }">
		<div class="error">${errorSearch}</div>
		<c:remove var="errorSearch" scope="session"/>
	</c:when>
	<c:when test="${successMessage != null }">
		<div class="success">${successMessage}</div>
		<c:remove var="successMessage" scope="session"/>
	</c:when>
</c:choose><br>
	<ul class="ctrlBtn">
		<li><a href="add_disease_assembler.it"><span class="btn"><input type="button" value="Add Disease" class="btnNew"></span></a></li>
		
	</ul>
</div>

<div class="pageCtrl">

</div>

<div class="content-wrap">

	<div class="wrapper prospects">

			<div class="tableSearch clrfix">
			<section>
			   <form action="search_disease.it" method="post">
				<ul class="pro">
					<li><label>Disease Name</label>:<input type="text" name="diseaseName" /></li>

				</ul>
				<span class="submit">
					<input type="submit" value="Go">
				</span>
			    
				</form>
			</section>
		</div>


				<table class="tablecontent3">

				<tr>
					<th class="navblank">&nbsp;</td>
					<th class="pro"><a href="">Disease<span class="greenArrow">&nbsp;</span></a></td>
					<th class="pro"><a href="">Type<span class="greenArrow">&nbsp;</span></a></td>
					<th class="phn"><a href="">Description<span class="greenArrow">&nbsp;</span></a></td>
				</tr>

			
		<c:if test="${errorMessage != null }">
		<tr>
			<td><div class="info">${errorMessage}</div>
			<c:remove var="errorMessage" scope="session" /></td> 
			
		</tr>	
		</c:if>
		
			<c:forEach items="${diseases}" var="disease">
				<tr>
					<td><div class="blue"></div></td>
					<td class="pro"><a href="view_disease.it?id=${disease.getId()}" title="">${disease.getName()}</a></td>
					<td class="phn">${disease.getType()}</a></td>
					<td class="phn">${disease.getDescription()}</a></td>					
				</tr>		
				</c:forEach>
		</table>
		
		
		
		<div class="lowernav">
			<section class="alphabet">
				<ul>
					<li class="selected"><a href="">A</a></li>
					<li><a href="">B</a></li>
					<li><a href="">C</a></li>
					<li><a href="">D</a></li>
					<li><a href="">E</a></li>
					<li><a href="">F</a></li>
					<li><a href="">G</a></li>
					<li><a href="">H</a></li>
					<li><a href="">I</a></li>
					<li><a href="">J</a></li>
					<li><a href="">K</a></li>
					<li><a href="">L</a></li>
					<li><a href="">M</a></li>
					<li><a href="">N</a></li>
					<li><a href="">O</a></li>
					<li><a href="">P</a></li>
					<li><a href="">Q</a></li>
					<li><a href="">R</a></li>
					<li><a href="">S</a></li>
					<li><a href="">T</a></li>
					<li><a href="">U</a></li>
					<li><a href="">V</a></li>
					<li><a href="">W</a></li>
					<li><a href="">X</a></li>
					<li><a href="">Y</a></li>
					<li><a href="">Z</a></li>
				</ul>
			</section>
			<section class="paging">
				<ul>
					<li>
						<select class="perpage">
							<option>5 per page</option>
							<option>10 per page</option>
							<option>15 per page</option>
						</select>
					</li>
					<li>
						<p class="counter">Total Count <a href="">&lt;</a><span>1 to 10</span><a href="">&gt;</a></p></li>
				</ul>
			</section>
		</div>
	
	</div>
	<!-- end wrapper-->
</div>
<!-- end content-wrap-->

<footer>	
	<span class="copy"><a href="">&copy; 2014 Pendragons</a></span>
</footer>

</div>
<!--end wrap-->

</body>
</html>