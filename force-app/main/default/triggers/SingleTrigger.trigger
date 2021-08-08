trigger SingleTrigger on Account (
    before insert,
    before update,
    before delete,
    after insert,
    after delete,
    after undelete) {

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            SingleTriggerHandler.hadleBeforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            SingleTriggerHandler.hadleBeforeUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            SingleTriggerHandler.hadleBeforeDelete(Trigger.old, Trigger.oldMap);
        }
    }

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            SingleTriggerHandler.hadleAfterInsert(Trigger.new, Trigger.newMap);
        }
        if(Trigger.isUpdate){
            SingleTriggerHandler.hadleAfterUndelete(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            SingleTriggerHandler.hadleAfterDelete(Trigger.old, Trigger.oldMap);
        }
        if(Trigger.isUndelete){
            SingleTriggerHandler.hadleAfterUndelete(Trigger.new, Trigger.newMap);
        }
    }
}