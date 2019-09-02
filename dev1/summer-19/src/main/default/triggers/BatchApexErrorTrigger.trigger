trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {

    List<BatchLeadConvertErrors__c> errors = new List<BatchLeadConvertErrors__c>();

    for (BatchApexErrorEvent e : Trigger.new) {
        errors.add(new BatchLeadConvertErrors__c(
            AsyncApexJobId__c = e.AsyncApexJobId,
            Records__c = e.JobScope,
            StackTrace__c = e.StackTrace
        ));
    }

    insert errors;

}