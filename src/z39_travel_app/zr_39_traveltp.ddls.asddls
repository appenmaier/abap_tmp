@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define root view entity ZR_39_TravelTP
  as select from ZI_39_Travel

  association [1..1] to ZI_39_CustomerIdText as _CustomerIdText on $projection.CustomerId = _CustomerIdText.CustomerId

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

      /* Transient Data */
      case Status when 'X' then 1
                  when 'P' then 2
                  when 'B' then 3
                  else 0
      end as StatusCriticality,

      /* Administrative Data */
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,

      /* Associations */
      _CustomerIdText

      //  _association_name // Make association public
}
