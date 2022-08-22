@isTest
public class LeadBatchTest {
	@isTest
        static void executeBatch(){
            Lead ld = new Lead(lastName='testLead', Company='testCompany', Status='Open - Not Contacted', LeadSource = 'Web');
            insert ld;
            LeadBatch mybatch = new LeadBatch();
            Database.executeBatch(mybatch);
        }
    
    @isTest
        static void executeBatch1(){
            Lead ld = new Lead(lastName='testLead', Company='testCompany', Status='Open - Not Contacted');
            insert ld;
            LeadBatch mybatch = new LeadBatch();
            Database.executeBatch(mybatch);
        }
}