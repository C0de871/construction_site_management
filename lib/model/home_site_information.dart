import 'package:construction_site_management/core/config/constants/api_keys.dart';

class HomeSiteInformation {
  String name, imageUrl, financialStatus, siteDeliveryStatus;
  double capital, salePrice, profitOrLoseRatio;
  HomeSiteInformation({
    required this.name,
    required this.imageUrl,
    required this.capital,
    required this.financialStatus,
    required this.siteDeliveryStatus,
    required this.salePrice,
    required this.profitOrLoseRatio,
  });
  factory HomeSiteInformation.fromJson(Map<String, dynamic> json) {
    return HomeSiteInformation(
      name: json[ApiKeys.siteName],
      imageUrl: json[ApiKeys.siteImageUrl],
      capital: json[ApiKeys.siteCapital],
      financialStatus: json[ApiKeys.siteFinancialClosureStatus],
      siteDeliveryStatus: json[ApiKeys.siteDeliveryStatus],
      salePrice: json[ApiKeys.siteSalePrice],
      profitOrLoseRatio: json[ApiKeys.siteProfitOrLoseRatio],
    );
  }
}
