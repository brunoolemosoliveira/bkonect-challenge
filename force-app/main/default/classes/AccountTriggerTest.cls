@isTest
public class AccountTriggerTest {

    @TestSetup
    public static void test_setup(){
        Test.startTest();        
        DataFactory.createAccount();
        Test.stopTest();
    }
    
    @isTest
    public static void validatePositive(){
        Account acc = [SELECT Id, Name, Rating, AnnualRevenue  FROM Account LIMIT 1];
        Test.startTest();
        acc.Name = 'ALTERACAO';
        acc.Industry = 'A';
        acc.AnnualRevenue = 50000;
        update acc;
        Test.stopTest();
		Account result = [SELECT Id, Name, Rating, AnnualRevenue  FROM Account LIMIT 1];
        System.assertEquals('Hot', result.Rating);
        System.assertEquals('ALTERACAO - Updated', result.Name);
    }
    
    @isTest
    public static void validateNegative(){
        try{
            Account acc = [SELECT Id, Name, Rating, AnnualRevenue  FROM Account LIMIT 1];
            Test.startTest();
            acc.Name = 'ALTERACAO';
            acc.Industry = 'Other';
            acc.AnnualRevenue = 50000;
            update acc;
            Test.stopTest();            
        } catch(Exception e) {
            Boolean result = e.getMessage().contains('aborted') ? true : false;
        	System.assertEquals(true,result);    
        }
   }    

}
