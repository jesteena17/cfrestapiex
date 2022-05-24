<cfoutput>
    Rest APi is running at http://localhost:8500/rest/controller/APIroutes
<cfset stFields = {
        "test" = "test"
}>
    <cfhttp
url="http://localhost:8500/rest/controller/APIroutes/login"
method="post"
port="8500"
result="res">
 <cfhttpparam type="header" name="Content-Type" value="application/json" />
    <cfhttpparam type="body" value="#serializeJSON(stFields)#">
</cfhttp>
<cfset dres=deserializejson(res.Filecontent)/>
message:#dres.message#<br>success:#dres.success#<br>jwt token: #dres.token#<br>
</cfoutput>