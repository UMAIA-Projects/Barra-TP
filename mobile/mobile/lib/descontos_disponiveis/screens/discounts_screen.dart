import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../models/discount.dart';
import '../widgets/discount_button.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';

class DiscountsScreen extends StatefulWidget {
  const DiscountsScreen({Key? key}) : super(key: key);

  @override
  State<DiscountsScreen> createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  int _selectedNavIndex = 1;
  late List<Discount> discounts;

  @override
  void initState() {
    super.initState();
    _initializeDiscounts();
  }

  void _initializeDiscounts() {
    discounts = [
      Discount(id: 1, title: AppStrings.discountsList[0]),
      Discount(id: 2, title: AppStrings.discountsList[1]),
      Discount(id: 3, title: AppStrings.discountsList[2]),
      Discount(id: 4, title: AppStrings.discountsList[3]),
      Discount(id: 5, title: AppStrings.discountsList[4], isSmall: true),
      Discount(id: 6, title: AppStrings.discountsList[5], isSmall: true),
    ];
  }

  void _onDiscountTapped(int id) {
    // Placeholder for discount action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Desconto #$id selecionado'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _onAddPromoCode() {
    // Placeholder for promo code action
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.adicionarCodigoPromocional),
        content: const TextField(
          decoration: InputDecoration(hintText: 'Digite o código'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Código adicionado')),
              );
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Common Header
          const HeaderApp(),

          // Breadcrumb
          _buildBreadcrumb(),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Tab Header
                  _buildTabHeader(),

                  // Content Area
                  _buildContentArea(),
                ],
              ),
            ),
          ),

          // Bottom Navigation
          CustomBottomBar(
            currentIndex: _selectedNavIndex,
            onTabSelectedOverride: (index) {
              setState(() => _selectedNavIndex = index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.brandTeal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            color: AppColors.white,
            iconSize: 32,
            onPressed: () {},
          ),
          const Text(
            AppStrings.appTitle,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              shadows: [
                Shadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(64, 0, 0, 0),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.location_on),
            color: AppColors.white,
            iconSize: 42,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Container(
      color: AppColors.brandTealLight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.chevron_left, color: AppColors.white),
          const SizedBox(width: 8),
          const Text(
            AppStrings.descontos,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabHeader() {
    return Container(
      color: AppColors.brandTealLight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.brandTeal,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withValues(alpha: 0.25),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: const Text(
              AppStrings.descontosDisponiveis,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _onAddPromoCode,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brandTeal,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              shadowColor: Colors.black.withValues(alpha: 0.25),
              elevation: 4,
            ),
            child: const Text(
              AppStrings.adicionarCodigoPromocional,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.descontosDisponiveis,
            style: TextStyle(
              color: AppColors.brandTeal,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              shadows: [
                Shadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(64, 0, 0, 0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 13),
          Container(
            constraints: const BoxConstraints(minHeight: 676),
            decoration: BoxDecoration(
              color: AppColors.lightGrayBackground,
              borderRadius: BorderRadius.circular(5),
              border: const Border(
                top: BorderSide(color: AppColors.brandTeal, width: 4),
                bottom: BorderSide(color: AppColors.brandTeal, width: 4),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...discounts.asMap().entries.map(
                    (entry) => DiscountButton(
                      discount: entry.value,
                      animationDelay: entry.key * 50,
                      onPressed: () => _onDiscountTapped(entry.value.id),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          AppStrings.naoTemMaisDescontos,
                          style: const TextStyle(
                            color: AppColors.brandTeal,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppStrings.estejaAtento,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.brandTeal,
                            fontSize: 10.7,
                            fontWeight: FontWeight.normal,
                            height: 1.4,
                          ),
                        ),
                      ],
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
