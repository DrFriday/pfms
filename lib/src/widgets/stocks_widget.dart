import 'package:flutter/material.dart';

import 'card_widget.dart';

class StocksWidget extends StatelessWidget {
  const StocksWidget({Key? key, required this.stocks}) : super(key: key);
  final List stocks;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          title: Text(
            "Stocks",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stocks.length,
          itemBuilder: (context, index) {
            return stocks.isEmpty
                ? const Center(child: Text('No Stocks'))
                : ExpansionTile(
                    title: Text(stocks[index].name!),
                    children: [
                      GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          // mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        children: [
                          CardWidget(
                            title: 'Total Units:',
                            subtitle: stocks[index].units.toString(),
                            height: 65,
                          ),
                          CardWidget(
                            title: 'Total Investment:',
                            subtitle: stocks[index].investment.toString(),
                            height: 65,
                          ),
                          CardWidget(
                            title: 'Sold Amount:',
                            subtitle: stocks[index].sold.toString(),
                            height: 65,
                          ),
                          CardWidget(
                            title: 'Current Amount:',
                            subtitle: stocks[index].current.toString(),
                            height: 65,
                          ),
                          CardWidget(
                            title: 'Overall Profit:',
                            subtitle: stocks[index].profit.toString(),
                            height: 65,
                          ),
                        ],
                      ),
                    ],
                  );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
