<cfcomponent>
     <cfset this.name = "cfrestdemo">
     <cfset this.clientStorage="Cookie"/>
     <cfset this.Sessionmanagement = TRUE>
     <cfset this.sessionTimeout = CreateTimeSpan(0, 0, 20, 0)/>
     <cfset this.clientManagement = true>
     <cfset this.setClientCookies = true /> 
     <cfset this.datasource="testdbdsn" />
     <cffunction name="onApplicationStart" returntype="boolean">
     <cfset application.jwtkey="mysecretkey"/>
      <cfset restInitApplication(GetDirectoryFromPath(getCurrentTemplatePath())&'restapi','controller')/>
      <cfreturn true>
     </cffunction>
    <cffunction name="onRequestStart" returntype="void" output="true">
        <cfif isdefined("URL.reload") and URL.reload eq "r3l0ad">
            <cflock timeout="10" >
                <cfset onApplicationStart()/>
            </cflock>
            <cfhtmlhead text = "<script language=""javascript"">alert('applictaionrefreshed');</script>">
        </cfif>
    </cffunction>
</cfcomponent>