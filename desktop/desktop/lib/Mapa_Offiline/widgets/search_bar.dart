import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/dimensions.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.searchBarWidth,
      height: AppDimensions.searchBarHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        boxShadow: AppShadows.dropShadow,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Icon(
              Icons.search,
              color: AppColors.barraTeal,
              size: AppDimensions.largeIconSize,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar localização',
                hintStyle: TextStyle(
                  color: AppColors.barraTeal.withValues(alpha: 0.8),
                  fontSize: AppDimensions.searchFontSize,
                  fontFamily: 'NunitoSans',
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.barraTeal,
                fontSize: 30,
                fontFamily: 'NunitoSans',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Icon(
              Icons.mic,
              color: AppColors.barraTeal,
              size: AppDimensions.largeIconSize,
            ),
          ),
        ],
      ),
    );
  }
}
