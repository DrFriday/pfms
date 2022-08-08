import 'dart:convert';

List<StockData> stockDataFromMap(String str) =>
    List<StockData>.from(json.decode(str).map((x) => StockData.fromMap(x)));

String stockDataToMap(List<StockData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class StockData {
  String? name;
  int? units;
  double? investment;
  double? sold;
  double? current;
  double? profit;

  StockData({
    this.name,
    this.units,
    this.investment,
    this.sold,
    this.current,
    this.profit,
  });

  StockData copyWith({
    String? name,
    int? units,
    double? investment,
    double? sold,
    double? current,
    double? profit,
  }) =>
      StockData(
        name: name ?? this.name,
        units: units ?? units,
        investment: investment ?? investment,
        sold: sold ?? sold,
        current: current ?? current,
        profit: profit ?? profit,
      );

  factory StockData.fromMap(Map<String, dynamic> json) => StockData(
        name: json["name"],
        units: json["units"],
        investment: json["investment"],
        sold: json["sold"],
        current: double.parse(json["current"]),
        profit: double.parse(json["profit"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "units": units,
        "investment": investment,
        "sold": sold,
        "current": current!.toDouble(),
        "profit": profit!.toDouble(),
      };
}
