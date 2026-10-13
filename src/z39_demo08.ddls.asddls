@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 8: (Left) Outer Joins'

define view entity Z39_Demo08
  as select from    /dmo/connection as Connection

    left outer join /dmo/carrier    as Carrier    on Connection.carrier_id = Carrier.carrier_id

{
  key Connection.carrier_id      as CarrierId,
  key Connection.connection_id   as ConnectionId,

      Carrier.name               as Name,
      Connection.airport_from_id as AirportFromId,
      Connection.airport_to_id   as AirportToId,
      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,
      Connection.distance        as Distance,
      Connection.distance_unit   as DistanceUnit
}
