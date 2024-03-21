public with sharing class AccountController{


    @AuraEnabled(cacheable=true)
    public static List<Account> getAccList(){
        return [select Id,Name from Account order by CreatedDate desc limit 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccList(String keyword){
        try {
            String key = '%'+keyword+'%';
            return [SELECT Id,Name,Phone FROM Account WHERE Name LIKE:key ORDER BY CreatedDate desc LIMIT 10];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount(){
        return [SELECT Id, Name, Phone FROM ACCOUNT ORDER BY CreatedDate desc Limit 1];
    }
    
}