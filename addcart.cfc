<cfcomponent>
    <cffunction name="additemtocart" output="true" access="remote" >
        <cflock scope="session" type="exclusive" timeout="5">
            <cfset addasnewitem = true>
            <cfif not isDefined("session.cart")>
                <cfset session.cart = arrayNew(1)>
            <cfelse>
                <cfloop index="i" from="1" to="#arrayLen(session.cart)#">
                    <cfif form.productid is session.cart[i].product_id and form.userid is session.cart[i].user_id>
                        <cfset session.cart[i].quantity = 
                        session.cart[i].quantity + 1>
                        <cfset addasnewitem = false>
                    </cfif>
                </cfloop>
            </cfif>
            <cfif addasnewitem is true>
                <cfset sItem = StructNew()>
                <cfset sItem.product_id = form.productid>
                <cfset sItem.product = form.product_name>
                <cfset sItem.price = form.price>
                <cfset sItem.quantity = form.quantity>
                <cfset sItem.user_id = form.userid>
                <cfset ArrayAppend(session.cart, sItem)>
            </cfif>
        </cflock>
        <cfreturn session.cart>
    </cffunction>
</cfcomponent>