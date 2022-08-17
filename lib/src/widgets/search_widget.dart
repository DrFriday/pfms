import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool connection = false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // checkConnectivity();
    checkRealTimeConnection();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _streamSubscription.cancel();
    super.dispose();
  }

  void checkRealTimeConnection() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        setState(() {
          connection = true;
        });
      } else {
        setState(() {
          connection = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: !connection ? 15 : 05),
        (connection == true)
            ? const SizedBox()
            : const Text(
                'No internet connection !',
                style: TextStyle(color: Colors.red),
              ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 227, 227, 227),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 88, 86, 86),
                      ),
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 88, 86, 86)),
                      hintText: "Search",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
