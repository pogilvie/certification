user = w20
devhub = DevHub
install = Winter20
handson-package = 04t1v0000021k2c

pull:
	sfdx force:source:pull -u $(user)

push:
	sfdx force:source:push -u $(user)

convert:
	sfdx force:source:convert -d deploy

install:
	sfdx force:mdapi:deploy -d deploy -u $(install) -w 100

open:
	sfdx force:org:open -u $(user)

create:
	sfdx force:org:create -a $(user) -f config/scratch.json -v $(devhub)

list:
	sfdx force:org:list

listso:
	sfdx force:schema:sobject:list -c all -u $(user) 

install-package:
	sfdx force:package:install -p $(handson-package) -r -s AllUsers -u $(user) -w 20
