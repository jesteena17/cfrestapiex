
<cfcomponent>
<cffunction name="sendMessageWithTwilio" output="false" access="remote" returnType="string">
    <cfargument name="aMessage" type="string" required="true" />
    <cfargument name="destinationNumber" type="string" required="true" />

    <cfset var twilioAccountSid = "AC69c53128c29887bba51bcd0a713a6e79" />
    <cfset var twilioAuthToken = "6f6a9501b7f48d1a3206416ad37cbf4f" />
    <cfset var twilioPhoneNumber = "+15706307373" />

    <cfhttp 
        result="result" 
        method="POST" 
        charset="utf-8" 
        url="https://api.twilio.com/2010-04-01/Accounts/#twilioAccountSid#/Messages.json"
        username="#twilioAccountSid#"
        password="#twilioAuthToken#" >

        <cfhttpparam name="From" type="formfield" value="#twilioPhoneNumber#" />
        <cfhttpparam name="Body" type="formfield" value="#arguments.aMessage#" />
        <cfhttpparam name="To" type="formfield" value="#arguments.destinationNumber#" />

    </cfhttp>
<cfdump var = "#result#" >
    <cfif result.Statuscode IS "201 CREATED">
        <cfreturn deserializeJSON(result.Filecontent.toString()).sid />
    <cfelse>
        <cfreturn result.Statuscode />
    </cfif>

</cffunction>

    
</cfcomponent>