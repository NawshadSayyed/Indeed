<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Compose New Message |Jobber</title>
<link rel="shortcut icon" href="assets/images/jobber1-117x93.png"
	type="image/x-icon">
</head>
<body>

<%@ include file="./aheader.jsp"%>
<%@ include file="./alside.jsp"%>
<%@ include file="./arside.jsp"%>

<div class="content-wrapper">
<div class="row">
<form action="./SendMailController" method="post">
<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
<br/>
<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Compose New Message</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <input type="email" class="form-control" placeholder="To:" name="txt_to" required="required" 
                alt="please Enter Valid Email Address" title="please Enter Valid Email Address"	
                oninvalid="setCustomValidity('please Enter Valid Email Address')" onchange="try{setCustomValidity('')}catch(e){}"/>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject:" name="txt_Subject" 
                
                 alt="please Enter Subject " title="please Enter Subject "	
                
                
                />
              </div>
              <div class="form-group">
              <textarea id="compose-textarea" class="form-control"  rows="20" name="txt_Msg" required="required"
                 oninvalid="setCustomValidity('Plese Enter Some Massage')" onchange="try{setCustomValidity('')}catch(e){}"
              >                    
                      
                    </textarea>
                    
              </div>
         <!--      <div class="form-group">
                <div class="btn btn-default btn-file">
                  <i class="fa fa-paperclip"></i> Attachment
                  <input type="file" name="attachment">
                </div>
                <p class="help-block">Max. 32MB</p>
              </div> -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <div >
                <button type="submit" class="btn btn-primary btn-lg"><i class="fa fa-envelope-o"></i> Send</button>
              </div>
              
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>

</div></form>
</div>
</div>





</body>

<%@ include file="./afooter.jsp"%>
</html>