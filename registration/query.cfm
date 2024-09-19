<cfparam name="form.fileUpload" default="">
<cfdump var = "#url.id#">
<cfif len(trim(form.fileUpload))>
  <cffile action="upload" fileField="fileUpload" destination="C:\ColdFusion2018\cfusion\wwwroot\nikhil\Images" result="result" nameConflict="overwrite">
  <p>Thankyou, your file has been uploaded.</p>
  <cfset Image=#result.ATTEMPTEDSERVERFILE#>
</cfif>

<cfset Firstname=#form.fname#>
<cfset Lastname=#form.lname#>
<cfset Email=#form.email#>
<cfset Phone_no=#form.mob#>
<cfset Dob=#form.dob#>
<cfset Marital_status=#form.ms#>
<cfset Gender=#form.gender#>
<cfset Technology=#form.tech_logy#>
<cfset Password=#form.psw#>
<cfset Confirm_pass=#form.cpsw#>
<cfset Address=#form.address#>
<cfset City=#form.city#>
<cfset Pin=#form.pin#>
<cfset State=#form.state#>
<cfset Country=#form.country#>

<cfif isDefined("url.id") AND len(url.id) GT 0>
  <!--Update form-->
  <cfquery datasource="Nikhildb" name="Update">
    Update user set Firstname = <cfqueryparam value="#Firstname#">,
    Lastname = <cfqueryparam value="#Lastname#">,
    Email = <cfqueryparam value="#Email#">,
    Phone_number = <cfqueryparam value="#Phone_no#">,
    Dob = <cfqueryparam value="#Dob#">,
    Marital_status = <cfqueryparam value="#Marital_status#">,
    Gender = <cfqueryparam value="#Gender#">,
    Technology = <cfqueryparam value="#Technology#">,
    Password = <cfqueryparam value="#Password#">,
    Confirm_password = <cfqueryparam value="#Confirm_pass#">,
    Address = <cfqueryparam value="#Address#">,
    City = <cfqueryparam value="#City#">,
    Pin = <cfqueryparam value="#Pin#">,
    State = <cfqueryparam value="#State#">,
    Country = <cfqueryparam value="#Country#">
    <cfif form.fileUpload neq "">
     ,Photo = <cfqueryparam value="#Image#">
    </cfif>
    where Id = <cfqueryparam value="#url.id#">
  </cfquery>

  <!--redirect to employee list-->
  <cflocation url="http://localhost:8500/nikhil/emplist/emplist.cfm" addToken="no">
  <cfdump var="Employee record updated successfully">

<cfelse>

  <!--insert query-->
  <cfquery datasource="Nikhildb" name="insert">
    INSERT INTO user(Firstname , Lastname , Email , Phone_number , Dob , Marital_status , Gender , Technology , Password , Confirm_password , Address , City , Pin , State , Country , Photo)
    VALUES ("#Firstname#" , "#Lastname#" , "#Email#" , "#Phone_no#" , "#Dob#" , "#Marital_status#" , "#Gender#" , "#Technology#" ,"#Password#" , "#Confirm_pass#" , "#Address#" , "#City#" , "#Pin#" , "#State#" , "#Country#" , "#Image#");
  </cfquery>

</cfif>
