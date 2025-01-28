import 'package:flutter/material.dart';

class CasCard extends StatelessWidget {
  final bool isActive;
  final String cardName;

  const CasCard({Key? key, required this.isActive, required this.cardName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Card(
        color: isActive ? const Color(0xff626abb) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: isActive ? Colors.white : const Color(0xff564d9c),
              ),
              const SizedBox(width: 2),
              Text(
                cardName,
                style: TextStyle(color: isActive ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
