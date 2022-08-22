@isTest
public class ContactTriggerTest {
    @testSetup
    static void dataFactory(){
        Account acc = new Account(name='testAccount');
        insert acc;
        List<Contact> conList = new List<Contact>{
            new Contact (lastName='testContact1', AccountId=acc.Id, Active__c=true),
            new Contact (lastName='testContact2', AccountId=acc.Id, Active__c=true),
            new Contact (lastName='testContact3', AccountId=acc.Id, Active__c=true)
                
        };
        insert conList;
        Account accUpdated = [SELECT Id, Active_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(3, accUpdated.Active_Contacts__c);
        System.assertNotEquals(0, accUpdated.Active_Contacts__c);
            
    }
	@isTest
    static void contactDMLTest(){
        List<Contact> conList = [SELECT Id, LastName FROM Contact WHERE LastName LIKE '%testContact1%'];
        for(Contact con:conList){
            con.lastName += 'Updated';
            con.Active__c = false;
        }
        update conList;
        Account accUpdated = [SELECT Id, Active_Contacts__c FROM Account WHERE Name = 'testAccount'];
        System.assertEquals(2, accUpdated.Active_Contacts__c);
        System.assertNotEquals(0, accUpdated.Active_Contacts__c);
 
    }
    
        @isTest 
    static void testUpdateCon (){
        Account accUpdated = [SELECT Id, Active_Contacts__c FROM Account WHERE Name = 'testAccount'];
        Account acc2 = new Account (Name = 'TestAccount2');
        insert acc2;
        
        Contact con2 = [SELECT Id, LastName FROM Contact WHERE LastName LIKE '%testContact2%' LIMIT 1];
		con2.AccountId = acc2.Id;
        update con2;
        System.assertEquals(3, accUpdated.Active_Contacts__c);
        System.assertNotEquals(0, accUpdated.Active_Contacts__c);
    }
    
    @isTest 
    static void testDelete (){
        List<Contact> conList = [SELECT Id, LastName FROM Contact WHERE LastName LIKE '%testContact1%'];
        delete conList;
        undelete conList;
    }
    
}