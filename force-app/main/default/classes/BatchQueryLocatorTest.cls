@IsTest
public with sharing class BatchQueryLocatorTest {

    @TestSetup
    static void makeData(){
        Account acc = new Account(
            Name = 'TestName', 
            BillingCity='Minsk'
        );
        insert acc;
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < 20; i++){
            contacts.add(
                new Contact(
                    LastName = 'Test' + i, 
                    AccountId = acc.Id
                )
            );
        }
        insert contacts;
    }

    @IsTest
    static void test(){
        Test.startTest();
        ID jobID = Database.executeBatch(new BatchQueryLocator());
        Test.stopTest();

        System.assertEquals(
            [Select Account.BillingStreet FROM Contact LIMIT 1].Account.BillingStreet,
            [Select MailingStreet FROM Contact LIMIT 1].MailingStreet);
        System.assertEquals([SELECT Is_Synced__c FROM Contact LIMIT 1].Is_Synced__c, true);
    }
}
