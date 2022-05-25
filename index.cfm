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

<cfhttp url="http://api.labsmobile.com/get/send.php" method="GET"
resolveurl="false" result="resp">
<cfhttpparam type="FORMFIELD" name="username" value="xx@xx.xxx">
<cfhttpparam type="FORMFIELD" name="password" value="xxxxxxx">
<cfhttpparam type="FORMFIELD" name="message" value="#form.message#">
<cfhttpparam type="FORMFIELD" name="msisdn" value="#form.msisdn#">
</cfhttp>
<cfdump var = "#resp#">
</cfoutput>