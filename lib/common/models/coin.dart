class Coin {
  final String? name;
  final String? symbol;
  final String? price;
  final String? marketCap;

  Coin({
    required this.name,
    required this.symbol,
    required this.price,
    required this.marketCap,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      price: json['price'],
      marketCap: json['marketCap'],
    );
  }
}
