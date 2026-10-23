import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImage;

  const NewsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    backgroundImage,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFE2E8F0),
                        child: const Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 50,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 12,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF475569),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF475569),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsSection extends StatelessWidget {
  const NewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Novidades",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: 250,
            color: const Color(0xFF475569),
          ),
          const SizedBox(height: 24),
          const NewsCard(
            title: "Pacote Família",
            description: "Economize com o Pacote Família, e consiga passes mensais para toda a sua família.",
            backgroundImage: "https://api.builder.io/api/v1/image/assets/TEMP/95f2472b727eb44c944c1d9090c999c6fa9988bc?placeholderIfAbsent=true&apiKey=8c0df797c7ad4798ac7038148870966f?w300",
          ),
          const NewsCard(
            title: "Boas Festas",
            description: "Do dia 20/12 até 10/01 oferecemos descontos natalícios em quase todas as nossas viagens.",
            backgroundImage: "https://api.builder.io/api/v1/image/assets/TEMP/3e0f878bd6d7c6708e99542ffbf94b2195663f0d?placeholderIfAbsent=true&apiKey=8c0df797c7ad4798ac7038148870966f?w300",
          ),
        ],
      ),
    );
  }
}