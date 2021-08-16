@IsTest
public with sharing class FutureAsyncTest {

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
        FutureAsync.futureTest();
        Test.stopTest();

        System.assertEquals(true, [Select Processed_By_Future__c FROM Contact LIMIT 1].Processed_By_Future__c);
    }
}
