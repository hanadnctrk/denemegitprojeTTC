@isTest
public class AccountContactServiceTest {
	@isTest
    static void testMehod1(){
        Set<Id> accIds = new Set<Id>();
        Account acc = new Account(name='testAccount');
        insert acc;
        List<Contact> conList = new List<Contact>{
            new Contact (lastName='testContact1', AccountId=acc.Id, Active__c=true),
            new Contact (lastName='testContact2', AccountId=acc.Id, Active__c=true)
        };
        insert conList;
        accIds.add(acc.Id);
        AccountContactService.updateActiveContacts(accIds);
    }
}