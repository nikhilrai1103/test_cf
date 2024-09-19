<cfcomponent>

  <!---View data--->
  <cffunction name="view_Data" returnformat="json" returntype="any" access="remote" hint="View Button modal">
    <cfargument name="Id" required="true" type="any">

    <cfquery datasource = "Nikhildb" name="empinfo">
      select * from user where Id = <cfqueryparam value="#arguments.Id#" cfsqltype="cf_sql_integer">
    </cfquery>

    <cfset struct={
      "Img" = empinfo.Photo
      , "Firstname"=empinfo.Firstname
      , "Lastname"=empinfo.Lastname
      , "Email"=empinfo.Email
      , "Phone_no"=empinfo.Phone_number
      , "Dob"=empinfo.Dob
      , "Marital_status"=empinfo.Marital_status
      , "Gender"=empinfo.Gender
      , "Technology"=empinfo.Technology
      , "Address"=empinfo.Address
      , "City"=empinfo.City
      , "Pin"=empinfo.Pin
      , "State"=empinfo.State
      , "Country"=empinfo.Country
    }>

    <cfreturn struct>

  </cffunction>

  <cffunction name="delete_Data" returnformat="json" returntype="any" access="remote" hint="Delete Button modal">

    <cfargument name="del" required="true" type="any">

    <cftry>
      <cfquery datasource = "Nikhildb" name="empdelete">
        delete from user where Id = <cfqueryparam value="#arguments.del#" cfsqltype="cf_sql_integer">
      </cfquery>
      <cfcatch type="any">
        Error: <cfoutput>
          #cfcatch.message#</cfoutput>
      </cfcatch>

    </cftry>
    <cfreturn true>
  </cffunction>

  <!---admin toggle--->
  <cffunction name="toggle_data" returnformat="json" returntype="any" access="remote" hint="toggle button">
    <cfargument name="empid" required="true" type="any">

    <cfquery datasource = "Nikhildb" name="toggle">
      select * from admin where user_id = <cfqueryparam value="#arguments.empid#" cfsqltype="cf_sql_integer">
      ;
    </cfquery>

    <cfdump var="#empid#">

    <cfif toggle.RecordCount eq 0>

      <cfquery datasource = "Nikhildb" name="insert">
        Insert into admin(user_id,is_admin)values( <cfoutput>
          #arguments.empid#</cfoutput>
        ,1);
      </cfquery>

    <cfelse>

      <cfquery datasource = "Nikhildb" name="admin">
        select is_admin from admin where user_id=( <cfoutput>
          #arguments.empid#</cfoutput>
        );
      </cfquery>

      <cfif admin.is_admin eq 0>
        <cfquery name="Update_the_admin" datasource = "Nikhildb">
          update admin set is_admin = 1 where user_id=( <cfoutput>
            #arguments.empid#</cfoutput>
          );
        </cfquery>

      <cfelse>
        <cfquery name="Update_admin" datasource = "Nikhildb">
          update admin set is_admin = 0 where user_id=( <cfoutput>
            #arguments.empid#</cfoutput>
          );
        </cfquery>

      </cfif>
    </cfif>

  </cffunction>

  <!---search data--->
  <cffunction name="search_btn" returnformat="json" returntype="any" access="remote" hint="Search button">
    <cfargument name="search" required="true" type="any">

    <cfquery datasource = "Nikhildb" name="query_search">
      select * from user
      left join admin on user.Id=admin.user_id
      where user.Email Like "#arguments.search#%"
    </cfquery>
    <cfreturn #serializeJSON(query_search)#>
  </cffunction>

</cfcomponent>