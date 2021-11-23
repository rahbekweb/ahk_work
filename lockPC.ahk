#q::
	requestBody := "sendsms=nu"
				 . "&client_secret=xxxxxxxxxxxxxxxxxxx"
				 . "&refresh_token=xxxxxxxxxxxxxxxxxxx"
				 . "&grant_type=refresh_token"
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("POST", "https://1b.dk/sms.php")
	whr.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	whr.Send(requestBody)
	MsgBox % whr.ResponseText
return
