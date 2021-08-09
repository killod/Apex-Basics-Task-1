public with sharing class FutureAsync {

    @future
    public static void futureTest(){
        List<Contact> contacts = [
            SELECT Id 
            FROM Contact 
            WHERE AccountId IN (SELECT Id 
                                FROM Account 
                                WHERE BillingCity != '' OR BillingCountry != '' OR BillingStreet != '' )
            ];
        for(Contact contact : contacts){
            contact.Is_Synced__c = false;
            contact.Processed_By_Future__c = true;
        }
        update contacts;
    }
}
