public with sharing class ApexBasicsTask {
    public class ActionRequest{
        @InvocableVariable
        public String dmlType;
        @InvocableVariable
        public Id accountId;
    }
    @InvocableMethod(label = 'Tasks creation logic' description = 'When new Account is created, create new Task object with Subject Negotiations with {Account.Name}, link created Account with this Task. If Account is updated and Account has more than 3 Tasks => assign all Tasks to one User (random active User)' category = 'Account')
    public static void apexBasicsTask(List<ActionRequest> accountsFromPB) {
        List<Id> insertAccountsIds = new List<Id>();
        List<Id> updateAccountsIds = new List<Id>();

        for(ActionRequest request : accountsFromPB){
            if(request.dmlType == 'insert'){
                insertAccountsIds.add(request.accountId);
            }else{
                updateAccountsIds.add(request.accountId);
            }
        }

        if(!insertAccountsIds.isEmpty()){
            List<Task> tasksToCreate = new List<Task>();
            Map<Id, Account> createdAccounts = new Map<Id, Account>([
                SELECT Name 
                FROM Account 
                WHERE Id 
                IN: insertAccountsIds
            ]);
            for(Id id:createdAccounts.keySet()){
                tasksToCreate.add(new Task(
                    Subject='Negotiations with ' + createdAccounts.get(id).Name, WhatId = id
                ));
            }
            insert tasksToCreate;
        }

        if(!updateAccountsIds.isEmpty()){
            List<Task> tasksToReassign = new List<Task>();
            for(Account a :[SELECT Name,(Select Id FROM Tasks) FROM Account]){
                if(a.Tasks.size() > 3){
                    tasksToReassign.addAll(a.Tasks);
                }
            }
            List<Account> acoountsWithlotsOfTasks = [SELECT Id FROM Account];
            Id activeUserId = [
            SELECT Id 
            FROM User 
            WHERE IsActive = TRUE 
            AND Name LIKE '%User%' 
            LIMIT 1
            ].Id;
            for(Task task:tasksToReassign){
                task.OwnerId = activeUserId;
            }
            update tasksToReassign;
        }
    }
}