import 'package:flutter/material.dart';

/// Widget que carrega uma imagem de forma segura sem travar a aplicação
class SafeNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const SafeNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Usa Image.network com errorBuilder para evitar travamentos
    // Se a imagem falhar, mostra um container vazio em vez de travar
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        // Retorna um container vazio ao invés de travar
        return Container(
          width: width,
          height: height,
          color: Colors.transparent,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        // Mostra um placeholder enquanto carrega
        return Container(
          width: width,
          height: height,
          color: Colors.transparent,
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
    );
  }
}
