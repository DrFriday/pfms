import 'package:flutter/material.dart';
import 'package:pms/src/models/stock_data_model.dart';

import 'card_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({Key? key, required this.stockData}) : super(key: key);
  final StockData stockData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          title: Text(
            "Dashboard",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1.1,
            ),
          ),
        ),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          children: [
            CardWidget(
              title: 'Total Units:',
              subtitle: stockData.units.toString(),
            ),
            CardWidget(
              title: 'Total Investment:',
              subtitle: stockData.investment.toString(),
            ),
            CardWidget(
              title: 'Sold Amount:',
              subtitle: stockData.sold.toString(),
            ),
            CardWidget(
              title: 'Current Amount:',
              subtitle: stockData.current.toString(),
            ),
            CardWidget(
              title: 'Overall Profit:',
              subtitle: stockData.profit.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
