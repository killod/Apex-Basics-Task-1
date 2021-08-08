public with sharing class SingleTriggerHelper {
    private static Boolean IsFirstRun = true;

    public static void messageToDebug(){
        if(IsFirstRun){
            System.debug('First run');
            IsFirstRun = false;
        }
    }

    public static void onBeforeInsert(List<Account> newAccounts) {
        SingleTriggerHelper.messageToDebug();
    }

    public static void onBeforeUpdate(List<Account> newAccounts, Map<Id, Account> newIdAccountMap, List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.messageToDebug();
    }

    public static void onBeforeDelete(List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.messageToDebug();
    }

    public static void onAfterInsert(List<Account> newAccounts, Map<Id,Account> newIdAccountMap) {
        SingleTriggerHelper.messageToDebug();
    }

    public static void onAfterUpdate(List<Account> newAccounts, Map<Id, Account> newIdAccountMap, List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.messageToDebug();
    }

    public static void onAfterDelete(List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.messageToDebug();
    }

    public static void onAfterUndelete(List<Account> newAccounts, Map<Id,Account> newIdAccountMap) {
        SingleTriggerHelper.messageToDebug();
    }
}
