@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define root view entity ZR_39_TravelTP
  as select from ZI_39_Travel

//composition of target_data_source_name as _association_name
{
  key TravelId,

      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,

      /* Administrative Data */
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat
//  _association_name // Make association public
}
