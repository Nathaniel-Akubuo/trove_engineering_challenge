class PortfolioModel {
  String? symbol;
  String? name;
  double? totalQuantity;
  double? equityValue;
  double? pricePerShare;
  String? image;

  PortfolioModel({
    this.symbol,
    this.name,
    this.totalQuantity,
    this.equityValue,
    this.pricePerShare,
    this.image,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
        symbol: json['symbol'],
        name: json['name'],
        totalQuantity: json['totalQuantity'],
        equityValue: json['equityValue'],
        pricePerShare: json['pricePerShare'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'totalQuantity': totalQuantity,
        'equityValue': equityValue,
        'pricePerShare': pricePerShare,
      };
}
