@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define view entity ZI_39_Travel
  as select from /dmo/travel

{
  key travel_id     as TravelId,

      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,

      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,

      /* Administrative Data */
      @Semantics.user.createdBy: true
      createdby     as Createdby,

      @Semantics.systemDateTime.createdAt: true
      createdat     as Createdat,

      @Semantics.user.lastChangedBy: true
      lastchangedby as Lastchangedby,

      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat as Lastchangedat
}
