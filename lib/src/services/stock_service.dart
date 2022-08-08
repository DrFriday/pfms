import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:pms/src/models/stock_data_model.dart';

import '../models/stock_model.dart';

class StockService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _stockRef =
      _firestore.collection('stocks').withConverter<Stock>(
            fromFirestore: (snapshot, _) =>
                Stock.fromMap(snapshot.data() as Map<String, dynamic>),
            toFirestore: (stock, _) => stock.toMap(),
          );

  static Future<List<Stock>> getStocks() async {
    final stocks = await _stockRef.get();
    return stocks.docs.map((doc) => doc.data() as Stock).toList();
  }

  static Future<Stock> getStock(String name) async {
    final QuerySnapshot snapshot =
        await _stockRef.where('name', isEqualTo: name).get();
    return snapshot.docs
        .map((doc) => Stock.fromMap(doc.data() as Map<String, dynamic>))
        .first;
  }

  static Future<void> addStock(Stock stock) async {
    await _stockRef.add(stock);
  }

  static Future<void> updateStock(Stock stock) async {
    await _stockRef.doc(stock.name).update(stock.toMap());
  }

  static Future<void> deleteStock(Stock stock) async {
    await _stockRef.doc(stock.name).delete();
  }

  static List viewModelConverter(List<Stock> stocks) {
    var groupedList = groupBy(stocks, (Stock obj) => obj.name);
    var newList = [];
    groupedList.forEach((key, value) {
      int qty = 0;
      double totalInvestment = 0.0;
      double totalSellMoney = 0.0;
      double sellAmount = 500.0; // default is used here
      double currentAmount = 0.0;
      double overallProfit = 0.0;

      for (var item in value) {
        if (item.transactionType == 'Sell') {
          qty = qty - item.quantity!;
          sellAmount = sellAmount + item.amount!;
          totalSellMoney = totalSellMoney + item.amount! * item.quantity!;
        } else {
          qty = qty + item.quantity!;
          totalInvestment = totalInvestment + item.amount! * item.quantity!;
        }
      }
      currentAmount = qty * sellAmount;
      overallProfit = currentAmount - totalInvestment + totalSellMoney;
      newList.add(StockData(
          name: key,
          units: qty,
          investment: totalInvestment,
          sold: totalSellMoney,
          current: currentAmount,
          profit: overallProfit));
    });
    return newList;
  }

  static totalDashboardEvaluation(List stockData) {
    var dashboard = StockData(
        name: 'Dashboard',
        units: 0,
        investment: 0.0,
        sold: 0.0,
        current: 0.0,
        profit: 0.0);
    for (var item in stockData) {
      dashboard.current = dashboard.current! + item.current!;
      dashboard.investment = dashboard.investment! + item.investment!;
      dashboard.profit = dashboard.profit! + item.profit!;
      dashboard.sold = dashboard.sold! + item.sold!;
      dashboard.units = (dashboard.units! + item.units!) as int?;
    }
    return dashboard;
  }
}
