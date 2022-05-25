
<<<<<<< Updated upstream
<cfset twilioUsername = "AC69c53128c29887bba51bcd0a713a6e79" />
<cfset twilioPassword = "e562ccf5ea8856feb81288201965ad6b" />


<cfset twilioFrom = "+15706307373" />


<cfset twilioSMSResource = (
	"http://api.twilio.com/2008-08-01" &
	"/Accounts/#twilioUsername#/SMS/Messages"
	) />

<cfparam name="form.to" type="string" default="" />
<cfparam name="form.message" type="string" default="" />

<cfif (
	reFind( "^\d{10}$", form.to ) &&
	len( form.message )
	)>

	<cfhttp
		result="post"
		method="post"
		url="#twilioSMSResource#"
		username="#twilioUsername#"
		password="#twilioPassword#">

		
		<cfhttpparam
			type="formfield"
			name="From"
			value="#twilioFrom#"
			/>

		
		<cfhttpparam
			type="formfield"
			name="To"
			value="#form.to#"
			/>

		<cfhttpparam
			type="formfield"
			name="Body"
			value="#form.message#"
			/>

	
		<cfhttpparam
			type="formfield"
			name="StatusCallback"
			value="http://www.bennadel.com/......./callback.cfm"
			/>

	</cfhttp>


	<cflocation
		url="#cgi.script_name#?success"
		addtoken="false"
		/>

</cfif>

<cfoutput>

	<!DOCTYPE HTML >
	<html>
	<head>
		<title>Sending SMS Text Messages With Twilio And ColdFusion</title>
	</head>
	<body>

		<h1>
			Sending SMS Text Messages With Twilio And ColdFusion
		</h1>

	
		<cfif structKeyExists( url, "success" )>

			<p>
				<strong>Your SMS text message has been sent!</strong>
			</p>

		</cfif>

		<form method="post" action="#cgi.script_name#">

=======
		<form method="post" action="restapi/cfc/sensms.cfc?method=sendMessageWithTwilio">
>>>>>>> Stashed changes
			<p>
				From:
				<strong>Twilio</strong> -
				<em>(rented Phone Number)</em>.
			</p>
<<<<<<< Updated upstream

			<p>
				To:<br />
				<input type="text" name="to" size="20" />
			</p>

			<p>
				SMS Text Message:<br />
				<input type="text" name="message" size="70" maxlength="140" />
			</p>

			<p>
				<input type="submit" value="Send SMS Message" />
			</p>

		</form>

	</body>
	</html>

</cfoutput>
=======
			<p>
				To:<br />
				<input type="text" name="destinationNumber" value="+918111945425" size="20" />
			</p>
			<p>
				SMS Text Message:<br />
				<input type="text" name="aMessage" size="70" value="hi" maxlength="140" />
			</p>
			<p>
				<input type="submit" value="Send SMS Message" />
			</p>
		</form>
>>>>>>> Stashed changes
