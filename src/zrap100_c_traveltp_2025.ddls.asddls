@Metadata.allowExtensions: true
@EndUserText.label: 'Travel'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
define root view entity ZRAP100_C_TRAVELTP_2025
  provider contract transactional_query
  as projection on ZRAP100_R_TRAVELTP_2025
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key TravelId,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' }, useForValidation: true }]
      AgencyId,
      _Agency.Name              as AgencyName,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  }, useForValidation: true }]
      CustomerId,
      _Customer.FirstName       as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity:{ name:'I_Currency', element: 'Currency' }, useForValidation: true }]
      @Semantics.currencyCode: true
      CurrencyCode,
      Description,
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,
      Attachment,
      MimeType,
      FileName,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt

}
