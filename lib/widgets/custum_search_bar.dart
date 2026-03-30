import 'package:flutter/material.dart';

class CustumSearchBar extends StatelessWidget {
  const CustumSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SearchBar(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        hintText: "Search Your Products",
        elevation: WidgetStatePropertyAll(2.2),
        leading: Icon(Icons.search),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
      ),
    );
  }
}
