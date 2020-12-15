@RestResource(urlMapping='/apexSecurityRest')

global with sharing class ApexSecurityRest {

    @HttpGet
    global static Contact doGet() {
        Id recordId = RestContext.request.params.get('id');
        Contact result;
        SObjectAccessDecision readable, updateable;

        if (recordId == null) {
           throw new FunctionalException('Id parameter is required');
        }

        List<Contact> results = [
            SELECT id, Name, Title, Top_Secret__c, Account.Name 
            FROM Contact 
            WHERE Id = :recordId
        ];

        Boolean throwException = false;

        if (results.isEmpty()) {
            throwException = true;
        } else {
            result = results[0];
            readable = Security.stripInaccessible(AccessType.READABLE, results);
            updateable = Security.stripInaccessible(AccessType.UPDATABLE, results);
        }

        if (!throwException && 
            !readable.getRemovedFields().isEmpty()
        ) {
            System.debug('unreadable');
            System.debug(readable.getRemovedFields());
            throwException = true;
        }

        if (!throwException && 
            !updateable.getRemovedFields().isEmpty()
        ) {
            System.debug('unwriteable');
            System.debug(updateable.getRemovedFields());
            for (String field : updateable.getRemovedFields().get('Contact')) {
                System.debug('field: ' + field);
                if (field != 'Name') {
                    throwException = true;
                }
            }
        }

        if (throwException) {
            throw new SecurityException('You don\'t have access to all contact fields required to use this API');
        }

        result.Description = result.Account?.Name;
        return result;
    }

    public class FunctionalException extends Exception{}
    public class SecurityException extends Exception{}
}
