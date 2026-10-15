@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

define view entity ZR_39_BookingTP
  as select from ZI_39_Booking

  association to parent ZR_39_TravelTP as _Travels on $projection.TravelId = _Travels.TravelId

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
      _Travels
}
