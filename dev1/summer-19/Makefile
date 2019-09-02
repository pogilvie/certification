
user = plev
devhub = DevHub
install = summer19
packageid = 04t4P000002EMv0

pull:
	sfdx force:source:pull -u $(user)

convert:
	sfdx force:source:convert -d deploy

install:
	sfdx force:mdapi:deploy -d deploy -u $(install) -w 100

open:
	sfdx force:org:open -u $(user)

create:
	sfdx force:org:create -a $(user) -f config/scratch.json -v $(devhub)

install-package:
	sfdx force:package:install -p $(packageid) -u $(user) -w 20 -b 20 -s AllUsers

list:
	sfdx force:org:list