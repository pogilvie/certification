user = email
devhub = DevHub
install = summer19

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

list:
	sfdx force:org:list
