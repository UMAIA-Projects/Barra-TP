import 'package:flutter/material.dart';
import 'package:desktop/constants/sidebar_navigation.dart';
import 'package:desktop/constants/action_button.dart';
import 'package:desktop/constants/footer.dart';
import 'package:desktop/constants/user_info_card.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/Aluguer/Compra/models/cart_item.dart';
import 'package:desktop/Aluguer/Compra/widgets/rental_form.dart';
import 'package:desktop/Aluguer/Compra/widgets/shopping_cart.dart';

class AluguerCompraScreen extends StatefulWidget {
  const AluguerCompraScreen({Key? key}) : super(key: key);

  @override
  State<AluguerCompraScreen> createState() => _AluguerCompraScreenState();
}

class _AluguerCompraScreenState extends State<AluguerCompraScreen> {
  late List<CartItem> cartItems;
  final double additionalFees = 10.5;

  @override
  void initState() {
    super.initState();
    cartItems = [
      CartItem(
        id: 1,
        name: 'Carro Médio',
        description: 'Fiat Panda',
        days: 3,
        date: '08-12-2025',
        price: 80,
      ),
    ];
  }

  void removeFromCart(int id) {
    setState(() {
      cartItems.removeWhere((item) => item.id == id);
    });
  }

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.price);
  double get total => subtotal + additionalFees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 320,
                      color: AppColors.transparent,
                      child: const SizedBox.expand(
                        child: SidebarNavigation(activePage: 'Aluguer'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 201), // Abaixo dos botões + 5 pixels (196 + 5)
                        child: SingleChildScrollView(
                          child: MainContent(
                            cartItems: cartItems,
                            onRemoveItem: removeFromCart,
                            additionalFees: additionalFees,
                            total: total,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Footer fixo na parte inferior (estende por toda a largura, incluindo sidebar)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: const Footer(),
                ),
                // User Info Card fixo no canto superior direito (encostado à direita)
                Positioned(
                  top: 0,
                  right: 0,
                  child: const UserInfoCard(),
                ),
                // Botões de notificações e definições fixos
                Positioned(
                    top: 148, // Abaixo do retângulo do utilizador
                    right: 16, // Espaçamento da direita
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ActionButtonWidget()
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}

class MainContent extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(int) onRemoveItem;
  final double additionalFees;
  final double total;

  const MainContent({
    super.key,
    required this.cartItems,
    required this.onRemoveItem,
    required this.additionalFees,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 0,
        bottom: 40,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RentalForm(total: total),
          ),
          const SizedBox(width: 24),
          SizedBox(
            width: 340,
            child: ShoppingCart(
              items: cartItems,
              onRemoveItem: onRemoveItem,
              additionalFees: additionalFees,
              total: total,
            ),
          ),
        ],
      ),
    );
  }
}