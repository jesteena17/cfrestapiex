<cfoutput>
<cflock scope="session" type="readonly" timeout="5">
<cfparam name="session.cart" default="#ArrayNew(1)#">
<cfset cartSize = ArrayLen(session.cart)>
<cfset total = 0>
<table class="cart" cellspacing="0" style="margin-top: 2em;">
<caption>Cart has (#cartSize#) items</caption>
<thead>
<tr>
  <th>Product</th>
  <th>Unit Price</th>
  <th>Quantity</th>
  <th>Total</th>
</tr>
</thead>
<cfloop index="i" from="1" to="#cartSize#">
<tr>
  <td>
    #session.cart[i].product#
  </td>
  <td style="text-align: right;">
  <cfset itemPrice=session.cart[i].price/>
    #LSCurrencyFormat(session.cart[i].price,"local")#
  </td>
  <td style="text-align: center;">#session.cart[i].quantity#</td>
  <td><cfset itemTotal = session.cart[i].quantity * itemPrice>#LSCurrencyFormat(itemTotal,"local")#</td>
  <cfset total = total + itemTotal>
</tr>
</cfloop>
</cflock>
<tr>
  <td colspan="2" style="border: 0;"></td>
  <td style="border-left: 1px solid ##aaa; text-align: right;">Total</td>
  <td style="font-weight: bold; border-left: 0;">#LSCurrencyFormat(total,"local")#</td>
  <td style="border-left: 0;">&nbsp;</td>
</tr>
</table>
</cfoutput>