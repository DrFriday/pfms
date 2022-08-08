import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
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
                  hintStyle: TextStyle(color: Color.fromARGB(255, 88, 86, 86)),
                  hintText: "Search",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
