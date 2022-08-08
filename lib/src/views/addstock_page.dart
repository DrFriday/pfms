import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/stock_model.dart';
import '../services/stock_service.dart';
import 'home_page.dart';

class AddStockPage extends StatefulWidget {
  const AddStockPage({Key? key}) : super(key: key);

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  late final TextEditingController _quantity = TextEditingController();
  late final TextEditingController _amount = TextEditingController();
  late final TextEditingController _date = TextEditingController();

  String stockName = 'Stock Name';
  String transactionType = 'Transaction Type';

  var stocks = [
    'Stock Name',
    'HDL',
    'SLI',
    'NABIL',
    'CBBL',
    'NBL',
  ];

  var transaction = [
    'Transaction Type',
    'Buy',
    'Sell',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Modify Portfolio'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.wallet_giftcard,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                      value: stockName,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: stocks.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          stockName = newValue!;
                        });
                      },
                    ),
                  ),
                  DropdownButton(
                    value: transactionType,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: transaction.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        transactionType = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _quantity,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantity',
                    icon: Icon(Icons.production_quantity_limits),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _amount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    icon: Icon(Icons.attach_money_rounded),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _date,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);

                      setState(() {
                        _date.text = formattedDate;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      submitAddStock();
                    },
                    child: const Text('Add Stock'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitAddStock() async {
    final stock = Stock(
      name: stockName,
      transactionType: transactionType,
      quantity: int.parse(_quantity.text),
      amount: double.parse(_amount.text),
      date: DateTime.parse(_date.text),
    );

    await StockService.addStock(stock);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
