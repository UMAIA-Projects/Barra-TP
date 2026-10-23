import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: const BoxConstraints(minHeight: 151),
      /*
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      */
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/search_back.png',
              //width: 48,
              fit: BoxFit.contain,
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 56),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F5),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xFF475569),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                left: 12,
                right: 6,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Para onde ir...?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA3A3A3),
                    ),
                  ),
                  Container(
                    /*
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    */
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
