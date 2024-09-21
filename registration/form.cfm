<cfparam name = "url.id" default="">
<cfif isDefined("url.id")>
  <!--select query through edit button-->
<cfquery datasource = "Nikhildb" name="editinfo">
  select * from user where Id = "#url.id#"
</cfquery>
<cfset images = editinfo.Photo>
<cfset fname = editinfo.Firstname>
<cfset lname = editinfo.Lastname>
<cfset email = editinfo.Email>
<cfset phone = editinfo.Phone_number>
<cfset dob = editinfo.Dob>
<cfset ms = editinfo.Marital_status>
<cfset gender = editinfo.Gender>
<cfset tech_logy = editinfo.Technology>
<cfset password = editinfo.Password>
<cfset confirm_pass = editinfo.Confirm_password>
<cfset address = editinfo.Address>
<cfset city = editinfo.City>
<cfset pin = editinfo.Pin>
<cfset state = editinfo.State>
<cfset country = editinfo.Country>
</cfif>



<!DOCTYPE html>
<html lang="en">
  <head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./form.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="form.js"></script>

  </head>
  <style></style>
  <body class="body">
 
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <form  action="query.cfm?id=<cfoutput>#url.id#</cfoutput>" enctype="multipart/form-data" method="POST">

          <div class="row" id="header">
            <div class="col-md-3"></div>

            <div class="col-md-8">
              <h1>Registration form</h1>
              <p id="p1">Please fill in this form to create an account.</p>
            </div>
            <div class="col-md-1"></div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
              <cfif url.id neq "">
                <img src="../Images/<cfoutput>#images#</cfoutput>" id="frame">
                <input type="file" name="fileUpload" accept="img/*" onchange="imgfun(event)">  

               <cfelse>
                
               <input type="file" id="img" name="fileUpload" accept="img/*" onchange="imgfun(event)">
               <img id="frame" src="" style="display: none;">
               <span id="eimg"></span>
              </cfif>
            </div>
            <div class="col-md-4"></div>
          </div>

          <br> 

          <div class="row">
            <div class="col-md-4">
              <label for="name" class="form-label">Firstame<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="name" name="fname" value="<cfoutput>#fname#</cfoutput>">
              <span id="ename"></span>
            </div>

            <div class="col-md-4">

              <label for="lname" class="form-label">Lastname<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="lname" name="lname" 
              value = "<cfoutput>#lname#</cfoutput>">
              <span id="elname"></span>


            </div>

            <div class="col-md-4">

              <label for="email" class="form-label">Email<span >*</span></label>
              <input type="email" class="form-control form-control-sm" id="email" name="email" 
              value = "<cfoutput>#email#</cfoutput>">
              <span id="eemail"></span>
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-md-4">

              <label for="mob" class="form-label">Phone number<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="mob" name="mob" 
              value = "<cfoutput>#phone#</cfoutput>">
              <span id="emob"></span>
            </div>

            <div class="col-md-4">
              <label for="dob" class="form-label">Date of Birth<span >*</span></label>
              <input type="date" class="form-control" id="dob" name="dob" onchange="getAgeee()"
              value = "<cfoutput>#dob#</cfoutput>">
              <span id="edob"></span>
            </div>

            <div class="col-md-4">
              <label for="ms" class="form-label">Marital Status<span >*</span></label>
              <select class="form-select" id="ms" name="ms">
                <option value="" selected >Select</option>
                <option value="Married" <cfif ms eq "Married">Selected</cfif>>Married</option>
                <option value="Unmarried" <cfif ms eq "Unmarried">Selected</cfif>>Unmarried</option>
              </select>
              <span id="ems"></span>
            </div>
          </div>
          <br>

          <div class="row">
           <div class="col-md-12">

              <div class="form-floating mb-3 mt-3" id="hname">
              <input type="text" class="form-control" id="hname" placeholder="Enter Husband name" name="hname">
              <label for="hname">Husband name</label>
              </div>

              <div class="form-floating mb-3 mt-3" id="wname">
              <input type="text" class="form-control" id="wname" placeholder="Enter wife name" name="wname">
              <label for="wname">Wife name</label>
              </div>

              <div class="form-floating mb-3 mt-3" id="father_name">
              <input type="text" class="form-control" id="father_name" placeholder="Enter Father name" name="father_name">
              <label for="wname">Father name</label>
              </div>

            </div>

          </div>

          <div class="row">
            <div class="col-md-1"></div>

            <div class="col-md-5">
              <label for="gender" class="form-label" id="gender">Gender<span >*</span></label>
              <div class="form-check">
                <input type="radio" class="form-check-input" id="male" name="gender" value="Male" checked="checked" <cfif gender eq "Male">Checked</cfif>>
                <label class="form-check-label" for="male">Male</label>
              </div>

              <div class="form-check">  
                <input type="radio" class="form-check-input" id="female" name="gender" value="Female" <cfif gender eq "Female">Checked</cfif> >
                <label class="form-check-label" for="female">Female</label>
              </div>

              <div class="form-check">
                <input type="radio" class="form-check-input" id="others" name="gender" value="Others" <cfif gender eq "Others">Checked</cfif> >
                <label class="form-check-label" for="others">Others</label>
              </div>
              <span id="egender"></span>
            </div>

            <div class="col-md-5">

              <label for="Technology" class="form-label">Technology<span >*</span></label>
              <span id="etech"></span>
              <br>
              <div class="form-check form-check-inline">
                <input type="checkbox" class="form-check-input" id="HTML" name="tech_logy" value="HTML" <cfif listFindNoCase(tech_logy, "HTML")>Checked</cfif> >
                <label class="form-check-label" for="HTML">HTML</label>
              </div>

              <div class="form-check form-check-inline">
                <input type="checkbox" class="form-check-input" id="CSS" name="tech_logy" value="CSS" <cfif listFindNoCase(tech_logy, "CSS")>Checked</cfif> >
                <label class="form-check-label" for="CSS">CSS</label>
              </div><br>

              <div class="form-check form-check-inline">
                <input type="checkbox" class="form-check-input" id="JQuery" name="tech_logy" value="JQuery" <cfif listFindNoCase(tech_logy, "JQuery")>Checked</cfif> >
                <label class="form-check-label" for="JQuery">JQuery</label>
              </div>

              <div class="form-check form-check-inline">
                <input type="checkbox" class="form-check-input" id="CF" name="tech_logy" value="CF" <cfif listFindNoCase(tech_logy, "CF")>Checked</cfif>>
                <label class="form-check-label" for="CF">Coldfusion</label>
              </div>

              <div class="form-check form-check-inline">
                <input type="checkbox" class="form-check-input" id="Javascript" name="tech_logy" value="Javascript" <cfif listFindNoCase(tech_logy, "Javascript")>Checked</cfif> >
                <label class="form-check-label" for="Javascript">Javascript</label>
              </div>
            </div>
            <div class="col-md-1"></div>
          </div>
      
          <br>

          <div class="row">
            <div class="col-md-6">
              <label for="psw" class="form-label">Password<span>*</span></label>
              <input type="text" class="form-control form-control-sm" id="psw" name="psw" value = "<cfoutput>#password#</cfoutput>">
              <span id="epsw"></span>
            </div>

            <div class="col-md-6">
              <label for="cpsw" class="form-label">Confirm Password<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="cpsw" name="cpsw" value = "<cfoutput>#confirm_pass#</cfoutput>">
              <span id="ecpsw"></span>
            </div>
          </div>

          <br>
          

          <div class="row">
            <div class="col-md-12">
              <label for="add">Address<span >*</span></label><br>
              <textarea class="form-control" id="add" name="address" row="1"><cfoutput>#address#</cfoutput> </textarea>
              <span id="eadd"></span>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <label for="city" class="form-label">City<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="city" name="city" value="<cfoutput>#city#</cfoutput>">
              <span id="ecity"></span>
            </div>

            <div class="col-md-6">
              <label for="pin" class="form-label">Pin<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="pin" name="pin" value = "<cfoutput>#pin#</cfoutput>" >
              <span id="epin"></span>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <label for="state" class="form-label">State<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="state" name="state" value = "<cfoutput>#state#</cfoutput>">
              <span id="estate"></span>
            </div>

            <div class="col-md-6">
              <label for="country" class="form-label">Country<span >*</span></label>
              <input type="text" class="form-control form-control-sm" id="country" name="country" value="<cfoutput>#country#</cfoutput>" >
              <span id="ecountry"></span>
            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-3"></div>

            <cfif id eq "">

             <cfif password neq confirm_pass>

              <cfoutput><button type="submit" id="submit" class="btn btn-success mt-3 col-md-6" disabled>Submit</button></cfoutput>

              <cfelse>

              <cfoutput><button type="submit" id="submit" class="btn btn-success mt-3 col-md-6">Submit</button></cfoutput>

             </cfif>

            <cfelse>
               <cfoutput><button type="submit" id="submit" class="btn btn-success mt-3 col-md-6">Update</button></cfoutput>

            </cfif>
            <div class="col-md-3"></div>

          </div>
          <br>
        </div>

        </form>

      </div>
      <div class="col-md-3"></div>
    </div>
  </div>

</body>
</html>