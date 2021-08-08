public with sharing class SingleTriggerHandler {

    public static void hadleBeforeInsert(List<Account> newAccounts) {
        SingleTriggerHelper.onBeforeInsert(newAccounts);
    }

    public static void hadleBeforeUpdate(List<Account> newAccounts, Map<Id, Account> newIdAccountMap, List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.onBeforeUpdate(newAccounts, newIdAccountMap, oldAccounts, oldIdAccountMap);
    }

    public static void hadleBeforeDelete(List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.onBeforeDelete(oldAccounts, oldIdAccountMap);
    }

    public static void hadleAfterInsert(List<Account> newAccounts, Map<Id,Account> newIdAccountMap) {
        SingleTriggerHelper.onAfterInsert(newAccounts, newIdAccountMap);
    }

    public static void hadleAfterUpdate(List<Account> newAccounts, Map<Id, Account> newIdAccountMap, List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.onAfterUpdate(newAccounts, newIdAccountMap, oldAccounts, oldIdAccountMap);
    }

    public static void hadleAfterDelete(List<Account> oldAccounts, Map<Id, Account> oldIdAccountMap) {
        SingleTriggerHelper.onAfterDelete(oldAccounts, oldIdAccountMap);
    }

    public static void hadleAfterUndelete(List<Account> newAccounts, Map<Id,Account> newIdAccountMap) {
        SingleTriggerHelper.onAfterUndelete(newAccounts, newIdAccountMap);
    }
}
