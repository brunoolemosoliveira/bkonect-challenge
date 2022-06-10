public class AccountService {
    public void InitialValidation(List<Account> accounts){
        List<String> lstValidIndustries = this.getValidIndutries();
        for(account acc : accounts){
            if (!isValidIndustry(acc.Industry, lstValidIndustries)){
                acc.addError('Industry ' + acc.Industry + 'is Invalid. This operation was aborted');
            }
        }
	}
    private Boolean isValidIndustry(String industry, List<String> lstValidIndustries) {
        boolean found = false;
        for (integer i = 0; i < lstValidIndustries.size(); i++){
            if (Industry == lstValidIndustries[i]) {
                found = true;
                break;
            }
        }
        return found;
    }
    private List<String> getValidIndutries() {
        List<String> lstValidIndustries = new List<String>();
        List<Account_Industry__mdt> lstAccountIndustries = AccountUtils.getIndustries();
        for(Account_Industry__mdt ai : lstAccountIndustries){
            lstValidIndustries.add(ai.Label);
        }
        return lstValidIndustries;
    }    

    public void updateNameRating(List<Account> accounts, Map<Id, Account> oldAccountsById){
        for ( Account acc : accounts ) { 
            if (acc.Name != oldAccountsById.get( acc.Id ).Name){
                acc.Name = acc.Name + ' - Updated';
            }
            if (acc.AnnualRevenue > AccountUtils.getHotAnnualRevenue()) {
                acc.Rating = 'Hot';
            }
        }
    }    
}