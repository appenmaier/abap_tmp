@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_39_TravelTP
  provider contract transactional_query
  as projection on ZR_39_TravelTP

{
  key TravelId,

      AgencyId,

      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,

      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,

      Status,

      /* Transient Data */
      StatusCriticality,
      _CustomerIdText.CustomerName,

      /* Administrative Data */
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,

      /* Associations */
      _Bookings: redirected to composition child ZC_39_BookingTP
}
