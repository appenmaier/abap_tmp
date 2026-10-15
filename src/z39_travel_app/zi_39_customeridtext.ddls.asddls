@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Textelement for CustomerId'

define view entity ZI_39_CustomerIdText
  as select from /dmo/customer

{
  key customer_id                                 as CustomerId,

      @EndUserText.label: 'Customer Name'
      @EndUserText.quickInfo: 'Customer Name'
      concat_with_space(first_name, last_name, 1) as CustomerName
}
