<cfcomponent>
    <cffunction name="additemtocart" output="true" access="remote" >
       <cflock scope="session" type="exclusive" timeout="5">
            <cfparam name="session.cart" default="#ArrayNew(1)#">
            <cfset sItem = StructNew()>
            
            <cfif StructIsEmpty(sItem) and IsStruct(sItem)>
                <cfset sItem.product_id = form.product_id>
                <cfset sItem.product = form.product_name>
                <cfset sItem.price = form.price>
                <cfset sItem.quantity =1>
                
            <cfelse>
                <cfloop collection = "#sItem#" item = "itm">
                    <cfif arraylen(StructFindValue(itm,"#form.product_id#","one")) GT 0>
                    <cfset itm.quantity =itm.quantity+1>
                    <cfelse>
                    <cfset itm.quantity = form.quantity>
                    </cfif>
                </cfloop>
            </cfif>
            <cfset ArrayAppend(session.cart, sItem)>
            
        </cflock>
        <cfdump var=#session.cart#/>
        <cfreturn session.cart>
    </cffunction>
</cfcomponent>