import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/responsive_utils.dart';

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
    final responsive = context.responsive;
    
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: responsive.scaleWidth(24),
            right: responsive.scaleWidth(16),
          ),
          child: Icon(
            Icons.search,
            color: BarraColors.teal,
            size: responsive.iconSize(40),
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors.transparent,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar localização',
                hintStyle: GoogleFonts.nunitoSans(
                  color: BarraColors.teal.withOpacity(0.7),
                  fontSize: responsive.scaleFontSize(30),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                filled: false,
                fillColor: AppColors.transparent,
                contentPadding: EdgeInsets.zero,
              ),
              style: GoogleFonts.nunitoSans(
                color: BarraColors.teal,
                fontSize: responsive.scaleFontSize(30),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: responsive.scaleWidth(16),
            right: responsive.scaleWidth(24),
          ),
          child: Icon(
            Icons.mic,
            color: BarraColors.teal,
            size: responsive.iconSize(40),
          ),
        ),
      ],
    );
  }
}
