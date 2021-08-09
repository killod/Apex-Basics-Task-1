public with sharing class BatchQueryLocator implements Database.Batchable<SObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([
            SELECT Is_Synced__c, MailingStreet, Account.BillingStreet, Account.Updated_By_Contact__c 
            FROM Contact 
            WHERE Is_Synced__c = FALSE
        ]);
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
