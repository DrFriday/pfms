import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.height,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: height ?? 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromARGB(255, 243, 239, 239),
            width: 1,
          ),
          color: Colors.green,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                subtitle!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
