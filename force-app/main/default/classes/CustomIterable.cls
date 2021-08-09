public class CustomIterable implements Iterable<Contact> {
    public Iterator<Contact> iterator(){
       List<Contact> contacts = [
            SELECT Is_Synced__c, MailingStreet, Account.BillingStreet, Account.Updated_By_Contact__c 
            FROM Contact 
            WHERE Is_Synced__c = FALSE];
       return new CustomIterator(contacts);
    }
 }