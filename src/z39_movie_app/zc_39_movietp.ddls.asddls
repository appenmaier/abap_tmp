@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_39_MovieTP
  as projection on ZR_39_MovieTP

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy
}
