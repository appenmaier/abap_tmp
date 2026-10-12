@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel with Customer'

define view entity Z39_TravelWithCustomer
  as select from Z39_Travel   as Travel

    inner join   Z39_Customer as Customer on Travel.CustomerId = Customer.CustomerId

{
  key Travel.TravelId,

      Travel.AgencyId,
      Travel.BeginDate,
      Travel.EndDate,
      Travel.BookingFee,
      Travel.TotalPrice,
      Travel.CurrencyCode,
      Travel.Description,
      Travel.Status,
      Customer.CustomerId,
      Customer.FirstName,
      Customer.LastName,
      Customer.Title,
      Customer.Street,
      Customer.PostalCode,
      Customer.City
}

where Customer.CountryCode = 'DE'
