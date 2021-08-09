public with sharing class BatchIterable implements Database.Batchable<Contact> {

    public Iterable<Contact> start(Database.BatchableContext bc){
        return new CustomIterable();
    }

    public void execute(Database.BatchableContext bc, List<Contact> contacts){
        for(Contact contact : contacts){
            contact.MailingStreet = contact.Account.BillingStreet;
            contact.Is_Synced__c = true;
            contact.Account.Updated_By_Contact__c = true;
        }
        update contacts;
    }

    public void finish(Database.BatchableContext bc){
    }
}