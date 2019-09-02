
user = plev
devhub = DevHub
install = summer19
packageid = 04t4P000002EMv0

push:
	sfdx force:source:push -u $(user)

pull:
	sfdx force:source:pull -u $(user)

convert:
	sfdx force:source:convert -d deploy

install:
	sfdx force:mdapi:deploy -d deploy -u $(install) -w 100

clean:
	rm -rf deploy/*

open:
	sfdx force:org:open -u $(user)

create:
	sfdx force:org:create -a $(user) -f config/scratch.json -v $(devhub)

install-package:
	sfdx force:package:install -p $(packageid) -u $(user) -w 20 -b 20 -s AllUsers

test:
	sfdx force:apex:test:run -l RunLocalTests -u $(user) -w 10

tail:
	sfdx force:apex:log:tail -u $(user)

list:
	sfdx force:org:list