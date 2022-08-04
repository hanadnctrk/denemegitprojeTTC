@isTest
public class ContactTriggerTest {
    @testSetup
    static void dataFactory(){
        Account acc = new Account(name='testAccount');
        insert acc;
        List<Contact> conList = new List<Contact>{
            new Contact (lastName='testContact1', AccountId=acc.Id),
            new Contact (lastName='testContact2', AccountId=acc.Id)
        };
        insert conList;
            
    }
	@isTest
    static void contactDMLTest(){
        List<Contact> conList = [SELECT Id, LastName FROM Contact WHERE LastName LIKE 'testContact%'];
        for(Contact con:conList){
            con.lastName += 'Updated';
        }
        update conList;
        delete conList;
        undelete conList;
    }
}