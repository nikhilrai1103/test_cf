//<cfdump  var = "#form#">
<cfset email = #form.email#>
<cfset password = #form.psw#>

<!--select query for login-->
<cfquery datasource = "Nikhildb" name = "login">
select Email , Password from user where Email = "#email#" AND Password = "#password#"; 
</cfquery>

<cfset count = 0>
<cfif login.recordCount gt 0>
    <cfset session.email = #email#>
    <cfset session.password=#password#>

    <cflocation url="../Home/home.cfm">

<cfelseif login.recordCount eq 0>
    <cfset count++>
    <cfdump  var="#count#">
    <cflocation url="loginform.cfm?val=#count#">

</cfif>



