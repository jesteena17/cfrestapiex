
<cfloop LIST = "#Server.Coldfusion.SupportedLocales#"
index = "locale" delimiters = ",">
<cfset oldlocale = SetLocale(locale)>
<cfoutput><p><b><I>#locale#</I></b><br>
Local: #LSCurrencyFormat(100000, "local")#<br>
International: #LSCurrencyFormat(100000, "international")#<br>
None: #LSCurrencyFormat(100000, "none")#<br>
<hr noshade>
</cfoutput>
</cfloop>


<cfscript>
    var rb:IResourceBundle = new ResourceBundle("MessageBundle", Locale.US);
      rb.content["LANGUAGE"] = "Francais";
      rb.content["GREETING"] = "Bonjour";
</cfscript>