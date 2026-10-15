@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

@Metadata.allowExtensions: true

define view entity ZC_39_BookingTP
  as projection on ZR_39_BookingTP

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,

      /* Associations */
      _Travels : redirected to parent ZC_39_TravelTP
}
