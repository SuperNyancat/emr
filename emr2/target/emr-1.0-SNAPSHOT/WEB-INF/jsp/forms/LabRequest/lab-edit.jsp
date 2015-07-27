<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<title>Edit Laboratory Request Form</title>
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
						<form:form action="update_lab.it?pid=${patient.getId()}&fid=${form.getId()}" commandName="form" method="post">
							<form:hidden path="id" value="${form.getId() }"/>
							<form:hidden path="patient.id" value="${patient.getId()}"/>
							<form:hidden path="revisionHistory.id" value="${form.getRevisionHistory().getId() }"/>
							<form:hidden path="revisionHistory.createdBy.id" value="${ form.getRevisionHistory().getCreatedBy().getId()}"/>
							<form:hidden path="revisionHistory.dateCreated" value="${form.getRevisionHistory().getDateCreated() }"/>
					
							<p class="titles">LABORATORY REQUEST</p>

								<ul>
									<li>
										Patient Name:&nbsp&nbsp&nbsp&nbsp&nbsp ${patient.getPersonInfo().getFirstName() } ${patient.getPersonInfo().getLastName() }
										</li><br/>	
									<li>
										Bed Number: &nbsp&nbsp&nbsp&nbsp&nbsp <form:input path="bedNumber" pattern="\\d+(\\.\\d+)?" value="${form.getBedNumber()}" />
										
									</li> <br/>
							
									<li>
										Admission Number:&nbsp&nbsp&nbsp&nbsp&nbsp <form:input path="admissionNumber" pattern="\\d+(\\.\\d+)?" value="${form.getAdmissionNumber()}" />
										Hospital Number:&nbsp&nbsp&nbsp&nbsp&nbsp <form:input path="hospitalNumber" pattern="\\d+(\\.\\d+)?" value="${form.getHospitalNumber()}" />
									</li><br>
									<li>
										Diagnosis:&nbsp&nbsp&nbsp&nbsp&nbsp <form:input path="diagnosis" value="${form.getDiagnosis()}"  required="true" />
										Specimen:&nbsp&nbsp&nbsp&nbsp&nbsp <form:input path="specimen" value="${form.getSpecimen()}"  required="true" />	
									</li><br>
								</ul>
							
							<label class="bigfont"><h4>HEMATOLOGY</h4></label><br><br>	
								<ul>
									<li>
										<form:checkbox value="CBC, Platelet Count" path="hematology"	 />CBC, Platelet Count 
										<form:checkbox value="Hgb & Hct" path="hematology" />Hgb & Hct 
										<form:checkbox value="Platelet Count" path="hematology" />Platelet Count 
										<form:checkbox value="Hgb & Hct, Platelet Count" path="hematology" />Hgb & Hct, Platelet Count
									</li><br>	
									<li>
									<form:checkbox value="WBC & Differential Count" path="hematology" />WBC & Differential Count 
										<form:checkbox value="Peripheral Smear" path="hematology" />Peripheral Smear 
										<form:checkbox value="ESR" path="hematology" />ESR
										<form:checkbox value="Reticulocyte Count" path="hematology" />Reticulocyte Count
										<form:checkbox value="OFT" path="hematology" />OFT
									</li><br>
									<li>
										<form:checkbox value="Clothing Time/Bleeding Time" path="hematology" />Clothing Time/Bleeding Time
										<form:checkbox value="Malarial Smear" path="hematology" />Malarial Smear
										<form:checkbox value="Malarial Parasite Count" path="hematology" />Malarial Parasite Count
									</li><br>
									<li>
										<form:checkbox value="Synovial Fluids" path="hematology" /><u>Synovial Fluids</u>
										<br>&nbsp&nbsp&nbsp&nbsp&nbsp
										<form:checkbox value="Cell Count, differential count" path="hematology" />Cell Count, differential count
										<form:checkbox value="Seminal Analysis" path="hematology" />Seminal Analysis
									</li><br>
								</ul>
								
							<label class="bigfont"><h4>CLINICAL MICROSCOPY</h4></label><br><br>
								<h3>&nbsp&nbsp&nbsp <u>Urine Examination</u></h3>
									<ul>
										<li>
											<form:checkbox value="Urinalysis" path="urineExamination" />Urinalysis 
											<form:checkbox value="Pregnancy Test" path="urineExamination" />Pregnancy Test 
										</li><br>
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>Stool Examination</u></h3>
									<ul>
										<li>
											<form:checkbox value="Fecalysis" path="stoolExamination" />Fecalysis 
											<form:checkbox value="Occult Blood" path="stoolExamination" />Occult Blood<br> 
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp OTHER TEST:
											<form:checkbox value="Stone Analysis" path="stoolExamination" />Stone Analysis
										</li><br>
									</ul>
							
							<label class="bigfont"><h4>MICROBIOLOGY</h4></label><br><br>
								<h3>&nbsp&nbsp&nbsp <u>Culture Only</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Aerobic" path="cultureOnly" />Aerobic
											<form:checkbox value="Anaerobic" path="cultureOnly" />Anaerobic
											<form:checkbox value="Fungal" path="cultureOnly" />Fungal
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Sensitivity Test Only</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Aerobic" path="sensitivityTestOnly" />Aerobic
											<form:checkbox value="Anaerobic" path="sensitivityTestOnly" />Anaerobic
											<form:checkbox value="Fungal/Yeast" path="sensitivityTestOnly" />Fungal/Yeast
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Culture and Sensitivity</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Aerobic" path="cultureAndSensitivity" />Aerobic
											<form:checkbox value="Anaerobic" path="cultureAndSensitivity" />Anaerobic
											<form:checkbox value="Fungal" path="cultureAndSensitivity" />Fungal
										</li><br>
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>MTB BACTEC</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Culture" path="mtbBactec" />Culture
											<form:checkbox value="Sensitivity" path="mtbBactec" />Sensitivity
											<form:checkbox value="Culture and Sensitivity" path="mtbBactec" />Culture and Sensitivity
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Staining Procedures</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="AFB Stain" path="stainingProcedures" />AFB Stain
											<form:checkbox value="Gram Stain" path="stainingProcedures" />Gram Stain
											<form:checkbox value="KOH" path="stainingProcedures" />KOH
											<form:checkbox value="Fungal Stain" path="stainingProcedures" />Fungal Stain
											<form:checkbox value="India Ink" path="stainingProcedures" />India Ink 
											<form:checkbox value="Wet Smear" path="stainingProcedures" />Wet Smear
										</li><br>
										<li>
											<form:checkbox value="Tzanck's Smear" path="stainingProcedures" />Tzanck's Smear
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Others</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Yeast Speciation" path="others" />Yeast Speciation
											<form:checkbox value="Culture for Identification" path="others" />Culture for Identification
											<form:checkbox value="Bacterial Antigen" path="others" />Bacterial Antigen
											<form:checkbox value="Water Analysis (Bacteriological)" path="others" />Water Analysis (Bacteriological)
										</li><br>
										<li>
											<form:checkbox value="Environmental Culture" path="others" />Environmental Culture 
											<form:checkbox value="Finger Printing" path="others" />Finger Printing
											<form:checkbox value="Plate Exposure" path="others" />Plate Exposure
											<form:checkbox value="Clostridium difficile toxin" path="others" />Clostridium difficile toxin
										</li><br>
									</ul>
							
							
							<!--column 2-->
							<label class="bigfont"><h4>CLINICAL CHEMISTRY</h4></label><br><br>
								<ul>
									<li>
										<form:checkbox value="BUN" path="clinicalChemistry" />BUN 
										<form:checkbox value="Creatinine" path="clinicalChemistry" />Creatinine
										<form:checkbox value="Glucose" path="clinicalChemistry" />Glucose
										<form:checkbox value="Uric Acid" path="clinicalChemistry" />Uric Acid
										<form:checkbox value="Cholesterol" path="clinicalChemistry" />Cholesterol
										<form:checkbox value="Triglycerides" path="clinicalChemistry" />Triglycerides
										<form:checkbox value="HDL" path="clinicalChemistry" />HDL
									</li><br>
									<li>
										<form:checkbox value="LDL" path="clinicalChemistry" />LDL
										<form:checkbox value="LDH" path="clinicalChemistry" />LDH
										<form:checkbox value="GGT" path="clinicalChemistry" />GGT
										<form:checkbox value="TPA/G Ratio" path="clinicalChemistry" />TPA/G Ratio
										<form:checkbox value="Troponin T" path="clinicalChemistry" />Troponin T
										<form:checkbox value="Troponin I" path="clinicalChemistry" />Troponin I
										<form:checkbox value="CK-Total" path="clinicalChemistry" />CK-Total
									</li><br>
									<li>
										<form:checkbox value="Pro-BNP" path="clinicalChemistry" />Pro-BNP
										<form:checkbox value="HbA1c" path="clinicalChemistry" />HbA1c
										<form:checkbox value="CK-MB Mass" path="clinicalChemistry" />CK-MB Mass
										<form:checkbox value="CK-MB Activity" path="clinicalChemistry" />CK-MB Activity
										<form:checkbox value="Sodium, Potassium" path="clinicalChemistry" />Sodium, Potassium
										<form:checkbox value="Chloride" path="clinicalChemistry" />Chloride
									</li><br>
									<li>
										<form:checkbox value="Magnesium" path="clinicalChemistry" />Magnesium
										<form:checkbox value="Ionized Calcium" path="clinicalChemistry" />Ionized Calcium
										<form:checkbox value="Total Calcium" path="clinicalChemistry" />Total Calcium
										<form:checkbox value="Inorganic Phosphates" path="clinicalChemistry" />Inorganic Phosphates
										<form:checkbox value="AST(SGOT)" path="clinicalChemistry" />AST(SGOT)
									</li><br>
									<li>
										<form:checkbox value="ALT(SGPT)" path="clinicalChemistry" />ALT(SGPT)
										<form:checkbox value="Bilirubin" path="clinicalChemistry" />Bilirubin
										<form:checkbox value="Magnesium" path="clinicalChemistry" />Magnesium
										<form:checkbox value="Alkaline Phosphatase" path="clinicalChemistry" />Alkaline Phosphatase
										<form:checkbox value="Amylase" path="clinicalChemistry" />Amylase
										<form:checkbox value="Lipase" path="clinicalChemistry" />Lipase
									</li><br>
									<li>
										<form:checkbox value="Digoxin/Digitalis" path="clinicalChemistry" />Digoxin/Digitalis
										<form:checkbox value="Phenorbital" path="clinicalChemistry" />Phenorbital
										<form:checkbox value="Phenytoin/Lanoxin" path="clinicalChemistry" />Phenytoin/Lanoxin
										<form:checkbox value="Valproic Acid" path="clinicalChemistry" />Valproic Acid
										<form:checkbox value="Lithium" path="clinicalChemistry" />Lithium
									</li><br>	
								</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Urine Chemistry</u></h3>
									<form:radiobutton path="urineChemDuration" value="random"/>Random
									<form:radiobutton path="urineChemDuration" value="24-hour"/>24-Hour
										
									<ul>	
										<li>
											<form:checkbox value="Creatinine Clearance" path="urineChemistry" />Creatinine Clearance
											<form:checkbox value="Creatinine" path="urineChemistry" />Creatinine
											<form:checkbox value="Protein" path="urineChemistry" />Protein
											<form:checkbox value="Calcium" path="urineChemistry" />Calcium
											<form:checkbox value="Uric Acid" path="urineChemistry" />Uric Acid
											<form:checkbox value="Amylase" path="urineChemistry" />Amylase
										</li><br>
										<li>
											<form:checkbox value="Chloride" path="urineChemistry" />Chloride
											<form:checkbox value="Sodium" path="urineChemistry" />Sodium
											<form:checkbox value="Potassium" path="urineChemistry" />Potassium
											<form:checkbox value="Osmolality" path="urineChemistry" />Osmolality
											<form:checkbox value="Magnesium" path="urineChemistry" />Magnesium
											<form:checkbox value="Vanylmandelic Acid" path="urineChemistry" />Vanylmandelic Acid
										</li><br>
										<li>
											<form:checkbox value="Citric Acid (Citrate)" path="urineChemistry" />Citric Acid (Citrate)
											<form:checkbox value="Microalbumin/Micral Test" path="urineChemistry" />Microalbumin/Micral Test
											<form:checkbox value="Microalbumin:Creatinine Ratio" path="urineChemistry" />Microalbumin:Creatinine Ratio
										</li><br>
										<li>
											<form:checkbox value="Total Protein/Creatinine Ratio" path="urineChemistry" />Total Protein/Creatinine Ratio
										</li><br>
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>Transudate and Exudate</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Sugar (Glucose)" path="transudateAndExudate" />Sugar (Glucose)
											<form:checkbox value="Amylase" path="transudateAndExudate" />Amylase
											<form:checkbox value="LDH" path="transudateAndExudate" />LDH
											<form:checkbox value="Protein" path="transudateAndExudate" />Protein
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Special Blood Chemistry</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Ammonia" path="specialBloodChemistry" />Ammonia
											<form:checkbox value="Iron" path="specialBloodChemistry" />Iron
											<form:checkbox value="TIBC" path="specialBloodChemistry" />TIBC
											<form:checkbox value="C3" path="specialBloodChemistry" />C3
											<form:checkbox value="Serum/Plasma Osmolality" path="specialBloodChemistry" />Serum/Plasma Osmolality
										</li><br>
										<li>
											<form:checkbox value="Immunoglobulin G (serum, CSF)" path="specialBloodChemistry" /><u>Immunoglobulin G (serum, CSF)</u>
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgM" path="specialBloodChemistry" />lgM
											<form:checkbox value="lgA" path="specialBloodChemistry" />lgA
										</li><br>
										<li>
											<form:checkbox value="Anti-Streptolysin O (ASO)" path="specialBloodChemistry" />Anti-Streptolysin O (ASO)
											<form:checkbox value="High-Sensitive CRP" path="specialBloodChemistry" />High-Sensitive CRP
											<form:checkbox value="Vitamin D Total" path="specialBloodChemistry" />Vitamin D Total
										</li><br>
									</ul>
							
							
							
							
							
							<label class="bigfont"><h4>IMMUNOCHEMISTRY AND MOLECULAR BIOLOGY</h4></label><br><br>
							
								<h3>&nbsp&nbsp&nbsp <u>Coagulation Tests</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Prothrombin Time" path="coagulationTests" />Prothrombin Time
											<form:checkbox value="Activated PTT" path="coagulationTests" />Activated PTT
											<form:checkbox value="Fibrinogen level" path="coagulationTests" />Fibrinogen level
											<form:checkbox value="D-dimer" path="coagulationTests" />D-dimer
											<form:checkbox value="FDP" path="coagulationTests" />FDP
											<form:checkbox value="Factor VII" path="coagulationTests" />Factor VII
										</li><br>
										<li>
											<form:checkbox value="Factor IX" path="coagulationTests" />Factor IX
											<form:checkbox value="Protein C" path="coagulationTests" />Protein C
											<form:checkbox value="Protein S" path="coagulationTests" />Protein S
											<form:checkbox value="Anti-thrombin III" path="coagulationTests" />Anti-thrombin III
											<form:checkbox value="LA1" path="coagulationTests" />LA1
											<form:checkbox value="LA2" path="coagulationTests" />LA2
										</li><br>
									</ul>
							
								<h3>&nbsp&nbsp&nbsp <u>Latex/Routine Tests</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="RA/RF" path="latexOrRoutineTests" />RA/RF
											<form:checkbox value="CALAS" path="latexOrRoutineTests" />CALAS
											<form:checkbox value="RPR" path="latexOrRoutineTests" />RPR
											<form:checkbox value="TPHA" path="latexOrRoutineTests" />TPHA
											<form:checkbox value="Monospot" path="latexOrRoutineTests" />Monospot
											<form:checkbox value="Cryoglobulin" path="latexOrRoutineTests" />Cryoglobulin
										</li><br>
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>Tumor Markers</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="CA-125 (ovary)" path="tumorMarkers" />CA-125 (ovary)
											<form:checkbox value="CA 19-9 (pancreas)" path="tumorMarkers" />CA 19-9 (pancreas)
											<form:checkbox value="CA 15-3 (breast)" path="tumorMarkers" />CA 15-3 (breast)
											<form:checkbox value="CEA" path="tumorMarkers" />CEA
											<form:checkbox value="AFP" path="tumorMarkers" />AFP
										</li><br>
										<li>
											<form:checkbox value="PSA Panel" path="tumorMarkers" /><u>PSA Panel</u>
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="PSA" path="tumorMarkers" />PSA
											<form:checkbox value="Free PSA" path="tumorMarkers" />Free PSA
										</li><br>
									</ul>
							
								<h3>&nbsp&nbsp&nbsp <u>Hepatitis Markers</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Hepatitis Profile" path="hepatitisMarkers" />Hepatitis Profile
											<form:checkbox value="Hepatitis B Profile" path="hepatitisMarkers" />Hepatitis B Profile
											<form:checkbox value="HBsAg" path="hepatitisMarkers" />HBsAg
											<form:checkbox value="Anti-HBs" path="hepatitisMarkers" />Anti-HBs
											<form:checkbox value="Anti-HAV lgM" path="hepatitisMarkers" />Anti-HAV lgM
											<form:checkbox value="Anti-HAV Total" path="hepatitisMarkers" />Anti-HAV Total
										</li><br>
										<li>
											<form:checkbox value="Anti-HBc lgM" path="hepatitisMarkers" />Anti-HBc lgM
											<form:checkbox value="Anti-HBc Total" path="hepatitisMarkers" />Anti-HBc Total
											<form:checkbox value="HBeAg" path="hepatitisMarkers" />HBeAg
											<form:checkbox value="Anti-HBe" path="hepatitisMarkers" />Anti-HBe
											<form:checkbox value="Anti-HCV" path="hepatitisMarkers" />Anti-HCV
										</li><br>
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>Anemia Panel</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Ferritin" path="anemiaPanel" />Ferritin
											<form:checkbox value="Vitamin B12" path="anemiaPanel" />Vitamin B12
											<form:checkbox value="Folate" path="anemiaPanel" />Folate
											<form:checkbox value="G6PD" path="anemiaPanel" />G6PD
										</li><br>
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>Reproductive Tests</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="FSH" path="reproductiveTests" />FSH
											<form:checkbox value="Prolactin" path="reproductiveTests" />Prolactin
											<form:checkbox value="LH" path="reproductiveTests" />LH
											<form:checkbox value="Testosterone" path="reproductiveTests" />Testosterone
											<form:checkbox value="Beta-HCG" path="reproductiveTests" />Beta-HCG
											<form:checkbox value="Progesterone" path="reproductiveTests" />Progesterone
											<form:checkbox value="Estradiol" path="reproductiveTests" />Estradiol
										</li><br>
										<li>
											<form:checkbox value="DHEA-S" path="reproductiveTests" />DHEA-S
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Prohibited Drug Testing</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Methamphetamine" path="prohibitedDrugTesting" />Methamphetamine
											<form:checkbox value="Tetrahydrocannabinol" path="prohibitedDrugTesting" />Tetrahydrocannabinol
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Polymerase Chain Reaction</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="HBV-DNA (quantitative)" path="polymerseChainReaction" />HBV-DNA (quantitative)
											<form:checkbox value="TB-PCR" path="polymerseChainReaction" />TB-PCR
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Autoimmune Tests</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="ANA Panel/LE Panel" path="autoimmuneTests" />ANA Panel/LE Panel
											<form:checkbox value="ANA titer" path="autoimmuneTests" />TB-PCR
											<form:checkbox value="Anti-dsDNA" path="autoimmuneTests" />Anti-dsDNA
											<form:checkbox value="Anti-SM/Anti-RNP (combined)" path="autoimmuneTests" />Anti-SM/Anti-RNP (combined)
											
										</li><br>	
										<li>
											<form:checkbox value="Anti-SSA/Anti-SSB (combined)" path="autoimmuneTests" />Anti-SSA/Anti-SSB (combined)
										</li><br>
										<li>
											<form:checkbox value="Anti-Cardiolipin Antibody" path="autoimmuneTests" /><u>Anti-Cardiolipin Antibody</u>
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="autoimmuneTests" />lgG
											<form:checkbox value="lgM" path="autoimmuneTests" />lgM
										</li><br>
										<li>
											<form:checkbox value="Anti-CCP" path="autoimmuneTests" />Anti-CCP
										</li><br>
										
								<h3>&nbsp&nbsp&nbsp <u>Endocrine Tests</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Serum/Plasma Cortisol" path="endocrineTests" />Serum/Plasma Cortisol
											<form:checkbox value="24-hour Urine Cortisol" path="endocrineTests" />24-hour Urine Cortisol
											<form:checkbox value="24-hour Urine Free Cortisol" path="endocrineTests" />24-hour Urine Free Cortisol
										</li><br>
										<li>
											<form:checkbox value="24-hour Urine Metanephrine" path="endocrineTests" />24-hour Urine Metanephrine
											<form:checkbox value="Insulin" path="endocrineTests" />Insulin
											<form:checkbox value="C-Peptide" path="endocrineTests" />C-Peptide
											<form:checkbox value="Growth Hormone" path="endocrineTests" />Growth Hormone
											<form:checkbox value="Intact PTH" path="endocrineTests" />Intact PTH
										</li><br>			
										
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>Electrophoresis</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Serum Protein Immunoelectrophoresis" path="electrophoresis" />Serum Protein Immunoelectrophoresis
											<form:checkbox value="Serum Protein Electrophoresis" path="electrophoresis" />Serum Protein Electrophoresis
											<form:checkbox value="Hemoglobin Electrophoresis" path="electrophoresis" />Hemoglobin Electrophoresis
										</li><br>
									</ul>
									
								<h3>&nbsp&nbsp&nbsp <u>Flow Cytometry</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Comprehensive Leukemia Panel" path="flowCytometry" />Comprehensive Leukemia Panel
											<form:checkbox value="Minimal Residual Disease Detection" path="flowCytometry" />Minimal Residual Disease Detection
											<form:checkbox value="Lymphoma Panel" path="flowCytometry" />Lymphoma Panel
										</li><br>
										<li>
											<form:checkbox value="Myeloma Panel" path="flowCytometry" />Myeloma Panel
										</li><br>
									</ul>
								
								<h3>&nbsp&nbsp&nbsp <u>Infectious Diseases</u></h3>	
									<ul>	
										<li>
											<form:checkbox value="Anti-HIV Screening" path="infectiousDiseases" />Anti-HIV Screening
										</li><br>
										<li>
											<form:checkbox value="TORCH" path="infectiousDiseases" />TORCH
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="Toxoplasma" path="infectiousDiseases" />Toxoplasma
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="infectiousDiseases" />lgG
											<form:checkbox value="lgM" path="infectiousDiseases" />lgM
										</li><br>
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="Rubella" path="infectiousDiseases" />Rubella
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="infectiousDiseases" />lgG
											<form:checkbox value="lgM" path="infectiousDiseases" />lgM
										</li><br>
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="Cytomegalovirus (CMV)" path="infectiousDiseases" />Cytomegalovirus (CMV)
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="infectiousDiseases" />lgG
											<form:checkbox value="lgM" path="infectiousDiseases" />lgM
										</li><br>
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="Herpes Simplex Virus" path="infectiousDiseases" />Herpes Simplex Virus
										</li>
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="Type I" path="infectiousDiseases" />Type I
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="infectiousDiseases" />lgG
											<form:checkbox value="lgM" path="infectiousDiseases" />lgM
										</li><br>
										<li>
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="Type II" path="infectiousDiseases" />Type II
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="infectiousDiseases" />lgG
											<form:checkbox value="lgM" path="infectiousDiseases" />lgM
										</li><br>
										<li>
											<form:checkbox value="Salmonella typhi" path="infectiousDiseases" />Salmonella typhi
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="infectiousDiseases" />lgG
											<form:checkbox value="lgM" path="infectiousDiseases" />lgM
										</li><br>
										<li>
											<form:checkbox value="Dengue" path="infectiousDiseases" />Dengue
											<br>&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:checkbox value="lgG" path="infectiousDiseases" />lgG
											<form:checkbox value="lgM" path="infectiousDiseases" />lgM
										</li><br>
										<li>
											<form:checkbox value="Dengue NS1AG" path="infectiousDiseases" />Dengue NS1AG
											<form:checkbox value="Dengue Duo" path="infectiousDiseases" />Dengue Duo
										</li><br>
									</ul>
							
							<label class="bigfont"><h4>OTHERS:</h4></label><br><br>
								<div>
									<form:textarea rows="4" cols="50" style="width:700px; height:100px;" path="othersTextArea" value="${form.getOthersTextArea()}" />

								</div>
									<br><br><br><br>
						
								<section>
									<ul class="btnForm">
										<span class="btn"><input type="submit"
												value="Update Form" class="btnSave"></span>
										<a href="view_lab_request.it?pid=${patient.getId() }&fid=${form.id}"><span class="btn"><input type="button"
												value="Cancel" class="btnCancel" onClick="viewPotentialsList()"></span></a>
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

</body>
</html>