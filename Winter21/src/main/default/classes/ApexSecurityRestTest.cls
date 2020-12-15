@isTest class ApexSecurityRestTest {

    @testSetup static void setup() {

        insert new User(
            Alias = 'jdoe', 
            Email = 'jane@doe.org', 
            FirstName = 'Jane',
            LastName ='Doe', 
            LanguageLocaleKey = 'en_US', 
            LocaleSidKey = 'en_US', 
            EmailEncodingKey = 'UTF-8', 
            ProfileId = [SELECT Id FROM Profile WHERE Name='Standard User'].Id, 
            TimeZoneSidKey =' America/Los_Angeles', 
            UserName = 'jane@doe.org.ten66'
        );

        Account a = new Account(
            Name = 'Smith Account'
        );
        insert a;

        insert new Contact(
            FirstName = 'John',
            LastName = 'Smith',
            AccountId = a.Id,
            Top_Secret__c = '42'
        );
    }

    @isTest static void run() {
        User JaneDoe = [SELECT Id FROM User WHERE LastName = 'Doe'];
        Contact JohnSmith = [SELECT id FROM Contact WHERE LastName = 'Smith'];
        
        RestRequest req = new RestRequest();
        req.requestURI = '/apexSecurityRest';
        req.httpMethod = 'GET';

        req.params.put('id', JohnSmith.Id);
        
        RestContext.request = req;

        RestResponse res = new RestResponse();
        RestContext.response = res;

        System.runAs(JaneDoe) {
            ApexSecurityRest.doGet();
        }
    }
}
