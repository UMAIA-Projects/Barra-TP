import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/Mapa_Offiline/widgets/satellite_controls.dart';

class MapaOffline_Satelite_Screen extends StatefulWidget {
  const MapaOffline_Satelite_Screen({super.key});

  @override
  State<MapaOffline_Satelite_Screen> createState() => _MapaOffline_Satelite_ScreenState();
}

class _MapaOffline_Satelite_ScreenState extends State<MapaOffline_Satelite_Screen> {
  bool satelliteExpanded = true;
  bool isSatelliteView = true;

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    final satelliteImageUrl = 'https://api.builder.io/api/v1/image/assets/TEMP/aadc7cf08ec234f64c7602036b427ed4e2f49474?width=3456';
    final normalImageUrl = 'https://api.builder.io/api/v1/image/assets/TEMP/45a638374d6638a86dd929d91b8cf20741813c24?width=3602';

    return BaseScreen(
      activePage: 'Mapa Offline',
      showSearchBar: false,
      disableScroll: true,
      backgroundImage: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              isSatelliteView ? satelliteImageUrl : normalImageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                  bottom: responsive.footerHeight + responsive.scaleHeight(20),
                  right: responsive.scaleWidth(20),
                  child: SatelliteControls(
                    expanded: satelliteExpanded,
                    isSatelliteView: isSatelliteView,
                    onToggle: () {
                      setState(
                        () => satelliteExpanded = !satelliteExpanded,
                      );
                    },
                    onViewToggle: () {
                      setState(
                        () => isSatelliteView = !isSatelliteView,
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
