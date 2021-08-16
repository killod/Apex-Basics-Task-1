@IsTest
public with sharing class ApexBasicsTaskTest {

    @TestSetup
    static void makeData(){
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 20; i++){
            accounts.add(
                new Account(
                    Name = 'Test' + i
                )
            );
        }
        insert accounts;
    }

    @IsTest
    static void testInsertPart(){
        List<ApexBasicsTask.ActionRequest> requestList = new List<ApexBasicsTask.ActionRequest>();
        for(Account account : [SELECT Id FROM Account]){
            ApexBasicsTask.ActionRequest request = new ApexBasicsTask.ActionRequest();
            request.dmlType = 'insert';
            request.accountId = account.Id;
            requestList.add(request);
        }

        Test.startTest();
        ApexBasicsTask.apexBasicsTask(requestList);
        Test.stopTest();

        System.assertEquals(20, [SELECT COUNT() FROM Task]);
    }

    @IsTest
    static void testUpdatePart(){
        List<ApexBasicsTask.ActionRequest> requestList = new List<ApexBasicsTask.ActionRequest>();
        for(Account account : [SELECT Id FROM Account]){
            ApexBasicsTask.ActionRequest request = new ApexBasicsTask.ActionRequest();
            request.dmlType = 'update';
            request.accountId = account.Id;
            requestList.add(request);
        }

        Test.startTest();
        ApexBasicsTask.apexBasicsTask(requestList);
        Test.stopTest();

        System.assertEquals(0, [SELECT COUNT() FROM Task]);
    }

}
