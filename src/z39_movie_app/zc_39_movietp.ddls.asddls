@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

define root view entity ZC_39_MovieTP
  as projection on ZR_39_MovieTP

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
      LastChangedBy
}
