SObjectAccessDecision securityDecision =
    Security.stripInaccessible(
        AccessType.UPDATABLE,
        [SELECT Name, BudgetedCost, ActualCost FROM Campaign];
);

List<Contact> records = [SELECT Id, Name, Phone, HomePhone FROM Contact];
SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, records);