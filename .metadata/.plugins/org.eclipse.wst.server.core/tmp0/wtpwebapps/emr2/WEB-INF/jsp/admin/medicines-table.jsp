		<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<c:choose>
	<c:when test = "${adminUser!=null}">
		<head>
			<meta charset="utf-8">
		</head>
		<body>
		<div id="wrap">
		<jsp:include page="../headers/admin-header.jsp">
			<jsp:param name="title" value="Medicines" />
			<jsp:param name="selected" value="medicines" />
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
				<li><a href="add_medicine_assembler.it"><span class="btn"><input type="button" value="Add Medicine" class="btnNew"></span></a></li>
				
			</ul>
		</div>
		
		<div class="pageCtrl">
		
		</div>
		
		<div class="content-wrap">
		
			<div class="wrapper prospects">
		
					<div class="tableSearch clrfix">
					<section>
					   <form action="search_medicine.it" method="post">
						<ul class="pro">
							<li><label>Generic Name</label>:<input type="text" name="genericName" /></li>
		
						</ul>
						<ul class="phn">
							<li><label>Brand Name</label>:<input type="text" name="brandName" /></li>
						</ul>
		
						<span class="submit">
							<input type="submit" value="Go">
						</span>
					    
						</form>
					</section>
				</div>
		
		
				<table class="tablecontent3">	
		
						<tr>
							<th class="navblank">&nbsp;</th>
							<th class="pro">Generic Name<span class="greenArrow">&nbsp;</span></th>
							<th class="phn">Brand Name<span class="greenArrow">&nbsp;</span></th>
							<th class="ind">Uses<span class="greenArrow">&nbsp;</span></th>
						</tr>
		
				<c:if test="${errorMessage != null }">
				<tr>
					<td><div class="info">${errorMessage}</div>
					<c:remove var="errorMessage" scope="session" /></td> 
					
				</tr>	
				</c:if>
				
					<c:forEach items="${medicines}" var="medicine">
						<tr>
							<td><div class="blue"></div></td>
							<td class="pro"><a href="view_medicine.it?id=${medicine.getId()}" title="">${medicine.genericName}</a></td>
							<td class="phn">${medicine.brandName}</td>
							<td class="ind">${medicine.getUses()}</td>		
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
		
		</body>
	</c:when>
	<c:otherwise>
		<jsp:include page="../headers/admin-check.jsp"/>
	</c:otherwise>
</c:choose>
</html>