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

      @EndUserText.label: 'Duration'
      @EndUserText.quickInfo: 'Duration'
      dats_days_between(Travel.BeginDate, Travel.EndDate) + 1         as Duration,

      @EndUserText.label: 'Booking Fee'
      @EndUserText.quickInfo: 'Booking Fee'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => Travel.BookingFee,
                          source_currency    => Travel.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date) as BookingFee,

      @EndUserText.label: 'Total Price'
      @EndUserText.quickInfo: 'Total Price'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => Travel.TotalPrice,
                          source_currency    => Travel.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date) as TotalPrice,

      cast('EUR' as abap.cuky)                                        as CurrencyCode,

      Travel.Description,
      Travel.Status,
      Customer.CustomerId,

      case when Customer.Title is initial then concat_with_space(Customer.FirstName, Customer.LastName, 1)
           else concat_with_space(Customer.Title, concat_with_space(Customer.FirstName, Customer.LastName, 1), 1)
      end                                                             as CustomerName,

      Customer.Street,
      Customer.PostalCode,
      Customer.City
}

where Customer.CountryCode = 'DE'
