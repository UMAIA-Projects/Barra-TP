import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planning_model.dart';
import '../theme/app_theme.dart';
import '../widgets/filter_screen.dart';
import '../widgets/location_input.dart';
import '../widgets/custom_header.dart';
import '../../planeamento_2/screens/home_screen.dart' as planeamento2;
import '../../planeamento_2/app/providers/app_provider.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({Key? key}) : super(key: key);

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  late TextEditingController departureController;
  late TextEditingController destinationController;
  late TextEditingController departureTimeController;
  late TextEditingController arrivalTimeController;

  @override
  void initState() {
    super.initState();
    departureController = TextEditingController();
    destinationController = TextEditingController();
    departureTimeController = TextEditingController();
    arrivalTimeController = TextEditingController();
  }

  @override
  void dispose() {
    departureController.dispose();
    destinationController.dispose();
    departureTimeController.dispose();
    arrivalTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanningState>(
      builder: (context, planningState, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(111),
            child: CustomHeader(
              onMenuTap: () {},
              onLocationTap: () {},
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Search Bar
                Container(
                  color: AppTheme.secondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 16,
                      ),
                      const Icon(Icons.search, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        'Pesquisa',
                        style: AppTheme.textStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                    ],
                  ),
                ),

                // Tabs
                Container(
                  color: AppTheme.secondaryColor,
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Row(
                    children: [
                      _buildTab(
                        label: 'Planeamento',
                        isActive: planningState.activeTab == 'planeamento',
                        onTap: () =>
                            planningState.setActiveTab('planeamento'),
                      ),
                      const Spacer(),
                      _buildTab(
                        label: 'Planeamentos Guardados',
                        isActive: planningState.activeTab == 'guardados',
                        onTap: () =>
                            planningState.setActiveTab('guardados'),
                      ),
                    ],
                  ),
                ),

                // Main Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Location Fields
                      Row(
                        children: [
                          Expanded(
                            child: LocationInput(
                              label: 'Local de Partida',
                              controller: departureController,
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppTheme.textColor,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: LocationInput(
                              label: 'Local de Destino',
                              controller: destinationController,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Time Fields
                      Row(
                        children: [
                          Expanded(
                            child: TimeInput(
                              label: 'Hora de Partida',
                              controller: departureTimeController,
                              onShowTime: (context) =>
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TimeInput(
                              label: 'Hora de Chegada',
                              controller: arrivalTimeController,
                              onShowTime: (context) =>
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Add Stops Button
                      LocationInput(
                        label: 'Adicionar Paragens',
                        controller: TextEditingController(),
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),

                      // Search Button and Filter Button
                      Row(
                        children: [
                          _buildSearchButton(planningState),
                          const SizedBox(width: 12),
                          _buildFilterButton(context),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Divider
                      Divider(
                        color: AppTheme.borderColor,
                        thickness: 3.5,
                      ),
                      const SizedBox(height: 16),

                      // Map
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: Image.network(
                          'https://api.builder.io/api/v1/image/assets/TEMP/fe48d6fc64627a8650824cff59e8a28fd08e69eb?width=880',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Divider
                      Divider(
                        color: AppTheme.borderColor,
                        thickness: 3.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTab({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryColor : AppTheme.primaryColor.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          label,
          style: AppTheme.textStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'DaysOne',
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton(PlanningState planningState) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => AppProvider(),
              child: const planeamento2.HomeScreen(),
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        elevation: 2.5,
        shadowColor: Colors.black.withValues(alpha: 0.4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pesquisa',
            style: AppTheme.textStyle(
              color: Colors.white,
              fontSize: 9.3,
              fontWeight: FontWeight.w800,
              fontFamily: 'NunitoSans',
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.search, color: Colors.white, size: 15),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return GestureDetector(
      onTap: () => FilterScreen.show(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(7.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 2.76,
            ),
          ],
        ),
        child: Text(
          'Filtro',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 9.3,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ).copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
