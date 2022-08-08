import 'dart:convert';

List<Stock> stockFromMap(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromMap(x)));

String stockToMap(List<Stock> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Stock {
  String? name;
  String? transactionType;
  int? quantity;
  double? amount;
  DateTime? date;

  Stock({
    this.name,
    this.transactionType,
    this.quantity,
    this.amount,
    this.date,
  });

  Stock copyWith({
    String? name,
    String? transactionType,
    int? quantity,
    double? amount,
    DateTime? date,
  }) =>
      Stock(
        name: name ?? this.name,
        transactionType: transactionType ?? this.transactionType,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
        date: date ?? this.date,
      );

  factory Stock.fromMap(Map<String, dynamic> json) => Stock(
        name: json["name"],
        transactionType: json["transactionType"],
        quantity: json["quantity"],
        amount: double.parse(json["amount"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "transactionType": transactionType,
        "quantity": quantity!,
        "amount": amount!.toString(),
        "date": date!.toIso8601String(),
      };
}
