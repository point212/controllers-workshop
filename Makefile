setup: newapp install-simpleform install-haml install-pry install-powerassert

newapp:
	rails new . --skip-action-mailer --skip-action-mailbox   --skip-action-text --skip-active-storage  --skip-action-cable --skip-turbolinks

install-simpleform: 
	rails app:template LOCATION="https://railsbytes.com/script/VQLslK"
	
install-haml:
	rails app:template LOCATION="https://railsbytes.com/script/x7msKK"

install-pry:
	rails app:template LOCATION='https://railsbytes.com/script/V2Gs4X'

install-powerassert:
	rails app:template LOCATION='https://railsbytes.com/script/xjNsY4'

test:
	rails test

.PHONY: app test
