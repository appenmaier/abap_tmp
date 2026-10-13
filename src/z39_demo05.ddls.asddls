@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 5: Domain Fix Values'

define view entity Z39_Demo05
  as select from /dmo/supplement                               as Supplement

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/SUPPLEMENT_CATEGORY') as CategoryText
      on  Supplement.supplement_category = CategoryText.value_low
      and CategoryText.language          = $session.system_language

{
  key Supplement.supplement_id       as SupplementId,

      Supplement.supplement_category as SupplementCategory,
      CategoryText.text              as SupplementCategoryText,
      Supplement.price               as Price,
      Supplement.currency_code       as CurrencyCode
}
