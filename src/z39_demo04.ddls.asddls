@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 4: Built-In Functions'

define view entity Z39_Demo04
  as select from /dmo/flight

{
  key carrier_id                                                      as CarrierId,
  key connection_id                                                   as ConnectionId,
  key flight_date                                                     as FlightDate,

      /* Numeric Functions */
      5 / 3                                                           as FloatingPointNumber1,
      division(5, 3, 4)                                               as FixedPointNumber1,

      /* String Functions */
      concat_with_space(carrier_id, connection_id, 1)                 as FlightConnection,
      length('1  ')                                                   as Length1SS,
      length('  3')                                                   as LengthSS3,
      length(' ')                                                     as LengthS,

      /* Date and Time Functions */
      dats_add_days(flight_date, 14, 'FAIL')                          as DatsAddDays1,

      /* Currency and Unit Conversions */
      price                                                           as OldPrice,
      currency_code                                                   as OldCurrencyCode,

      @Semantics.amount.currencyCode: 'NewCurrencyCode'
      @EndUserText.label: 'Flight Price'
      @EndUserText.quickInfo: 'Flight Price'
      currency_conversion(amount             => price,
                          source_currency    => currency_code,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date) as NewPrice,

      cast('EUR' as abap.cuky)                                        as NewCurrencyCode
}
