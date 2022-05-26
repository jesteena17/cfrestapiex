<cfoutput>

<!--
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

<cfhttp url="https://fakestoreapi.com/products" method="GET"
resolveurl="false" result="resp">
</cfhttp>
<cfset pro=#deserializejson(resp.Filecontent)#/>

-->

<cfloop array="#pro#" index="i">
#i.id#-#i.title#<br>
<form action="addcart.cfc?method=additemtocart" method="post">
    <input type="hidden" name="productid" value="#i.id#"/>
    <input type="hidden" name="product_name" value="#i.title#"/>
    <input type="hidden" name="price" value="#i.price#"/>
    <input type="hidden" name="quantity" value="1"/>
    <input type="hidden" name="userid" value="10"/>
    <input type="submit" name="addtocart" value="Add to cart"/>
</form>
</cfloop>
</cfoutput>