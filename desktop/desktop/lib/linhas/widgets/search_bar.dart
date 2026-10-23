import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => SearchBarWidgetState();
}

class SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 12),
            child: Icon(
              Icons.search,
              color: AppColors.barraTeal,
              size: 28,
            ),
          ),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar localização',
                hintStyle: GoogleFonts.nunitoSans(
                  color: AppColors.barraTeal.withValues(alpha: 0.7),
                  fontSize: 20,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: false,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
              style: GoogleFonts.nunitoSans(
                color: AppColors.barraTeal,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 16),
            child: Icon(
              Icons.mic,
              color: AppColors.barraTeal,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}