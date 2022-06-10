public class AccountTH extends TriggerHandler {

    public List<Account> newAccount;
    public Map<Id, Account> oldAccount;
    public AccountService service;

    public AccountTH () {
        this ( (List<Account>) Trigger.new, (Map<Id, Account>) Trigger.oldMap );
    }

    public AccountTH ( List<Account> newAccount, Map<Id, Account> oldAccount ) {
        this.newAccount = newAccount;
        this.oldAccount = oldAccount;
        this.service = new AccountService();
    }
    
    override
    public void BeforeUpdate() {
        this.service.InitialValidation(newAccount);
        this.service.updateNameRating(newAccount, oldAccount);
    }
}