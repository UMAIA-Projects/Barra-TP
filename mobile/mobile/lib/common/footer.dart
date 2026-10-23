import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 64), //64
          Container(
            width: double.infinity,
            //constraints: const BoxConstraints(maxWidth: 359),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF0891B2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Language',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 28,
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Color(0xFF0891B2),
                      ),
                      /*
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/b79d8af714094cf39045fc0140cd75fc/901c0c241f10bc315094397098d09edd69f51bb2?placeholderIfAbsent=true',
                        width: 28,
                        height: 28,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.arrow_drop_down,
                            size: 28,
                            color: Color(0xFF0891B2),
                          );
                        },
                      ),
                      */
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      //backgroundColor: const Color(0xFF475569),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Termos e Condições',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
