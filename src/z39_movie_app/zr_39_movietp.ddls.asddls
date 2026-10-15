@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZR_39_MovieTP
  as select from ZI_39_Movie

  composition [0..*] of ZR_39_RatingTP      as _Ratings

  association [0..1] to ZI_39_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  association [0..1] to ZI_39_GenreText     as _GenreText     on $projection.Genre = _GenreText.Genre

{
  key MovieUuid,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Associations */
      _AverageRating,
      _GenreText,
      _Ratings
}
