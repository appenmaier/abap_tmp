@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_39_MovieTP
  provider contract transactional_query
  as projection on ZR_39_MovieTP

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      @ObjectModel.text.element: [ 'GenreText' ]
      Genre,

      PublishingYear,
      RuntimeInMin,
      ImageUrl,

      /* Transient Data */
      _AverageRating.AverageRating,
      _AverageRating.AverageRatingCriticality,
      _GenreText.GenreText,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Associations */
      _Ratings : redirected to composition child ZC_39_RatingTP
}
