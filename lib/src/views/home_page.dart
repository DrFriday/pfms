import 'package:flutter/material.dart';
import 'package:pms/src/widgets/search_widget.dart';

import 'addstock_page.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/stocks_widget.dart';
import '../services/stock_service.dart';
import '../models/stock_data_model.dart';
import '../widgets/dashboard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List stocks = [];
  StockData stockData = StockData();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    StockService.getStocks().then((value) {
      setState(() {
        stocks = StockService.viewModelConverter(value);
        stockData = StockService.totalDashboardEvaluation(stocks);
        // print(stockData.toMap());
        // print(stocks.map((e) => e.toMap()).toList());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const DrawerWidget(),
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          title: const Text('Portfolio Management System'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _key.currentState!.openDrawer(),
          ),
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DashboardWidget(stockData: stockData),
                  StocksWidget(stocks: stocks),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddStockPage()),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
