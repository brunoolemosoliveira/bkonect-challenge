public class AccountUtils {

    public AccountUtils () {
    }

    public static List<Account_Industry__mdt> getIndustries() {

        return [SELECT  Id,
                Label
                FROM Account_Industry__mdt];
    }

    public static Double getHotAnnualRevenue() {

        return [SELECT  Id,
                Label,
                Number_Value__c
                FROM Account_Parameter__mdt WHERE Label='Hot Annual Revenue' LIMIT 1].Number_Value__c;
    }    


}