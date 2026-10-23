import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearchChanged;

  const SearchBar({
    Key? key,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          onChanged: widget.onSearchChanged,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.darkGray,
          ),
          decoration: InputDecoration(
            hintText: 'Pesquisar linha...',
            hintStyle: const TextStyle(
              fontSize: 13,
              color: AppColors.placeholderGray,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.search,
                color: AppColors.darkGray,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
