@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer with Travels'

define view entity Z39_CustomerWithTravels
  as select from Z39_Customer

  association [0..*] to Z39_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
  key CustomerId,

      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,

      /* Associations */
      _Travels
}

where CountryCode = 'DE'
