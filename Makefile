setup: newapp simpleform haml pry powerassert

newapp:
	rails new . --skip-action-mailer --skip-action-mailbox   --skip-action-text --skip-active-storage  --skip-action-cable --skip-turbolinks

simpleform: 
	rails app:template LOCATION="https://railsbytes.com/script/VQLslK"
	
haml:
	rails app:template LOCATION="https://railsbytes.com/script/x7msKK"

pry
	rails app:template LOCATION='https://railsbytes.com/script/V2Gs4X'

powerassert:
	rails app:template LOCATION='https://railsbytes.com/script/xjNsY4'
