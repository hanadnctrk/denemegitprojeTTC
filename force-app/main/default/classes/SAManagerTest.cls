@isTest
public class SAManagerTest {
    // Once create test data in testSetup method and use these data in test methods
    @testSetup
    static void createTestData(){
       Contact con = new Contact ();
       con.firstName= 'Test';
       con.LastName = 'Contact';
       insert con;
        
       SA_details__c sa = new SA_details__c();
       sa.Name__c = 'Test SADetail';
       sa.Supervisor__c = con.Id;
       insert sa;
    }
    
	@isTest
    static void searchSasTest (){
        
       List<SA_details__c> saList2 = SAManager.searchSas('Test SADetail');
       System.assertEquals(1, saList2.size()); // positive test
       System.assertNotEquals(0, saList2.size()) ; // negative test
        
       List<SA_details__c> saList4 = SAManager.searchSas('');
       System.assert(saList4.size()>0);
           
    }
    
    @isTest
    static void getAllSAdetailsTest(){
        
        List<SA_details__c> saList3 = SAManager.getAllSAdetails();
        System.assert(saList3.size()>0); //positive test
        System.assert(saList3.size()==0); //negative test
    }
}