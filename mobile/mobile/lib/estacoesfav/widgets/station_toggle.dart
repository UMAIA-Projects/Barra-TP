import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../estacoesprox/screens/home_screen.dart' as estacoesprox;
import '../../estacoesprox/providers/navigation_provider.dart';

class StationToggle extends StatefulWidget {
  const StationToggle({super.key});

  @override
  State<StationToggle> createState() => _StationToggleState();
}

class _StationToggleState extends State<StationToggle> {
  bool isNearbySelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
            onTap: () {
              setState(() {
                isNearbySelected = true;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => NavigationProvider(),
                    child: const estacoesprox.HomeScreen(),
                  ),
                ),
              );
            },
              child: Container(
                decoration: BoxDecoration(
                  color: !isNearbySelected ? const Color(0xFF365F67) : const Color(0xFF407079),
                ),
                child: Center(
                  child: Text(
                    'Estações mais próximas',
                    style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isNearbySelected = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: !isNearbySelected ? const Color(0xFF407079) : const Color(0xFF365F67),
                ),
                child: Center(
                  child: Text(
                    'Favoritos',
                    style: GoogleFonts.nunitoSans(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}