@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating'

define view entity ZR_39_RatingTP
  as select from ZI_39_Rating

  association to parent ZR_39_MovieTP as _Movie on $projection.MovieUuid = _Movie.MovieUuid

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie
}
