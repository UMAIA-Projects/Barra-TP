import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFF365F67)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 8, top: 0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Pesquisar...',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFACA9A9),
                  ),
                ),
                style: TextStyle(fontSize: 14, color: Color(0xFF365F67)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: Color(0xFFACA9A9),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}