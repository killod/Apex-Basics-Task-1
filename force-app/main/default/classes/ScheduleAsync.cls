public with sharing class ScheduleAsync implements Schedulable {

    public void execute(SchedulableContext ctx){
        BatchQueryLocator bql = new BatchQueryLocator();
        Id batchIdLocator = Database.executeBatch(bql);
        BatchIterable bi = new BatchIterable();
        Id batchIdIterable = Database.executeBatch(bi);
    }
}
