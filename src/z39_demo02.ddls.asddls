@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 2: Inner Joins'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z39_Demo02
  as select from /dmo/connection as connection

    inner join   /dmo/carrier    as carrier
      on connection.carrier_id = carrier.carrier_id

    inner join   /dmo/flight     as flight
      on  connection.carrier_id    = carrier.carrier_id
      and connection.connection_id = flight.connection_id

{
  key flight.carrier_id          as CarrierId,
  key flight.connection_id       as ConnectionId,
  key flight.flight_date         as FlightDate,

      carrier.name               as Name,
      connection.airport_from_id as AirportFromId,
      connection.airport_to_id   as AirportToId,
      connection.departure_time  as DepartureTime,
      connection.arrival_time    as ArrivalTime,
      connection.distance        as Distance,
      connection.distance_unit   as DistanceUnit,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight.price               as Price,

      flight.currency_code       as CurrencyCode,
      flight.plane_type_id       as PlaneTypeId,
      flight.seats_max           as SeatsMax,
      flight.seats_occupied      as SeatsOccupied
}
