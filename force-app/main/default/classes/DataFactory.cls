public class DataFactory {
    
    @TestVisible 
    private static void createAccount() {
        
        Account acc = new Account();
        acc.Name = 'DEFAULT TEST ACCOUNT';
        acc.Industry = 'Other';
        acc.Rating = 'Cold';
        acc.AnnualRevenue = 500;
        insert acc;
    }

    
}