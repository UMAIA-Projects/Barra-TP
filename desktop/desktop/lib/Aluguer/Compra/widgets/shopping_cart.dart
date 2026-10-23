import 'package:flutter/material.dart';
import 'package:desktop/Aluguer/Compra/models/cart_item.dart';
import 'package:desktop/constants/colors.dart';

class ShoppingCart extends StatefulWidget {
  final List<CartItem> items;
  final Function(int) onRemoveItem;
  final double additionalFees;
  final double total;

  const ShoppingCart({
    Key? key,
    required this.items,
    required this.onRemoveItem,
    required this.additionalFees,
    required this.total,
  }) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Carrinho',
            style: TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: AppColors.barraTeal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            height: 4,
            color: AppColors.barraTeal,
          ),
          const SizedBox(height: 24),
          if (widget.items.isEmpty)
            const Text(
              'Seu carrinho está vazio',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                color: AppColors.barraTeal,
              ),
            )
          else
            Column(
              children: [
                ...widget.items.map((item) => _buildCartItem(item)),
                const SizedBox(height: 16),
                _buildDivider(),
                const SizedBox(height: 16),
                _buildPriceLine(
                  'Taxas adicionais:',
                  '${widget.additionalFees.toStringAsFixed(2)}€',
                ),
                const SizedBox(height: 8),
                _buildDivider(),
                const SizedBox(height: 8),
                _buildPriceLine(
                  'Total:',
                  '${widget.total.toStringAsFixed(2)}€',
                  isBold: true,
                  fontSize: 20,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.barraTeal, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.barraTeal,
                      ),
                    ),
                    Text(
                      item.description,
                      style: const TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.barraTeal,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.redAlert),
                onPressed: () => widget.onRemoveItem(item.id),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(
            color: AppColors.barraTeal,
            thickness: 2,
            height: 16,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Número de dias: ${item.days}',
                  style: const TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.barraGray,
                  ),
                ),
              ),
              Text(
                item.date,
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barraTeal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Preço',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barraTeal,
                ),
              ),
              Text(
                '${item.price.toStringAsFixed(0)}€',
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barraTeal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.barraTeal,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 2,
      color: AppColors.barraTeal,
    );
  }

  Widget _buildPriceLine(
    String label,
    String price, {
    bool isBold = false,
    double fontSize = 18,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
            color: AppColors.barraTeal,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
            color: AppColors.barraTeal,
          ),
        ),
      ],
    );
  }
}
