<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Details | Jobber</title>
</head>
<body>
	<%@ include file="./aheader.jsp"%>
	<%@ include file="./alside.jsp"%>
	<%@ include file="./arside.jsp"%>


<script src="./jQry/jquery-3.2.1.js" > </script>
<script>
$( document ).ready(function() {
	$('#btn_PostJob').click(function(event) {
        var val = $('input[type=file]').val().toLowerCase();
        var regex = new RegExp("(.*?)\.(docx|doc)$");
        if(!(regex.test(val))) {
            $('.uploadExtensionError').show();
            event.preventDefault();
            alert("Please Select DOCX Files");
        }
    });
});
</script>


<script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>

<script type="text/javascript">
        function isCharacterKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if ((charCode < 65 || charCode > 90)&&(charCode < 97 || charCode > 122  ))
            {
            	return false;
            }
             
          return true;
           
        }
    </script>


	<%
	String btn_value = "Add Candidate";
	int jobid=0;
	if(request.getParameter("Apply_iob_id")!=null){
		jobid=Integer.parseInt(request.getParameter("Apply_iob_id"));
		
	}
	
	%>

	<div class="content-wrapper" style="background-color: white;">

		<div class="box-header" align="center">
			<div class="alert alert-warning alert-dismissible">
				<h2 class="box-title">
					<u><b> <a href="">Add Candidate Details </a>
					</b></u>
				</h2>
			</div>
		</div>


		<div class="col-md-12">
			<form action="./CandidateDetailsController"
				enctype="multipart/form-data" method="post">
				<input type="hidden" name="hdn_job_id" id="hdn_job_id"
					value="<%=jobid %>" />
				<div class="box box-danger">
					<div class="box-body">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label>Candidate First Name </label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_First_Name" name="txt_First_Name"
											placeholder="Candidate Middle Name" class="form-control"
											required="required"	title="Candidate First Name" alt="Candidate First Name"
											onkeypress="return isCharacterKey(event);"
											oninvalid="setCustomValidity('Enter Candidate First Name')"
											
									>
										<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Candidate Middle Name</label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Middle_Name" name="txt_Middle_Name"
											placeholder="Enter Job Title." class="form-control"
											required="required"
											title="Enter Candidate Middle Name" alt="Enter Candidate Middle Name"
									onkeypress="return isCharacterKey(event);"
									oninvalid="setCustomValidity('Enter Candidate Middle Name')"
									onchange="try{setCustomValidity('')}catch(e){}"
											
											>
										<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Candidate Last Name </label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Last_Name" name="txt_Last_Name"
											placeholder="Enter Job Title." class="form-control"
											required="required"
											title="Enter Candidate Last Name" alt="Enter Candidate Last Name"
											onkeypress="return isCharacterKey(event);"
											oninvalid="setCustomValidity('Enter Candidate Last Name')"
											onchange="try{setCustomValidity('')}catch(e){}"
											>
										<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
									</div>
								</div>
							</div>




						</div>


						<div class="row">


							<div class="col-md-4">
								<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
								<div class="form-group">
									<label>Candidate Email </label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Email" name="txt_Email"
											placeholder="Enter Job Title." class="form-control"
											required="required"
											title="Enter Candidate Email" alt="Enter Candidate Email"
											oninvalid="setCustomValidity('Enter Candidate Email')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Candidate Phone</label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Phone" name="txt_Phone"
											placeholder="Enter Candidate Phone" class="form-control"
											required="required"
											onkeypress="return isNumberKey(event);"
											title="Enter Candidate Phone" alt="Enter Candidate Phone"
											oninvalid="setCustomValidity('Enter Candidate Email')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label>Experience Year</label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Experience_Year"
											name="txt_Experience_Year" placeholder="Enter Year."
											class="form-control" required="required" onkeypress="return isNumberKey(event);"
											title="Enter Experience Year" alt="Enter Experience Year"
											oninvalid="setCustomValidity('Enter  Experience Year')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<label>Experience Month</label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Experience_Month"
											name="txt_Experience_Month" placeholder="Enter Month."
											class="form-control" required="required" onkeypress="return isNumberKey(event);"
											title="Enter Experience Month" alt="Enter Experience Month"
											oninvalid="setCustomValidity('Enter  Experience Month')">
									</div>
								</div>
							</div>



						</div>



						<div class="row">


							<div class="col-md-4">
								<%-- value="<%= jpm.getTxt_job_Title()%>" --%>
								<div class="form-group">
									<label>Skills </label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Skils" name="txt_Skils"
											placeholder="Enter Skils." class="form-control"
											required="required" alt="Enter Skils" title="Enter Skills"
											oninvalid="setCustomValidity('Enter Skils')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Location </label>
									<div class="input-group">
										<span class="input-group-addon"> <i class="fa fa-user"></i></span>
										<input type="text" id="txt_Location" name="txt_Location"
											placeholder="Enter Job Title." class="form-control"
											required="required"
											alt="Enter Location" title="Enter Locations"
											oninvalid="setCustomValidity('Enter Locations')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label>Select Resume </label>
									<div class="input-group">

										<input type="file" id="file_Resume" name="file_Resume" accept=".doc, .docx,"
											class="form-control" required="required" placeholder="Slect .doc ,.docx file Only."
											alt="Enter Select Resume Word Document" title="Enter Select Resume Word Document"
											oninvalid="setCustomValidity('Enter Select Resume Word Document')"
											onchange="try{setCustomValidity('')}catch(e){}">
									</div>
								</div>
							</div>




						</div>



					</div>

					<div class="box-footer">
						<div class="col-md-6">
							<div class="form-group">
								<div class="input-group">
									<button type="submit" id="btn_PostJob" name="btn_PostJob"
										class="btn btn-success btn-lg" value="<%=btn_value %>">
										<i class="fa fa-save"></i> &nbsp;
										<%=btn_value %>
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="reset" id="btn_reset" name="btn_reset"
										class="btn btn-warning btn-lg">
										<i class="fa fa-refresh"></i> &nbsp; Reset
									</button>
								</div>
							</div>
						</div>
					</div>


				</div>

			</form>
		</div>



	</div>



	<%@ include file="./afooter.jsp"%>
</body>
</html>