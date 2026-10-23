import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import '../theme/app_theme.dart';

class LocationSelector extends StatefulWidget {
  LocationSelector({Key? key}) : super(key: key);

  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  late TextEditingController _originController;
  late TextEditingController _destinationController;

  @override
  void initState() {
    super.initState();
    final routeProvider = context.read<RouteProvider>();
    _originController = TextEditingController(text: routeProvider.origin);
    _destinationController = TextEditingController(text: routeProvider.destination);
  }

  @override
  void dispose() {
    _originController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteProvider>(
      builder: (context, routeProvider, _) {
        return Stack(
          children: [
            Column(
              children: [
                // Origin
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 5),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blue, width: 2),
                          color: AppColors.white,
                        ),
                        child: Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _originController,
                        onChanged: (value) {
                          routeProvider.setOrigin(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Origin',
                          filled: true,
                          fillColor: AppColors.gray,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        style: GoogleFonts.nunitoSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Destination
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12, top: 8),
                      child: Icon(
                        Icons.location_on,
                        color: AppColors.red,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _destinationController,
                        onChanged: (value) {
                          routeProvider.setDestination(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Destination',
                          filled: true,
                          fillColor: AppColors.gray,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        style: GoogleFonts.nunitoSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: -28,
              top: 16,
              child: IconButton(
                icon: const Icon(Icons.swap_vert),
                color: AppColors.primary,
                onPressed: () {
                  routeProvider.swapLocations();
                  _originController.text = routeProvider.origin;
                  _destinationController.text = routeProvider.destination;
                },
                tooltip: 'Swap locations',
              ),
            ),
          ],
        );
      },
    );
  }
}
